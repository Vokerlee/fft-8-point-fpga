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
TB_DUMP = $(TB_LIST:%.v=$(DUMP_DIR)/%.dump)

all: build show

build: $(BUILD_DIR) $(TB_DUMP)

$(BUILD_DIR)/%_tb.out: $(SRC_DIR)/%.v $(TB_DIR)/%_tb.v
	$(SIMULATOR) $^ -o $@

$(DUMP_DIR)/%.dump: $(BUILD_DIR)/%.out $(DUMP_DIR)
	./$<
	mv dump.vcd $@

$(DUMP_DIR): $(BUILD_DIR)
	mkdir -p $@

$(BUILD_DIR):
	mkdir -p $@

show: $(TB_DUMP)
	gtkwave $^

clean:
	rm -rf $(BUILD)
