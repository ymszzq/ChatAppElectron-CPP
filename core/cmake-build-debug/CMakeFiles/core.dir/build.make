# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/core.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/core.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/core.dir/flags.make

CMakeFiles/core.dir/server.cpp.o: CMakeFiles/core.dir/flags.make
CMakeFiles/core.dir/server.cpp.o: ../server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/core.dir/server.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/server.cpp.o -c "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/server.cpp"

CMakeFiles/core.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/server.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/server.cpp" > CMakeFiles/core.dir/server.cpp.i

CMakeFiles/core.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/server.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/server.cpp" -o CMakeFiles/core.dir/server.cpp.s

CMakeFiles/core.dir/client.cpp.o: CMakeFiles/core.dir/flags.make
CMakeFiles/core.dir/client.cpp.o: ../client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/core.dir/client.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/client.cpp.o -c "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/client.cpp"

CMakeFiles/core.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/client.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/client.cpp" > CMakeFiles/core.dir/client.cpp.i

CMakeFiles/core.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/client.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/client.cpp" -o CMakeFiles/core.dir/client.cpp.s

CMakeFiles/core.dir/main.cpp.o: CMakeFiles/core.dir/flags.make
CMakeFiles/core.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/core.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/core.dir/main.cpp.o -c "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/main.cpp"

CMakeFiles/core.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/core.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/main.cpp" > CMakeFiles/core.dir/main.cpp.i

CMakeFiles/core.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/core.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/main.cpp" -o CMakeFiles/core.dir/main.cpp.s

# Object files for target core
core_OBJECTS = \
"CMakeFiles/core.dir/server.cpp.o" \
"CMakeFiles/core.dir/client.cpp.o" \
"CMakeFiles/core.dir/main.cpp.o"

# External object files for target core
core_EXTERNAL_OBJECTS =

core: CMakeFiles/core.dir/server.cpp.o
core: CMakeFiles/core.dir/client.cpp.o
core: CMakeFiles/core.dir/main.cpp.o
core: CMakeFiles/core.dir/build.make
core: CMakeFiles/core.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable core"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/core.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/core.dir/build: core

.PHONY : CMakeFiles/core.dir/build

CMakeFiles/core.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/core.dir/cmake_clean.cmake
.PHONY : CMakeFiles/core.dir/clean

CMakeFiles/core.dir/depend:
	cd "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core" "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core" "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug" "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug" "/Users/ziqianzhang/Google Drive/BCIT/Level4/4981/Assignment3/code/core/cmake-build-debug/CMakeFiles/core.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/core.dir/depend

