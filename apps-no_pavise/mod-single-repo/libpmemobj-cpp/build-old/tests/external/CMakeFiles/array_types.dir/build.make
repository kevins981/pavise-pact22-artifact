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
include tests/external/CMakeFiles/array_types.dir/depend.make

# Include the progress variables for this target.
include tests/external/CMakeFiles/array_types.dir/progress.make

# Include the compile flags for this target's objects.
include tests/external/CMakeFiles/array_types.dir/flags.make

tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o: tests/external/CMakeFiles/array_types.dir/flags.make
tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o: ../tests/external/libcxx/array/types.pass.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o -c /home/swapnilh/pmdk-stuff/libpmemobj-cpp/tests/external/libcxx/array/types.pass.cpp

tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.i"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/swapnilh/pmdk-stuff/libpmemobj-cpp/tests/external/libcxx/array/types.pass.cpp > CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.i

tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.s"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/swapnilh/pmdk-stuff/libpmemobj-cpp/tests/external/libcxx/array/types.pass.cpp -o CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.s

# Object files for target array_types
array_types_OBJECTS = \
"CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o"

# External object files for target array_types
array_types_EXTERNAL_OBJECTS =

tests/external/array_types: tests/external/CMakeFiles/array_types.dir/libcxx/array/types.pass.cpp.o
tests/external/array_types: tests/external/CMakeFiles/array_types.dir/build.make
tests/external/array_types: tests/libtest_backtrace.a
tests/external/array_types: tests/libvalgrind_internal.a
tests/external/array_types: tests/external/CMakeFiles/array_types.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable array_types"
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/array_types.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/external/CMakeFiles/array_types.dir/build: tests/external/array_types

.PHONY : tests/external/CMakeFiles/array_types.dir/build

tests/external/CMakeFiles/array_types.dir/clean:
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external && $(CMAKE_COMMAND) -P CMakeFiles/array_types.dir/cmake_clean.cmake
.PHONY : tests/external/CMakeFiles/array_types.dir/clean

tests/external/CMakeFiles/array_types.dir/depend:
	cd /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/swapnilh/pmdk-stuff/libpmemobj-cpp /home/swapnilh/pmdk-stuff/libpmemobj-cpp/tests/external /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external /home/swapnilh/pmdk-stuff/libpmemobj-cpp/build/tests/external/CMakeFiles/array_types.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/external/CMakeFiles/array_types.dir/depend

