# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/swapnilh/pmdk-stuff/libpmemobj-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/ex-queue.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/ex-queue.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/ex-queue.dir/flags.make

tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o: tests/CMakeFiles/ex-queue.dir/flags.make
tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o: ../examples/queue/queue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o -c /home/swapnilh/pmdk-stuff/libpmemobj-cpp/examples/queue/queue.cpp

tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.i"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/swapnilh/pmdk-stuff/libpmemobj-cpp/examples/queue/queue.cpp > CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.i

tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.s"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/swapnilh/pmdk-stuff/libpmemobj-cpp/examples/queue/queue.cpp -o CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.s

# Object files for target ex-queue
ex__queue_OBJECTS = \
"CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o"

# External object files for target ex-queue
ex__queue_EXTERNAL_OBJECTS =

tests/ex-queue: tests/CMakeFiles/ex-queue.dir/__/examples/queue/queue.cpp.o
tests/ex-queue: tests/CMakeFiles/ex-queue.dir/build.make
tests/ex-queue: tests/CMakeFiles/ex-queue.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ex-queue"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ex-queue.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/ex-queue.dir/build: tests/ex-queue

.PHONY : tests/CMakeFiles/ex-queue.dir/build

tests/CMakeFiles/ex-queue.dir/clean:
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/ex-queue.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/ex-queue.dir/clean

tests/CMakeFiles/ex-queue.dir/depend:
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/swapnilh/pmdk-stuff/libpmemobj-cpp /home/swapnilh/pmdk-stuff/libpmemobj-cpp/tests /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/CMakeFiles/ex-queue.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/ex-queue.dir/depend

