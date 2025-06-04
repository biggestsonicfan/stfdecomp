BUILD_DIR := build
TEMP_DIR := temp
ASM_DIR := src/asm
LIB_DIR := src/lib
SRC_DIR := src
CROSS := 960
GCC := gcc
INCLUDE_DIR := src/include
TOOL_DIR := tools
ROMTOOL    := rom
LINKTOOL  := gld
TARGET_PREFIX = rom_code
CPRES_PREFIX = cpres
ROM1 = epr-19001.15
ROM2 = epr-19002.16
ROM1_MD5 = 744e46113217fc92c21ee9a4b16ed138
ROM2_MD5 = 155bb4a50609a41e86f275fdba55211e
PYTHON := python
AS := gas

all:
	mkdir -p $(TEMP_DIR)
	# Make crt960 files
	make -C src/asm/init
	make -C src/asm/main
	make -C src/asm/common
	make -C src/asm/util
	
	$(LINKTOOL)$(CROSS) -v -T$(LIB_DIR)/$(TARGET_PREFIX)1.ld -Fbout -o $(TEMP_DIR)/$(TARGET_PREFIX)1.out \
 	-L$(TEMP_DIR)

	$(ROMTOOL)$(CROSS) $(LIB_DIR)/$(TARGET_PREFIX)1 $(TEMP_DIR)/$(TARGET_PREFIX)1.out $(BUILD_DIR)/$(TARGET_PREFIX)1 -L$(TEMP_DIR)

 clean:
	find . -name '*.o' -type f -exec rm -v {} \;
	rm -rf $(BUILD_DIR)



# 	# Intialize the directories
# 	mkdir -p $(TEMP_DIR)
# 	mkdir -p $(BUILD_DIR)/split

# 	# Extract the data from the ROM
# 	$(PYTHON) $(TOOL_DIR)/data_extract.py --all	

# 	$(GCC)$(CROSS) -r $(GCC_ARGS) \
# 		$(SRC_DIR)/asm/init/kx/kx_init.s \
# 		$(SRC_DIR)/asm/init/interrupt/table_to_ram.s \
# 		$(SRC_DIR)/asm/init/prcb/prcb_to_ram.s \
# 		$(SRC_DIR)/asm/init/ram/fix_prcb.s \
# 		$(SRC_DIR)/asm/init/copro/init.s \
# 		$(SRC_DIR)/asm/init/kx/kx.s \
# 		$(SRC_DIR)/asm/init/ram/buff_ram.s \
# 		-o $(TEMP_DIR)/crt0.o -I$(INCLUDE_DIR)

# 	$(GCC)$(CROSS) -r $(GCC_ARGS) \
# 		$(SRC_DIR)/asm/$(TARGET_PREFIX)1.s \
# 		$(SRC_DIR)/asm/init/warn/check.s \
# 		$(SRC_DIR)/asm/$(TARGET_PREFIX)1a.s \
# 		-o $(TEMP_DIR)/$(TARGET_PREFIX)_text.o  -I$(INCLUDE_DIR)

# 	$(GCC)$(CROSS) -r $(GCC_ARGS) \
# 		$(SRC_DIR)/asm/$(TARGET_PREFIX)2.s \
# 		$(SRC_DIR)/include/$(CPRES_PREFIX)1.s \
# 		$(SRC_DIR)/asm/$(TARGET_PREFIX)3.s \
# 		$(SRC_DIR)/include/$(CPRES_PREFIX)2.s \
# 		$(SRC_DIR)/asm/$(TARGET_PREFIX)4.s \
# 		-o $(TEMP_DIR)/$(TARGET_PREFIX)_data.o  -I$(INCLUDE_DIR)

# 	$(LINKTOOL)$(CROSS) -v -T$(LIB_DIR)/$(TARGET_PREFIX)1.ld -Fbout -o $(TEMP_DIR)/$(TARGET_PREFIX)1.out \
# 	$(TEMP_DIR)/crt0.o \
# 	$(TEMP_DIR)/$(TARGET_PREFIX)_text.o \
# 	$(TEMP_DIR)/$(TARGET_PREFIX)_data.o \
# 	-L$(TEMP_DIR)

# 	$(ROMTOOL)$(CROSS) $(LIB_DIR)/$(TARGET_PREFIX)1 $(TEMP_DIR)/$(TARGET_PREFIX)1.out $(BUILD_DIR)/$(TARGET_PREFIX)1
# 	mv $(BUILD_DIR)/$(TARGET_PREFIX)1.bin.00 $(BUILD_DIR)/split/$(ROM1)
# 	mv $(BUILD_DIR)/$(TARGET_PREFIX)1.bin.01 $(BUILD_DIR)/split/$(ROM2)
# 	echo "$(ROM1_MD5) $(BUILD_DIR)/split/$(ROM1)" | md5sum --check -
# 	echo "$(ROM2_MD5) $(BUILD_DIR)/split/$(ROM2)" | md5sum --check -

# clean:
# 	rm -rf $(TEMP_DIR)
# 	rm -rf $(BUILD_DIR)
# 	rm -f rom/*.bin
# 	rm -f src/include/cpres*.S
