cmake_minimum_required(VERSION 3.17)
project(stfdecomp)

# assumes that the toolchain is on the path
set(CMAKE_C_COMPILER i960-elf-gcc) # modify as needed
set(CMAKE_CXX_COMPILER i960-elf-g++) # for completeness
set(CMAKE_ASM-ATT_COMPILER i960-elf-as) # modify as needed
set(CMAKE_LINKER i960-elf-ld)

set(CMAKE_ASM-ATT_FLAGS "${CMAKE_ASM_FLAGS} -AKB -J")

add_executable(rom.bin
			rom_code1.asm
		)
target_link_options(rom.bin
	PRIVATE -AKB
	PRIVATE --oformat binary
	PRIVATE -e 0xB0
)


