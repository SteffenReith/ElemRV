export DESIGN_NAME = ElemRV
export PLATFORM    = ihp-sg13g2

export VERILOG_FILES = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/SG13G2Top.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export USE_FILL = 1

export PLACE_DENSITY ?= 0.88
export CORE_UTILIZATION = 20
export TNS_END_PERCENT = 100
