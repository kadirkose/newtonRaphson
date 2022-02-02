set_global_assignment -entity "fp_divider" -library "lib_fp_divider" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_divider" -library "lib_fp_divider" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "fp_divider" -library "lib_fp_divider" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_divider" -name SPD_FILE [file join $::quartus(sip_path) "fp_divider.spd"]

set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider_memoryC1_uid150_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider_memoryC0_uid146_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider_memoryC1_uid151_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider_memoryC0_uid147_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider_memoryC2_uid154_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_divider" -name MISC_FILE [file join $::quartus(sip_path) "fp_divider_sim/fp_divider.vhd"]
