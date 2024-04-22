current_design ElemRVTop

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_fanout 20 [current_design]
set_max_transition 3 [current_design]
set_max_area 0

set clock_ports [get_ports { \
    io_clock_PAD \
    io_jtag_tck_PAD \
}]

set clk_input_ports [get_ports { \
    io_reset_PAD \
    io_uartStd_rxd_PAD \
    io_uartStd_cts_PAD \
}]

set clk_output_ports [get_ports { \
    io_uartStd_txd_PAD \
    io_uartStd_rts_PAD \
    io_hyperbus_cs_0_PAD \
    io_hyperbus_reset_PAD \
    io_spiFlash_cs_0_PAD \
    io_spiFlash_sck_PAD \
}]
set clk_output_30mA_ports [get_ports { \
    io_hyperbus_ck_PAD \
}]

set clk_inout_ports [get_ports { \
    io_gpioStatus_0_PAD \
    io_gpioStatus_0_PAD \
    io_gpioStatus_0_PAD \
    io_gpioStatus_0_PAD \
    io_spiFlash_dq_0_PAD \
    io_spiFlash_dq_1_PAD \
}]
set clk_inout_30mA_ports [get_ports { \
    io_hyperbus_dq_0_PAD \
    io_hyperbus_dq_1_PAD \
    io_hyperbus_dq_2_PAD \
    io_hyperbus_dq_3_PAD \
    io_hyperbus_dq_4_PAD \
    io_hyperbus_dq_5_PAD \
    io_hyperbus_dq_6_PAD \
    io_hyperbus_dq_7_PAD \
    io_hyperbus_rwds_PAD \
}]

set jtag_input_ports [get_ports { \
    io_jtag_tms_PAD \
    io_jtag_tdi_PAD \
}]

set jtag_output_ports [get_ports { \
    io_jtag_tdo_PAD \
}]

set_driving_cell -lib_cell IOPadIn -pin pad $clock_ports
set_driving_cell -lib_cell IOPadIn -pin pad $clk_input_ports
set_driving_cell -lib_cell IOPadIn -pin pad $jtag_input_ports
set_driving_cell -lib_cell IOPadOut4mA -pin pad $clk_output_ports
set_driving_cell -lib_cell IOPadOut4mA -pin pad $jtag_output_ports
set_driving_cell -lib_cell IOPadOut30mA -pin pad $clk_output_30mA_ports
set_driving_cell -lib_cell IOPadInOut4mA -pin pad $clk_inout_ports
set_driving_cell -lib_cell IOPadInOut30mA -pin pad $clk_inout_30mA_ports

set_ideal_network [get_pins sg13g2_IOPadIn_5/p2c]
set_ideal_network [get_pins sg13g2_IOPadIn_1/p2c]
create_clock [get_pins sg13g2_IOPadIn_1/p2c] -name io_clock_PAD -period 40 -waveform {0 20}
create_clock [get_pins sg13g2_IOPadIn_5/p2c] -name io_jtag_tck_PAD -period 100 -waveform {0 50}
set_clock_uncertainty 0.15 [get_clocks io_clock_PAD]
set_clock_uncertainty 0.15 [get_clocks io_jtag_tck_PAD]
set_clock_transition 0.25 [get_clocks io_clock_PAD]
set_clock_transition 0.25 [get_clocks io_jtag_tck_PAD]

set_false_path -from [get_clocks io_clock_PAD] -to [get_clocks io_jtag_tck_PAD]
set_false_path -from [get_clocks io_jtag_tck_PAD] -to [get_clocks io_clock_PAD]

set_input_delay  8 -clock io_clock_PAD [get_ports { io_clock_PAD }]
set_input_delay  8 -clock io_jtag_tck_PAD [get_ports { io_jtag_tck_PAD }]
set_input_delay  8 -clock io_clock_PAD $clk_input_ports
set_input_delay  8 -clock io_jtag_tck_PAD $jtag_input_ports
set_input_delay  8 -clock io_clock_PAD $clk_inout_ports
set_output_delay 8 -clock io_clock_PAD $clk_output_ports
set_output_delay 8 -clock io_clock_PAD $clk_output_30mA_ports
set_output_delay 8 -clock io_jtag_tck_PAD $jtag_output_ports
set_output_delay 8 -clock io_clock_PAD $clk_inout_ports
set_output_delay 8 -clock io_clock_PAD $clk_inout_30mA_ports

# Remark: We should specify delays for all ports
# Warning: There are 20 input ports missing set_input_delay.
# Warning: There are 10 output ports missing set_output_delay.
# Warning: There are 23 unconstrained endpoints.


set_load -pin_load 5 [all_inputs]
set_load -pin_load 5 [all_outputs]
