set_global_assignment -entity "fp_comparator" -library "lib_fp_comparator" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_comparator" -library "lib_fp_comparator" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "fp_comparator" -library "lib_fp_comparator" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_comparator" -name SPD_FILE [file join $::quartus(sip_path) "fp_comparator.spd"]

set_global_assignment -library "lib_fp_comparator" -name MISC_FILE [file join $::quartus(sip_path) "fp_comparator_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_comparator" -name MISC_FILE [file join $::quartus(sip_path) "fp_comparator_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_comparator" -name MISC_FILE [file join $::quartus(sip_path) "fp_comparator_sim/fp_comparator.vhd"]
