set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_mult" -name SPD_FILE [file join $::quartus(sip_path) "fp_mult.spd"]

set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "fp_mult_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "fp_mult_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "fp_mult_sim/fp_mult.vhd"]
