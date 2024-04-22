export DESIGN_NAME     = ElemRVTop
export DESIGN_NICKNAME = ElemRV
export PLATFORM        = ihp-sg13g2

export IO_NAME = IOLib
export BONDPAD_NAME = bondpad_70x70

export VERILOG_FILES = \
	./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/ElemRVTop.v
export SDC_FILE = \
	./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export ADDITIONAL_LIBS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME)_dummy.lib
export ADDITIONAL_LEFS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME).lef \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(BONDPAD_NAME)/$(BONDPAD_NAME).lef
export ADDITIONAL_GDS  = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME).gds \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(BONDPAD_NAME)/$(BONDPAD_NAME).gds

# Available area: 1920um x 1920um
# Sealring: roughly 60um
# Remaining chip area: 1860um x 1860um
# I/O pads: 180um
# Bondpads: 70um
# Margin for core power ring: 80um
# Total margin to core area: 330um
# Core site: 0.48 x 3.78
export DIE_AREA = 0 0 1865.28 1867.32
export CORE_AREA = 330.24 332.64 1535.04 1534.68

# Allow routing on the TopMetal layers
export MAX_ROUTING_LAYER = TopMetal2

export USE_FILL = 1

export TNS_END_PERCENT = 100

export PLACE_DENSITY = 0.70

export FOOTPRINT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pad.tcl
export PDN_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pdn.tcl
