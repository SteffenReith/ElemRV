export DESIGN_NAME     = ElemRV
export DESIGN_NICKNAME = ElemRV
export PLATFORM        = ihp-sg13g2

export IO_DIR = $(SG13G2_IO_DIR_PATH)/ihp-sg13g2/libs.ref/sg13g2_io/

export VERILOG_FILES = \
	./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/ElemRV.v \
	$(IO_DIR)/verilog/sg13g2_io.v
export SDC_FILE = \
	./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# Available area: 4540um x 4540um
# Sealring: roughly 60um
# Remaining chip area: 4420um x 4420um
# I/O pads: 180um
# Bondpads: 70um
# Margin for core power ring: 80um
# Total margin to core area: 330um
# Core site: 0.48 x 3.78
#export DIE_AREA = 0 0 2660.64 2666.68
#export CORE_AREA = 330.24 332.64 2330.4 2336.04
export DIE_AREA = 0 0 4419.84 4418.82
export CORE_AREA = 330.24 328.86 4089.6 4089.96

# Allow routing on the TopMetal layers
export MAX_ROUTING_LAYER = TopMetal2

export USE_FILL = 1

export TNS_END_PERCENT = 100

export FOOTPRINT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pad.tcl
export PDN_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pdn.tcl

export ADDITIONAL_LEFS = \
	$(IO_DIR)/lef/sg13g2_io.lef \
	$(IO_DIR)/lef/bondpad_70x70.lef
export ADDITIONAL_GDS = \
	$(IO_DIR)/gds/sg13g2_io.gds \
	$(IO_DIR)/gds/bondpad_70x70.gds
export ADDITIONAL_LIBS = \
	$(IO_DIR)/liberty/sg13g2_io_dummy.lib
