set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set MAX_NUM_PADS 12

proc calc_horizontal_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global MAX_NUM_PADS

    set DIE_WIDTH [expr {[lindex $::env(DIE_AREA) 2] - [lindex $::env(DIE_AREA) 0]}]
    set PAD_AREA_WIDTH [expr {$DIE_WIDTH - $IO_LENGTH - $IO_LENGTH}]
    set HORIZONTAL_PAD_DISTANCE [expr {$PAD_AREA_WIDTH / ( $MAX_NUM_PADS + 1 )}]

    return [expr {$IO_LENGTH - ( $IO_WIDTH / 2 ) + $HORIZONTAL_PAD_DISTANCE * ( $index + 1 )}]
}

proc calc_vertical_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global MAX_NUM_PADS

    set DIE_HEIGHT [expr {[lindex $::env(DIE_AREA) 3] - [lindex $::env(DIE_AREA) 1]}]
    set PAD_AREA_HEIGHT [expr {$DIE_HEIGHT - $IO_LENGTH - $IO_LENGTH}]
    set VERTICAL_PAD_DISTANCE [expr {$PAD_AREA_HEIGHT / ( $MAX_NUM_PADS + 1 )}]

    return [expr {$IO_LENGTH - ( $IO_WIDTH / 2 ) + $VERTICAL_PAD_DISTANCE * ( $index + 1 )}]
}

make_fake_io_site -name IOLibSite -width 1 -height $IO_LENGTH
make_fake_io_site -name IOLibCSite -width $IO_LENGTH -height $IO_LENGTH

# Create IO Rows
make_io_sites \
    -horizontal_site IOLibSite \
    -vertical_site IOLibSite \
    -corner_site IOLibCSite \
    -offset $BONDPAD_SIZE

# Place Pads
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  0] {iOPad_pwr_io_s1} -master sg13g2_IOPadIOVdd
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  1] {iOPad_gnd_io_s1} -master sg13g2_IOPadIOVss
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  2] {iOPad_gnd_core_s1} -master sg13g2_IOPadVss
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  3] {iOPad_pwr_core_s1} -master sg13g2_IOPadVdd
# jtag tms
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  4] {iOPadIn_3}
# jtag tdi
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  5] {iOPadIn_4}
# jtag tdo
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  6] {iOPadOut4mA_1}
# jtag tck
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  7] {iOPadIn_5}
# uart rxd
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  8] {iOPadIn_6}
# uart cts
place_pad -row IO_SOUTH -location [calc_vertical_pad_location  9] {iOPadIn_7}
# uart txd
place_pad -row IO_SOUTH -location [calc_vertical_pad_location 10] {iOPadOut4mA_2}
# uart rts
place_pad -row IO_SOUTH -location [calc_vertical_pad_location 11] {iOPadOut4mA_3}


place_pad -row IO_EAST -location [calc_horizontal_pad_location  0] {iOPad_pwr_io_e1} -master sg13g2_IOPadIOVdd
place_pad -row IO_EAST -location [calc_horizontal_pad_location  1] {iOPad_gnd_io_e1} -master sg13g2_IOPadIOVss
place_pad -row IO_EAST -location [calc_horizontal_pad_location  2] {iOPad_gnd_core_e1} -master sg13g2_IOPadVss
place_pad -row IO_EAST -location [calc_horizontal_pad_location  3] {iOPad_pwr_core_e1} -master sg13g2_IOPadVdd
# gpio 0
place_pad -row IO_EAST -location [calc_horizontal_pad_location  4] {iOPadInOut4mA_1}
# clock
place_pad -row IO_EAST -location [calc_horizontal_pad_location  5] {iOPadIn_1}
# reset
place_pad -row IO_EAST -location [calc_horizontal_pad_location  6] {iOPadIn_2}
# hyperbus reset
place_pad -row IO_EAST -location [calc_horizontal_pad_location  7] {iOPadOut4mA_5}
# hyperbus cs
place_pad -row IO_EAST -location [calc_horizontal_pad_location  8] {iOPadOut4mA_4}
# hyperbus rwds
place_pad -row IO_EAST -location [calc_horizontal_pad_location  9] {iOPadInOut30mA_9}
# hyperbus clock
place_pad -row IO_EAST -location [calc_horizontal_pad_location 10] {iOPadOut30mA_1}


place_pad -row IO_NORTH -location [calc_vertical_pad_location  0] {iOPad_pwr_io_n1} -master sg13g2_IOPadIOVdd
place_pad -row IO_NORTH -location [calc_vertical_pad_location  1] {iOPad_gnd_io_n1} -master sg13g2_IOPadIOVss
# hyperbus dq0-7
place_pad -row IO_NORTH -location [calc_vertical_pad_location  2] {iOPadInOut30mA_1}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  3] {iOPadInOut30mA_2}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  4] {iOPadInOut30mA_3}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  5] {iOPadInOut30mA_4}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  6] {iOPadInOut30mA_5}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  7] {iOPadInOut30mA_6}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  8] {iOPadInOut30mA_7}
place_pad -row IO_NORTH -location [calc_vertical_pad_location  9] {iOPadInOut30mA_8}
place_pad -row IO_NORTH -location [calc_vertical_pad_location 10] {iOPad_gnd_io_n2} -master sg13g2_IOPadIOVss
place_pad -row IO_NORTH -location [calc_vertical_pad_location 11] {iOPad_pwr_io_n2} -master sg13g2_IOPadIOVdd

place_pad -row IO_WEST -location [calc_horizontal_pad_location  0] {iOPad_pwr_io_w1} -master sg13g2_IOPadIOVdd
place_pad -row IO_WEST -location [calc_horizontal_pad_location  1] {iOPad_gnd_io_w1} -master sg13g2_IOPadIOVss
place_pad -row IO_WEST -location [calc_horizontal_pad_location  2] {iOPad_gnd_core_w1} -master sg13g2_IOPadVss
place_pad -row IO_WEST -location [calc_horizontal_pad_location  3] {iOPad_pwr_core_w1} -master sg13g2_IOPadVdd
# spi cs0
place_pad -row IO_WEST -location [calc_horizontal_pad_location  4] {iOPadOut4mA_6}
# spi sck
place_pad -row IO_WEST -location [calc_horizontal_pad_location  5] {iOPadOut4mA_7}
# spi dq0
place_pad -row IO_WEST -location [calc_horizontal_pad_location  6] {iOPadInOut4mA_5}
# spi dq1
place_pad -row IO_WEST -location [calc_horizontal_pad_location  7] {iOPadInOut4mA_6}
# gpio 1
place_pad -row IO_WEST -location [calc_horizontal_pad_location  8] {iOPadInOut4mA_2}
# gpio 2
place_pad -row IO_WEST -location [calc_horizontal_pad_location  9] {iOPadInOut4mA_3}
# gpio 3
place_pad -row IO_WEST -location [calc_horizontal_pad_location 10] {iOPadInOut4mA_4}


# Place Corner Cells and Filler
place_corners sg13g2_Corner

set iofill {
    sg13g2_Filler200
    sg13g2_Filler400
    sg13g2_Filler1000
    sg13g2_Filler2000
    sg13g2_Filler4000
    sg13g2_Filler10000
}

place_io_fill -row IO_NORTH {*}$iofill
place_io_fill -row IO_SOUTH {*}$iofill
place_io_fill -row IO_WEST {*}$iofill
place_io_fill -row IO_EAST {*}$iofill

connect_by_abutment

place_bondpad -bond bondpad_70x70 iOPad* -offset {5.0 -70.0}

remove_io_rows
