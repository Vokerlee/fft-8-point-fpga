SIMULATOR = iverilog

SRC_DIR = src
TB_DIR = testbench
BUILD_DIR = build
DUMP_DIR = $(BUILD_DIR)/dump

SRC = $(wildcard $(SRC_DIR)/*.v)
SRC_LIST = $(notdir $(SRC))

TB_SRC = $(wildcard $(TB_DIR)/*.v)
TB_LIST = $(notdir $(TB_SRC))

TB_OUT = $(SRC_LIST:%.v=$(BUILD_DIR)/%_tb.out)
TB_DUMP = $(TB_LIST:%.v=$(DUMP_DIR)/%.vcd)

all: build

build: $(DUMP_DIR) $(TB_DUMP)

$(BUILD_DIR)/%_tb.out: $(SRC) $(TB_DIR)/%_tb.v
	$(SIMULATOR) $^ -o $@

$(DUMP_DIR)/%.vcd: $(BUILD_DIR)/%.out $(DUMP_DIR)
	./$<
	mv $(notdir $@) $@
	echo "=================================================="

$(DUMP_DIR): $(BUILD_DIR)
	mkdir -p $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)
