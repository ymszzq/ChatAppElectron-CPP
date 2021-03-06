/*---------------------------------------------------------------------------------------
--	SOURCE FILE:    server.cpp - The server mode for the Linux Chat program
--
--	PROGRAM:        Linux Chat
--
--	FUNCTIONS:      int enterServer()
--                  static void SystemFatal(const char *message)
--                  void clean(int clientIndex, int closeSockfd)
--
--	DATE:			March 8, 2019
--
--	REVISIONS:	    (Date and Description)
--
--	DESIGNER:		Ziqian Zhang, Viktor Alvar
--
--	PROGRAMMER:		Ziqian Zhang, Viktor Alvar
--
--	NOTES:
--	The program will accept TCP connections from multiple client machines.
-- 	The program will read data from each client socket and simply echo it back.
---------------------------------------------------------------------------------------*/

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <strings.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>

#define SERVER_TCP_PORT  7000    // Default port
#define BUFLEN           200     // Buffer length
#define TRUE             1
#define LISTENQ          5
#define MAXLINE          4096

// Global Variables
char client_address_arr[FD_SETSIZE][20];
int client[FD_SETSIZE];
fd_set rset, allset;

// Function Prototypes
static void SystemFatal(const char *);
void clean(int clientIndex, int closeSockfd);

/*---------------------------------------------------------------------------------------
--	FUNCTION:		enterServer
--
--	DATE:			March 8, 2019
--
--	REVISIONS:	    (Date and Description)
--
--	DESIGNER:		Ziqian Zhang, Viktor Alvar
--
--	PROGRAMMER:		Ziqian Zhang, Viktor Alvar
--
--	INTERFACE:      int enterServer()
--
--	RETURNS:		int.
--
--	NOTES:
--  Starts the server functionality. Creates a listening socket and accepts multiple
--  clients. When a client sends data, that data is echoed back to all the other
--  clients except for the one who sent the data.
---------------------------------------------------------------------------------------*/
int enterServer() {
    int listen_sd, new_sd, sockfd, client_len, port, maxfd;
    struct	in_addr sin_addrArr[FD_SETSIZE];
    int i, maxi, nready, bytes_to_read, arg;

    struct sockaddr_in server, addr;
    char *bp, buf[BUFLEN];
    ssize_t n;

    port = SERVER_TCP_PORT;

    // Create a stream socket
    if ((listen_sd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
        SystemFatal("Cannot Create Socket!");

    // set SO_REUSEADDR so port can be resused imemediately after exit, i.e., after CTRL-c
    arg = 1;
    if (setsockopt(listen_sd, SOL_SOCKET, SO_REUSEADDR, &arg, sizeof(arg)) == -1)
        SystemFatal("setsockopt");

    // Bind an address to the socket
    bzero((char *) &server, sizeof(struct sockaddr_in));
    server.sin_family = AF_INET;
    server.sin_port = htons(port);
    server.sin_addr.s_addr = htonl(INADDR_ANY); // Accept connections from any client

    if (bind(listen_sd, (struct sockaddr *) &server, sizeof(server)) == -1)
        SystemFatal("bind error");

    // Listen for connections
    // queue up to LISTENQ connect requests
    listen(listen_sd, LISTENQ);

    maxfd = listen_sd; // initialize
    maxi = -1; // index into client[] array

    for (i = 0; i < FD_SETSIZE; i++)
        client[i] = -1; // -1 indicates available entry

    FD_ZERO(&allset);
    FD_SET(listen_sd, &allset);

    while (TRUE) {
        rset = allset; // structure assignment
        nready = select(maxfd + 1, &rset, NULL, NULL, NULL);

        // new client connection
        if (FD_ISSET(listen_sd, &rset)) {
            client_len = sizeof(addr);
            if ((new_sd = accept(listen_sd, (struct sockaddr *) &addr, (socklen_t *) &client_len)) == -1)
                SystemFatal("accept error");

            printf(" \nRemote Address:  %s\n", inet_ntoa(addr.sin_addr));
            fflush(stdout);

            for (i = 0; i < FD_SETSIZE; i++) {
                if (client[i] < 0) {
                    client[i] = new_sd; // save descriptor
                    sin_addrArr[i] = addr.sin_addr;
                    sscanf(inet_ntoa(addr.sin_addr), "%s", client_address_arr[i]);
                    break;
                }
            }

            if (i == FD_SETSIZE) {
                printf("Too many clients\n");
                exit(1);
            }

            FD_SET (new_sd, &allset); // add new descriptor to set
            if (new_sd > maxfd)
                maxfd = new_sd; // for select

            if (i > maxi)
                maxi = i; // new max index in client[] array

            if (--nready <= 0)
                continue; // no more readable descriptors
        }

        // check all clients for data
        for (i = 0; i <= maxi; i++) {
            if ((sockfd = client[i]) < 0)
                continue;

            if (FD_ISSET(sockfd, &rset)) {
                bp = buf;
                bytes_to_read = BUFLEN;
                while ((n = read(sockfd, bp, bytes_to_read)) > 0) {
                    bp += n;
                    bytes_to_read -= n;
                }

                if (buf[0]=='~' && buf[1]=='!') {
                    std::cout << "client exit";
                    clean(i,sockfd);
                } else {
                    int currentSockfd = sockfd;
                    int currentIndex = i;
                    printf("client# %d IP:%s message:\t\t%s\r\n",currentIndex,client_address_arr[currentIndex],buf);
                    fflush(stdout);

                    for (i = 0; i <= maxi; i++) {
                        if ((sockfd = client[i]) < 0 || sockfd == currentSockfd)
                            continue;

                        char tempSendCombine[BUFLEN];
                        sprintf(tempSendCombine,"%d::::%s:::%s",currentIndex,client_address_arr[currentIndex],buf);
                        write(sockfd, tempSendCombine, BUFLEN);
                    }
                }

                if (--nready <= 0)
                    break; // no more readable descriptors
            }
        }
    }
    return (0);
}

/*---------------------------------------------------------------------------------------
--	FUNCTION:		SystemFatal
--
--	DATE:			March 8, 2019
--
--	REVISIONS:	    (Date and Description)
--
--	DESIGNER:		Ziqian Zhang, Viktor Alvar
--
--	PROGRAMMER:		Ziqian Zhang
--
--	INTERFACE:      static void SystemFatal(const char *message)
--
--	RETURNS:		void.
--
--	NOTES:
--  Prints the error stored in errno and aborts the program.
---------------------------------------------------------------------------------------*/
static void SystemFatal(const char *message) {
    perror(message);
    exit(EXIT_FAILURE);
}

/*---------------------------------------------------------------------------------------
--	FUNCTION:		clean
--
--	DATE:			March 8, 2019
--
--	REVISIONS:	    (Date and Description)
--
--	DESIGNER:		Ziqian Zhang, Viktor Alvar
--
--	PROGRAMMER:		Ziqian Zhang
--
--	INTERFACE:      void clean(int clientIndex, int closeSockfd)
--                      int clientIndex: The index of client in client[]
--                      int closeSockfd: The socket descriptors of the socket
--
--	RETURNS:		void.
--
--	NOTES:
--  Cleans the socket by closing the socket, clearing it from the set of file
--  descriptors, and removing it from the client[] array. This funciton is called when
--  the server receives a closing message from the client who disconnected.
---------------------------------------------------------------------------------------*/
void clean(int clientIndex, int closeSockfd) {
    printf(" Remote Address:  %s closed connection\n", client_address_arr[clientIndex]);
    fflush(stdout);
    close(closeSockfd);
    FD_CLR(closeSockfd, &allset);
    client[clientIndex] = -1;
}