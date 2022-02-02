set_global_assignment -entity "fp_substractor" -library "lib_fp_substractor" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_substractor" -library "lib_fp_substractor" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "fp_substractor" -library "lib_fp_substractor" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_substractor" -name SPD_FILE [file join $::quartus(sip_path) "fp_substractor.spd"]

set_global_assignment -library "lib_fp_substractor" -name MISC_FILE [file join $::quartus(sip_path) "fp_substractor_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_substractor" -name MISC_FILE [file join $::quartus(sip_path) "fp_substractor_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_substractor" -name MISC_FILE [file join $::quartus(sip_path) "fp_substractor_sim/fp_substractor.vhd"]
