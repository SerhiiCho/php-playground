# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /home/serhii/apps/clion-2019.1.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/serhii/apps/clion-2019.1.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/serhii/www/pg/c-code/first-program

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/serhii/www/pg/c-code/first-program/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/first_program.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/first_program.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/first_program.dir/flags.make

CMakeFiles/first_program.dir/main.c.o: CMakeFiles/first_program.dir/flags.make
CMakeFiles/first_program.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/serhii/www/pg/c-code/first-program/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/first_program.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/first_program.dir/main.c.o   -c /home/serhii/www/pg/c-code/first-program/main.c

CMakeFiles/first_program.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/first_program.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/serhii/www/pg/c-code/first-program/main.c > CMakeFiles/first_program.dir/main.c.i

CMakeFiles/first_program.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/first_program.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/serhii/www/pg/c-code/first-program/main.c -o CMakeFiles/first_program.dir/main.c.s

# Object files for target first_program
first_program_OBJECTS = \
"CMakeFiles/first_program.dir/main.c.o"

# External object files for target first_program
first_program_EXTERNAL_OBJECTS =

first_program: CMakeFiles/first_program.dir/main.c.o
first_program: CMakeFiles/first_program.dir/build.make
first_program: CMakeFiles/first_program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/serhii/www/pg/c-code/first-program/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable first_program"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/first_program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/first_program.dir/build: first_program

.PHONY : CMakeFiles/first_program.dir/build

CMakeFiles/first_program.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/first_program.dir/cmake_clean.cmake
.PHONY : CMakeFiles/first_program.dir/clean

CMakeFiles/first_program.dir/depend:
	cd /home/serhii/www/pg/c-code/first-program/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/serhii/www/pg/c-code/first-program /home/serhii/www/pg/c-code/first-program /home/serhii/www/pg/c-code/first-program/cmake-build-debug /home/serhii/www/pg/c-code/first-program/cmake-build-debug /home/serhii/www/pg/c-code/first-program/cmake-build-debug/CMakeFiles/first_program.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/first_program.dir/depend

