set_global_assignment -entity "fp_pow" -library "lib_fp_pow" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_pow" -library "lib_fp_pow" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "fp_pow" -library "lib_fp_pow" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_pow" -name SPD_FILE [file join $::quartus(sip_path) "fp_pow.spd"]

set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC2_uid263_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC1_uid258_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC1_uid451_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC2_uid454_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC2_uid262_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC0_uid447_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC3_uid457_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC0_uid255_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC1_uid259_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC0_uid254_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow_memoryC3_uid266_lnTables_lutmem.hex"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_pow" -name MISC_FILE [file join $::quartus(sip_path) "fp_pow_sim/fp_pow.vhd"]
