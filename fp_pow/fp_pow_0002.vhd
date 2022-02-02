-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 20.1 (Release Build #720)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2020 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_pow_0002
-- VHDL created on Wed Feb  2 16:30:55 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_pow_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_pow_0002;

architecture normal of fp_pow_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllZWF_uid6_fpPowrTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid7_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasMO_uid8_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid11_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid13_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid14_fpPowrTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid15_fpPowrTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid16_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid16_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid17_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid17_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid19_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid20_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid20_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid21_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid21_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid22_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid23_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid24_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid28_fpPowrTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid29_fpPowrTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid30_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid30_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid31_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid31_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid33_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid34_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid35_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid36_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid37_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid38_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid39_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid42_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstOneFPExpFrac_uid45_fpPowrTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracX_uid46_fpPowrTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal xEQOneAbs_uid47_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xEQOneAbs_uid47_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal e_uid48_fpPowrTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid48_fpPowrTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid48_fpPowrTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid48_fpPowrTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal caseLog_uid50_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addrFull_uid51_fpPowrTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yAddr_uid53_fpPowrTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal zPPolyEvalLog_uid54_fpPowrTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal zPPolyEvalLog_uid54_fpPowrTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal peORNatLog_uid56_fpPowrTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal peORNatLog_uid56_fpPowrTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal aPostPad_uid58_fpPowrTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oMzLog_uid59_fpPowrTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal oMzLog_uid59_fpPowrTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal oMzLog_uid59_fpPowrTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal oMzLog_uid59_fpPowrTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal z2_uid60_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sEzLog_uid61_fpPowrTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal multTermOneLog_uid63_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal multTermOneLog_uid63_fpPowrTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lowRangeB_uid67_fpPowrTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeB_uid67_fpPowrTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal highBBits_uid68_fpPowrTest_in : STD_LOGIC_VECTOR (59 downto 0);
    signal highBBits_uid68_fpPowrTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal finalSumLogsumAHighB_uid69_fpPowrTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal finalSumLogsumAHighB_uid69_fpPowrTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal finalSumLogsumAHighB_uid69_fpPowrTest_i : STD_LOGIC_VECTOR (45 downto 0);
    signal finalSumLogsumAHighB_uid69_fpPowrTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal finalSumLogsumAHighB_uid69_fpPowrTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal finalSumLog_uid70_fpPowrTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal finalSumSignLog_uid71_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal finalSumOneCompLog_uid73_fpPowrTest_b : STD_LOGIC_VECTOR (65 downto 0);
    signal finalSumOneCompLog_uid73_fpPowrTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal finalSumAbsLog_uid74_fpPowrTest_a : STD_LOGIC_VECTOR (66 downto 0);
    signal finalSumAbsLog_uid74_fpPowrTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal finalSumAbsLog_uid74_fpPowrTest_o : STD_LOGIC_VECTOR (66 downto 0);
    signal finalSumAbsLog_uid74_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal notCaseLog_uid77_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signSignLog_uid78_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRLog0_uid79_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRLog0_uid79_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRLog_uid80_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRLog_uid80_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstMSBFinalSumPBias_uid81_fpPowrTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExtLog_uid82_fpPowrTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExtLog_uid82_fpPowrTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExtLog_uid82_fpPowrTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExtLog_uid82_fpPowrTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPreRndLog_uid83_fpPowrTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal fracRPreRndLog_uid83_fpPowrTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal expFracConc_uid84_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal expFracPostRndLog_uid86_fpPowrTest_a : STD_LOGIC_VECTOR (44 downto 0);
    signal expFracPostRndLog_uid86_fpPowrTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal expFracPostRndLog_uid86_fpPowrTest_o : STD_LOGIC_VECTOR (44 downto 0);
    signal expFracPostRndLog_uid86_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal fracRLog_uid87_fpPowrTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal fracRLog_uid87_fpPowrTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expRLog_uid88_fpPowrTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal expRLog_uid88_fpPowrTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal oFracY_uid89_fpPowrTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracLog_uid90_fpPowrTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodNormBit_uid92_fpPowrTest_in : STD_LOGIC_VECTOR (57 downto 0);
    signal prodNormBit_uid92_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normProdYLogXHigh_uid94_fpPowrTest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal normProdYLogXHigh_uid94_fpPowrTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal normProdYLogXLow_uid95_fpPowrTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal normProdYLogXLow_uid95_fpPowrTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal normProdYLogX_uid96_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normProdYLogX_uid96_fpPowrTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal oFracProd_uid97_fpPowrTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal expProdPhase1_uid98_fpPowrTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expProdPhase1_uid98_fpPowrTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expProdPhase1_uid98_fpPowrTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expProdPhase1_uid98_fpPowrTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expProdPhase2_uid99_fpPowrTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expProdPhase2_uid99_fpPowrTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expProdPhase2_uid99_fpPowrTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expProdPhase2_uid99_fpPowrTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expProdPre_uid100_fpPowrTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expProdPre_uid100_fpPowrTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expProdPre_uid100_fpPowrTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expProdPre_uid100_fpPowrTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal msbuExpProdPre_uid101_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invMsbuExpProdPre_uid102_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expProd_uid103_fpPowrTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expProd_uid103_fpPowrTest_qi : STD_LOGIC_VECTOR (11 downto 0);
    signal expProd_uid103_fpPowrTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal signProd_uid104_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroWEP1_uid106_fpPowrTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cstBiasPWE_uid107_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPWE_uid108_fpPowrTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal zoFracQ_uid109_fpPowrTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal onesCmpFxpInQ_uid110_fpPowrTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal onesCmpFxpInQ_uid110_fpPowrTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExtQ_uid111_fpPowrTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpInExtQ_uid111_fpPowrTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpInExtQ_uid111_fpPowrTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpInExtQ_uid111_fpPowrTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpInQPreConstMult_uid112_fpPowrTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInQPreConstMult_uid112_fpPowrTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracXZwE_uid115_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal shiftValuePreSatExp_uid117_fpPowrTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftValuePreSatExp_uid117_fpPowrTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftValuePreSatExp_uid117_fpPowrTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftValuePreSatExp_uid117_fpPowrTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvfInitialExp_uid118_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftUdfExp_uid119_fpPowrTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftUdfExp_uid119_fpPowrTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftUdfExp_uid119_fpPowrTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftUdfExp_uid119_fpPowrTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePreSatRedExp_uid120_fpPowrTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePreSatRedExp_uid120_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValExp_uid121_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValExp_uid121_fpPowrTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal ePreRndExp_uid124_fpPowrTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal oFracQZwE_uid127_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal onesCmpFxpInQ2_uid128_fpPowrTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal onesCmpFxpInQ2_uid128_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal fxpInExtQ2_uid129_fpPowrTest_a : STD_LOGIC_VECTOR (44 downto 0);
    signal fxpInExtQ2_uid129_fpPowrTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal fxpInExtQ2_uid129_fpPowrTest_o : STD_LOGIC_VECTOR (44 downto 0);
    signal fxpInExtQ2_uid129_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal fxpInPreAlignQ2_uid130_fpPowrTest_in : STD_LOGIC_VECTOR (43 downto 0);
    signal fxpInPreAlignQ2_uid130_fpPowrTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal aPostPad_uid138_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal yExtExp_uid139_fpPowrTest_a : STD_LOGIC_VECTOR (46 downto 0);
    signal yExtExp_uid139_fpPowrTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal yExtExp_uid139_fpPowrTest_o : STD_LOGIC_VECTOR (46 downto 0);
    signal yExtExp_uid139_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal yExtNeg_uid140_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zY_uid141_fpPowrTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yRed_uid142_fpPowrTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal yRed_uid142_fpPowrTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal yRedPostMux_uid143_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yRedPostMux_uid143_fpPowrTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal peORExp_uid148_fpPowrTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal peORExp_uid148_fpPowrTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal peORExpInc_uid149_fpPowrTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal peORExpInc_uid149_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostBiasPreExc0_uid150_fpPowrTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid150_fpPowrTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid150_fpPowrTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid150_fpPowrTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPostBiasPreExc_uid151_fpPowrTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid151_fpPowrTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid151_fpPowrTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid151_fpPowrTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal fracR_uid152_fpPowrTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid152_fpPowrTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid153_fpPowrTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid153_fpPowrTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid154_fpPowrTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid154_fpPowrTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid154_fpPowrTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid154_fpPowrTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid156_fpPowrTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid156_fpPowrTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid156_fpPowrTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid156_fpPowrTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid160_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignY_uid161_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXIsOne_uid162_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracXGTExpFracOne_uid163_fpPowrTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracXGTExpFracOne_uid163_fpPowrTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracXGTExpFracOne_uid163_fpPowrTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracXGTExpFracOne_uid163_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTOne_uid164_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTOne_uid164_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZO_uid166_fpPowrTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal xInZO_uid166_fpPowrTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal xInZO_uid166_fpPowrTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal xInZO_uid166_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZOZPos_uid167_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZOZPos_uid167_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yRegOrInf_uid168_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yRegOrInf_uid168_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase6_uid169_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase6_uid169_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase5_uid170_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase4_uid172_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase3_uid173_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase2_uid174_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase1_uid175_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroCase0_uid176_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid177_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignProd_uid178_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase5_uid179_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase5_uid179_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpOvfInitialExp_uid180_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase4_uid181_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase3_uid183_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase2_uid184_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase1_uid185_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infCase0_uid186_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid187_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid188_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrInf_uid189_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanCase4_uid190_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanCase3_uid191_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanCase2_uid192_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanCase1_uid193_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid194_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid194_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excROne_uid195_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostOne_uid196_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostOne_uid196_fpPowrTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostOne_uid197_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostOne_uid197_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal concExc_uid198_fpPowrTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid199_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid200_fpPowrTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid203_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid203_fpPowrTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid207_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid207_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal RPowr_uid208_fpPowrTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xv0_uid210_eLn2_uid49_fpPowrTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid210_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid211_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal p1_uid212_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal p0_uid213_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_a : STD_LOGIC_VECTOR (49 downto 0);
    signal lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (49 downto 0);
    signal lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_o : STD_LOGIC_VECTOR (49 downto 0);
    signal lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal lev1_a0_uid217_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (49 downto 0);
    signal maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal minValueInFormat_uid219_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal paddingX_uid220_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal updatedX_uid221_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal ovf_uid220_eLn2_uid49_fpPowrTest_a : STD_LOGIC_VECTOR (51 downto 0);
    signal ovf_uid220_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal ovf_uid220_eLn2_uid49_fpPowrTest_o : STD_LOGIC_VECTOR (51 downto 0);
    signal ovf_uid220_eLn2_uid49_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid224_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal udf_uid223_eLn2_uid49_fpPowrTest_a : STD_LOGIC_VECTOR (51 downto 0);
    signal udf_uid223_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal udf_uid223_eLn2_uid49_fpPowrTest_o : STD_LOGIC_VECTOR (51 downto 0);
    signal udf_uid223_eLn2_uid49_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid226_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid227_eLn2_uid49_fpPowrTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal sR_uid227_eLn2_uid49_fpPowrTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal sRA0_uid228_eLn2_uid49_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid228_eLn2_uid49_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal os_uid256_lnTables_q : STD_LOGIC_VECTOR (39 downto 0);
    signal os_uid260_lnTables_q : STD_LOGIC_VECTOR (29 downto 0);
    signal os_uid264_lnTables_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yT1_uid273_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid275_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid275_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid276_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid277_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid277_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid277_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid277_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid278_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid281_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid281_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid282_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s2sumAHighB_uid283_invPolyEval_a : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid283_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid283_invPolyEval_o : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid283_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal s2_uid284_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal lowRangeB_uid287_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid287_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid288_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal s3sumAHighB_uid289_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid289_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid289_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid289_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid290_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal zs_uid292_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rVStage_uid293_countZLog_uid75_fpPowrTest_b : STD_LOGIC_VECTOR (63 downto 0);
    signal vCount_uid294_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid295_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (60 downto 0);
    signal vStage_uid296_countZLog_uid75_fpPowrTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal vStage_uid296_countZLog_uid75_fpPowrTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal cStage_uid297_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal vStagei_uid299_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid299_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal zs_uid300_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid302_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid305_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid305_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid306_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid308_countZLog_uid75_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid308_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid311_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid311_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid314_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid317_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid317_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid318_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid320_countZLog_uid75_fpPowrTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid320_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid323_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid323_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid326_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid329_countZLog_uid75_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid329_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid331_countZLog_uid75_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid332_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid333_countZLog_uid75_fpPowrTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (44 downto 0);
    signal lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (44 downto 0);
    signal lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal lev1_a0_uid350_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (46 downto 0);
    signal lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (46 downto 0);
    signal lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (47 downto 0);
    signal lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (47 downto 0);
    signal lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal minValueInFormat_uid356_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal updatedX_uid358_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (48 downto 0);
    signal ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (48 downto 0);
    signal ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid361_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_a : STD_LOGIC_VECTOR (48 downto 0);
    signal udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_o : STD_LOGIC_VECTOR (48 downto 0);
    signal udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid363_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal xv0_uid401_eRndXlog2_uid125_fpPowrTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid401_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid402_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal p1_uid403_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal p0_uid404_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_a : STD_LOGIC_VECTOR (50 downto 0);
    signal lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_o : STD_LOGIC_VECTOR (50 downto 0);
    signal lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (49 downto 0);
    signal lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (50 downto 0);
    signal maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal minValueInFormat_uid410_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal updatedX_uid412_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal ovf_uid411_eRndXlog2_uid125_fpPowrTest_a : STD_LOGIC_VECTOR (52 downto 0);
    signal ovf_uid411_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal ovf_uid411_eRndXlog2_uid125_fpPowrTest_o : STD_LOGIC_VECTOR (52 downto 0);
    signal ovf_uid411_eRndXlog2_uid125_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid415_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal udf_uid414_eRndXlog2_uid125_fpPowrTest_a : STD_LOGIC_VECTOR (52 downto 0);
    signal udf_uid414_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal udf_uid414_eRndXlog2_uid125_fpPowrTest_o : STD_LOGIC_VECTOR (52 downto 0);
    signal udf_uid414_eRndXlog2_uid125_fpPowrTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid417_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid418_eRndXlog2_uid125_fpPowrTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal sR_uid418_eRndXlog2_uid125_fpPowrTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal sRA0_uid419_eRndXlog2_uid125_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal os_uid449_sqrtTables_q : STD_LOGIC_VECTOR (40 downto 0);
    signal yT1_uid464_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal lowRangeB_uid466_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid466_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid467_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal s1sumAHighB_uid468_invPolyEval_a : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid468_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid468_invPolyEval_o : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid468_invPolyEval_q : STD_LOGIC_VECTOR (24 downto 0);
    signal s1_uid469_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yT2_uid470_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid472_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid472_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid473_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal s2sumAHighB_uid474_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid474_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid474_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid474_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal s2_uid475_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeB_uid478_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid478_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid479_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s3sumAHighB_uid480_invPolyEval_a : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid480_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid480_invPolyEval_o : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid480_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal s3_uid481_invPolyEval_q : STD_LOGIC_VECTOR (43 downto 0);
    signal osig_uid484_pT1_uid274_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid487_pT2_uid280_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal nx_mergedSignalTM_uid503_pT3_uid286_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal topRangeX_mergedSignalTM_uid507_pT3_uid286_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_mergedSignalTM_uid516_pT3_uid286_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid523_pT3_uid286_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid523_pT3_uid286_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid524_pT3_uid286_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid526_pT3_uid286_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid527_pT3_uid286_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid527_pT3_uid286_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid530_pT1_uid465_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal osig_uid533_pT2_uid471_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeX_uid549_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid550_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_mergedSignalTM_uid554_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_mergedSignalTM_uid558_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid561_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftX_uid561_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_uid562_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_uid562_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid566_pT3_uid477_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid566_pT3_uid477_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid566_pT3_uid477_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid566_pT3_uid477_invPolyEval_pr : UNSIGNED (5 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid566_pT3_uid477_invPolyEval_pr : signal is "logic";
    signal sm0_uid566_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sumAb_uid567_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lowRangeB_uid568_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid568_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal highBBits_uid569_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_a : STD_LOGIC_VECTOR (42 downto 0);
    signal lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (42 downto 0);
    signal lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_o : STD_LOGIC_VECTOR (42 downto 0);
    signal lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal lev1_a0_uid571_pT3_uid477_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid572_pT3_uid477_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid572_pT3_uid477_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_align_7_q : STD_LOGIC_VECTOR (59 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_align_7_qint : STD_LOGIC_VECTOR (59 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_result_add_0_0_a : STD_LOGIC_VECTOR (60 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_result_add_0_0_b : STD_LOGIC_VECTOR (60 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_result_add_0_0_o : STD_LOGIC_VECTOR (60 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_result_add_0_0_q : STD_LOGIC_VECTOR (60 downto 0);
    signal leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx1_uid589_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage0Idx2_uid592_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage0Idx3_uid593_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (58 downto 0);
    signal leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal leftShiftStage1Idx1_uid598_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (50 downto 0);
    signal leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal leftShiftStage1Idx2_uid601_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage1Idx3Pad24_uid602_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal leftShiftStage1Idx3_uid604_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (64 downto 0);
    signal leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal leftShiftStage2Idx1_uid609_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage2Idx2_uid612_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage2Idx3Pad6_uid613_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (60 downto 0);
    signal leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (60 downto 0);
    signal leftShiftStage2Idx3_uid615_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_b : STD_LOGIC_VECTOR (65 downto 0);
    signal leftShiftStage3Idx1_uid620_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodYLogX_uid91_fpPowrTest_align_7_q : STD_LOGIC_VECTOR (57 downto 0);
    signal prodYLogX_uid91_fpPowrTest_align_7_qint : STD_LOGIC_VECTOR (57 downto 0);
    signal prodYLogX_uid91_fpPowrTest_result_add_0_0_a : STD_LOGIC_VECTOR (58 downto 0);
    signal prodYLogX_uid91_fpPowrTest_result_add_0_0_b : STD_LOGIC_VECTOR (58 downto 0);
    signal prodYLogX_uid91_fpPowrTest_result_add_0_0_o : STD_LOGIC_VECTOR (58 downto 0);
    signal prodYLogX_uid91_fpPowrTest_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to16_uid636_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid636_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Rng16_uid637_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid638_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to32_uid639_in : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to32_uid639_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2Rng32_uid640_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx2_uid641_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal stageIndexName_to47_uid642_in : STD_LOGIC_VECTOR (46 downto 0);
    signal stageIndexName_to47_uid642_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to4_uid646_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid646_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1Rng4_uid647_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx1_uid648_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to8_uid649_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid649_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2Rng8_uid650_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal rightShiftStage1Idx2_uid651_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to12_uid652_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid652_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng12_uid653_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rightShiftStage1Idx3_uid654_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage2Idx1Rng1_uid657_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage2Idx1_uid658_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to2_uid659_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid659_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2Idx2Rng2_uid660_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage2Idx2_uid661_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal seMsb_to3_uid662_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid662_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3Rng3_uid663_fxpInPostAlignExp_uid122_fpPowrTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage2Idx3_uid664_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to16_uid670_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid670_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Rng16_uid671_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx1_uid672_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to32_uid673_in : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to32_uid673_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2Rng32_uid674_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx2_uid675_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal stageIndexName_to44_uid676_in : STD_LOGIC_VECTOR (43 downto 0);
    signal stageIndexName_to44_uid676_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to4_uid680_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid680_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1Rng4_uid681_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal rightShiftStage1Idx1_uid682_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to8_uid683_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid683_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2Rng8_uid684_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal rightShiftStage1Idx2_uid685_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to12_uid686_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid686_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng12_uid687_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx3_uid688_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage2Idx1Rng1_uid691_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage2Idx1_uid692_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to2_uid693_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid693_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2Idx2Rng2_uid694_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage2Idx2_uid695_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal seMsb_to3_uid696_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid696_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3Rng3_uid697_fxpInPostAlign_X_uid135_fpPowrTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage2Idx3_uid698_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal memoryC0_uid254_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid254_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid254_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid254_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid254_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid254_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid255_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid255_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid255_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid255_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid255_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid255_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid258_lnTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid258_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid258_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid258_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid258_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid258_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid259_lnTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid259_lnTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid259_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid259_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid259_lnTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid259_lnTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid262_lnTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid262_lnTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid262_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid262_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid262_lnTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid262_lnTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid263_lnTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid263_lnTables_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid263_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid263_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid263_lnTables_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid263_lnTables_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC3_uid266_lnTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid266_lnTables_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid266_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid266_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid266_lnTables_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid266_lnTables_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC0_uid447_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid447_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid447_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid447_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid447_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid447_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid451_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid451_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC1_uid451_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid451_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid451_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC1_uid451_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC2_uid454_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid454_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC2_uid454_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid454_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid454_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC2_uid454_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC3_uid457_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid457_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal memoryC3_uid457_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid457_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid457_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (14 downto 0);
    signal memoryC3_uid457_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (14 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im0_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im0_b0 : STD_LOGIC_VECTOR (6 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im0_s1 : STD_LOGIC_VECTOR (14 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im0_pr : SIGNED (14 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_align_7_q : STD_LOGIC_VECTOR (32 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_align_7_qint : STD_LOGIC_VECTOR (32 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im0_a0 : STD_LOGIC_VECTOR (6 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im0_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im0_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im0_pr : UNSIGNED (12 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_bs1_b : STD_LOGIC_VECTOR (5 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_align_8_q : STD_LOGIC_VECTOR (30 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_align_8_qint : STD_LOGIC_VECTOR (30 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_reset : std_logic;
    type prodXY_uid483_pT1_uid274_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_a0 : prodXY_uid483_pT1_uid274_invPolyEval_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid483_pT1_uid274_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid483_pT1_uid274_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_c0 : prodXY_uid483_pT1_uid274_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid483_pT1_uid274_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid483_pT1_uid274_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_l : prodXY_uid483_pT1_uid274_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_p : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_u : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_w : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_x : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_y : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_s : prodXY_uid483_pT1_uid274_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid483_pT1_uid274_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_reset : std_logic;
    type prodXY_uid486_pT2_uid280_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_a0 : prodXY_uid486_pT2_uid280_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid486_pT2_uid280_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid486_pT2_uid280_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_c0 : prodXY_uid486_pT2_uid280_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid486_pT2_uid280_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid486_pT2_uid280_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_l : prodXY_uid486_pT2_uid280_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(39 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_p : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_u : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_w : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_x : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_y : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_s : prodXY_uid486_pT2_uid280_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_qq : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid486_pT2_uid280_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_reset : std_logic;
    type sm0_uid521_pT3_uid286_invPolyEval_cma_a0type is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_a0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid521_pT3_uid286_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_c0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid521_pT3_uid286_invPolyEval_cma_c0 : signal is true;
    type sm0_uid521_pT3_uid286_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(35 downto 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_p : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_u : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_w : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_x : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_y : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_s : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid521_pT3_uid286_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_reset : std_logic;
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_a0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid522_pT3_uid286_invPolyEval_cma_a0 : signal is true;
    type sm0_uid522_pT3_uid286_invPolyEval_cma_c0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_c0 : sm0_uid522_pT3_uid286_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid522_pT3_uid286_invPolyEval_cma_c0 : signal is true;
    type sm0_uid522_pT3_uid286_invPolyEval_cma_rtype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_r : sm0_uid522_pT3_uid286_invPolyEval_cma_rtype(0 to 0);
    type sm0_uid522_pT3_uid286_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_p : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_u : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_w : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_x : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_y : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_s : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid522_pT3_uid286_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_a0 : prodXY_uid486_pT2_uid280_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid529_pT1_uid465_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_c0 : prodXY_uid483_pT1_uid274_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of prodXY_uid529_pT1_uid465_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_l : prodXY_uid486_pT2_uid280_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(30 downto 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_p : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_u : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_w : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_x : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_y : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_s : prodXY_uid529_pT1_uid465_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid529_pT1_uid465_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_reset : std_logic;
    type prodXY_uid532_pT2_uid471_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_a0 : prodXY_uid532_pT2_uid471_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid532_pT2_uid471_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid532_pT2_uid471_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_c0 : prodXY_uid532_pT2_uid471_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid532_pT2_uid471_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid532_pT2_uid471_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_l : prodXY_uid532_pT2_uid471_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(50 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_p : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_u : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_w : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_x : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_y : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_s : prodXY_uid532_pT2_uid471_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid532_pT2_uid471_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_reset : std_logic;
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_a0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid563_pT3_uid477_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_c0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid563_pT3_uid477_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_p : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_u : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_w : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_x : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_y : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_s : sm0_uid521_pT3_uid286_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid563_pT3_uid477_invPolyEval_cma_ena1 : std_logic;
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_reset : std_logic;
    type postPEMulLog_uid64_fpPowrTest_im3_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_a0 : postPEMulLog_uid64_fpPowrTest_im3_cma_a0type(0 to 0);
    attribute preserve of postPEMulLog_uid64_fpPowrTest_im3_cma_a0 : signal is true;
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_c0 : prodXY_uid532_pT2_uid471_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of postPEMulLog_uid64_fpPowrTest_im3_cma_c0 : signal is true;
    type postPEMulLog_uid64_fpPowrTest_im3_cma_ltype is array(NATURAL range <>) of SIGNED(27 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_l : postPEMulLog_uid64_fpPowrTest_im3_cma_ltype(0 to 0);
    type postPEMulLog_uid64_fpPowrTest_im3_cma_ptype is array(NATURAL range <>) of SIGNED(52 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_p : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_u : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_w : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_x : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_y : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_s : postPEMulLog_uid64_fpPowrTest_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_ena0 : std_logic;
    signal postPEMulLog_uid64_fpPowrTest_im3_cma_ena1 : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im3_cma_reset : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im3_cma_a0 : postPEMulLog_uid64_fpPowrTest_im3_cma_a0type(0 to 0);
    attribute preserve of prodYLogX_uid91_fpPowrTest_im3_cma_a0 : signal is true;
    signal prodYLogX_uid91_fpPowrTest_im3_cma_c0 : prodXY_uid532_pT2_uid471_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodYLogX_uid91_fpPowrTest_im3_cma_c0 : signal is true;
    type prodYLogX_uid91_fpPowrTest_im3_cma_ptype is array(NATURAL range <>) of UNSIGNED(50 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_p : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_u : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_w : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_x : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_y : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_s : prodYLogX_uid91_fpPowrTest_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_qq : STD_LOGIC_VECTOR (50 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im3_cma_ena0 : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im3_cma_ena1 : std_logic;
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_reset : std_logic;
    type postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0type is array(NATURAL range <>) of SIGNED(7 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0 : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0type(0 to 0);
    attribute preserve of postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0 : signal is true;
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_c0 : sm0_uid522_pT3_uid286_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of postPEMulLog_uid64_fpPowrTest_im0_im3_cma_c0 : signal is true;
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_r : sm0_uid522_pT3_uid286_invPolyEval_cma_rtype(0 to 0);
    type postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_p : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_u : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_w : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_x : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_y : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_s : postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_qq : STD_LOGIC_VECTOR (25 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_q : STD_LOGIC_VECTOR (25 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena0 : std_logic;
    signal postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena1 : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_reset : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_a0 : sm0_uid522_pT3_uid286_invPolyEval_cma_rtype(0 to 0);
    attribute preserve of prodYLogX_uid91_fpPowrTest_im0_im3_cma_a0 : signal is true;
    type prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0type is array(NATURAL range <>) of UNSIGNED(9 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0 : prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0type(0 to 0);
    attribute preserve of prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0 : signal is true;
    type prodYLogX_uid91_fpPowrTest_im0_im3_cma_rtype is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_r : prodYLogX_uid91_fpPowrTest_im0_im3_cma_rtype(0 to 0);
    type prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype is array(NATURAL range <>) of SIGNED(29 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_p : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_u : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_w : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_x : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_y : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_s : prodYLogX_uid91_fpPowrTest_im0_im3_cma_ptype(0 to 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena0 : std_logic;
    signal prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0 : sm0_uid522_pT3_uid286_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0 : sm0_uid521_pT3_uid286_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_l : sm0_uid522_pT3_uid286_invPolyEval_cma_rtype(0 to 1);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_p : sm0_uid522_pT3_uid286_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(37 downto 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_u : multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_w : multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_x : multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_y : multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_s : multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena1 : std_logic;
    signal postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (17 downto 0);
    signal prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal yAddr_uid145_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid145_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (43 downto 0);
    signal topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (36 downto 0);
    signal lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_c : STD_LOGIC_VECTOR (42 downto 0);
    signal redist0_lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist8_lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_yAddr_uid145_fpPowrTest_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist14_yAddr_uid145_fpPowrTest_merged_bit_select_c_8_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist15_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist18_prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_os_uid572_pT3_uid477_invPolyEval_b_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist22_os_uid527_pT3_uid286_invPolyEval_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist23_lowRangeB_uid472_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_lowRangeB_uid466_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist31_vCount_uid314_countZLog_uid75_fpPowrTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_vCount_uid308_countZLog_uid75_fpPowrTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_vCount_uid302_countZLog_uid75_fpPowrTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_vStage_uid296_countZLog_uid75_fpPowrTest_b_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist35_vCount_uid294_countZLog_uid75_fpPowrTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_lowRangeB_uid281_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_lowRangeB_uid275_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist41_expFracXGTExpFracOne_uid163_fpPowrTest_c_35_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_invSignX_uid160_fpPowrTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_fracR_uid152_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist44_peORExpInc_uid149_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ePreRndExp_uid124_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist47_shiftValExp_uid121_fpPowrTest_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist48_shiftValuePreSatRedExp_uid120_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_expOvfInitialExp_uid118_fpPowrTest_b_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_expOvfInitialExp_uid118_fpPowrTest_b_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_signProd_uid104_fpPowrTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_signProd_uid104_fpPowrTest_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_expProdPhase1_uid98_fpPowrTest_q_4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist55_prodNormBit_uid92_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_oFracY_uid89_fpPowrTest_q_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist57_expRLog_uid88_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist58_fracRLog_uid87_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist59_signRLog0_uid79_fpPowrTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_highBBits_uid68_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist62_lowRangeB_uid67_fpPowrTest_b_2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist63_peORNatLog_uid56_fpPowrTest_b_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist66_yAddr_uid53_fpPowrTest_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist67_yAddr_uid53_fpPowrTest_b_5_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist68_yAddr_uid53_fpPowrTest_b_9_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist69_caseLog_uid50_fpPowrTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_caseLog_uid50_fpPowrTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_caseLog_uid50_fpPowrTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist72_xEQOneAbs_uid47_fpPowrTest_q_35_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist73_signY_uid42_fpPowrTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_signY_uid42_fpPowrTest_b_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_signX_uid39_fpPowrTest_b_47_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_excR_y_uid38_fpPowrTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_excI_y_uid34_fpPowrTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_fracXIsZero_uid32_fpPowrTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expXIsMax_uid31_fpPowrTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_excZ_y_uid30_fpPowrTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_excR_x_uid24_fpPowrTest_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_excR_x_uid24_fpPowrTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_excN_x_uid21_fpPowrTest_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_excI_x_uid20_fpPowrTest_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_excI_x_uid20_fpPowrTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_fracXIsZero_uid18_fpPowrTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_expXIsMax_uid17_fpPowrTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_excZ_x_uid16_fpPowrTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_excZ_x_uid16_fpPowrTest_q_34_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_excZ_x_uid16_fpPowrTest_q_35_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_frac_x_uid15_fpPowrTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist94_exp_x_uid14_fpPowrTest_b_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_reset0 : std_logic;
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_ia : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_iq : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i : signal is true;
    signal redist40_xInZO_uid166_fpPowrTest_c_34_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q : signal is true;
    signal redist40_xInZO_uid166_fpPowrTest_c_34_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_reset0 : std_logic;
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i : signal is true;
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq : std_logic;
    attribute preserve of redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq : signal is true;
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q : signal is true;
    signal redist46_ePreRndExp_uid124_fpPowrTest_b_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_reset0 : std_logic;
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ia : STD_LOGIC_VECTOR (33 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_iq : STD_LOGIC_VECTOR (33 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i : signal is true;
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq : std_logic;
    attribute preserve of redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq : signal is true;
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q : signal is true;
    signal redist54_oFracProd_uid97_fpPowrTest_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_reset0 : std_logic;
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ia : STD_LOGIC_VECTOR (66 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_iq : STD_LOGIC_VECTOR (66 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_q : STD_LOGIC_VECTOR (66 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i : signal is true;
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q : signal is true;
    signal redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_reset0 : std_logic;
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_iq : STD_LOGIC_VECTOR (14 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i : signal is true;
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q : signal is true;
    signal redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_reset0 : std_logic;
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i : signal is true;
    signal redist92_frac_x_uid15_fpPowrTest_b_12_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q : signal is true;
    signal redist92_frac_x_uid15_fpPowrTest_b_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_reset0 : std_logic;
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i : signal is true;
    signal redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq : std_logic;
    attribute preserve of redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq : signal is true;
    signal redist93_exp_x_uid14_fpPowrTest_b_12_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q : signal is true;
    signal redist93_exp_x_uid14_fpPowrTest_b_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_xIn_b_23_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist95_xIn_b_23_mem_reset0 : std_logic;
    signal redist95_xIn_b_23_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist95_xIn_b_23_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist95_xIn_b_23_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist95_xIn_b_23_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist95_xIn_b_23_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist95_xIn_b_23_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist95_xIn_b_23_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist95_xIn_b_23_rdcnt_i : signal is true;
    signal redist95_xIn_b_23_rdcnt_eq : std_logic;
    attribute preserve of redist95_xIn_b_23_rdcnt_eq : signal is true;
    signal redist95_xIn_b_23_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist95_xIn_b_23_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist95_xIn_b_23_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist95_xIn_b_23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_xIn_b_23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_xIn_b_23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_xIn_b_23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_xIn_b_23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist95_xIn_b_23_sticky_ena_q : signal is true;
    signal redist95_xIn_b_23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllOWE_uid11_fpPowrTest(CONSTANT,10)
    cstAllOWE_uid11_fpPowrTest_q <= "11111111";

    -- cstBias_uid7_fpPowrTest(CONSTANT,6)
    cstBias_uid7_fpPowrTest_q <= "01111111";

    -- zY_uid141_fpPowrTest(CONSTANT,140)
    zY_uid141_fpPowrTest_q <= "0000000000000000000000000000000000";

    -- maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest(CONSTANT,408)
    maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest_q <= "0111111111111111111111111111111111111111111111";

    -- minValueInFormat_uid410_eRndXlog2_uid125_fpPowrTest(CONSTANT,409)
    minValueInFormat_uid410_eRndXlog2_uid125_fpPowrTest_q <= "1000000000000000000000000000000000000000000000";

    -- maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest(CONSTANT,354)
    maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "011111111111111111111111111111111111111";

    -- minValueInFormat_uid356_qTimesOOlog2Ext_uid113_fpPowrTest(CONSTANT,355)
    minValueInFormat_uid356_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "100000000000000000000000000000000000000";

    -- redist95_xIn_b_23_notEnable(LOGICAL,932)
    redist95_xIn_b_23_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist95_xIn_b_23_nor(LOGICAL,933)
    redist95_xIn_b_23_nor_q <= not (redist95_xIn_b_23_notEnable_q or redist95_xIn_b_23_sticky_ena_q);

    -- redist95_xIn_b_23_mem_last(CONSTANT,929)
    redist95_xIn_b_23_mem_last_q <= "010011";

    -- redist95_xIn_b_23_cmp(LOGICAL,930)
    redist95_xIn_b_23_cmp_b <= STD_LOGIC_VECTOR("0" & redist95_xIn_b_23_rdcnt_q);
    redist95_xIn_b_23_cmp_q <= "1" WHEN redist95_xIn_b_23_mem_last_q = redist95_xIn_b_23_cmp_b ELSE "0";

    -- redist95_xIn_b_23_cmpReg(REG,931)
    redist95_xIn_b_23_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist95_xIn_b_23_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist95_xIn_b_23_cmpReg_q <= STD_LOGIC_VECTOR(redist95_xIn_b_23_cmp_q);
        END IF;
    END PROCESS;

    -- redist95_xIn_b_23_sticky_ena(REG,934)
    redist95_xIn_b_23_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist95_xIn_b_23_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist95_xIn_b_23_nor_q = "1") THEN
                redist95_xIn_b_23_sticky_ena_q <= STD_LOGIC_VECTOR(redist95_xIn_b_23_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist95_xIn_b_23_enaAnd(LOGICAL,935)
    redist95_xIn_b_23_enaAnd_q <= redist95_xIn_b_23_sticky_ena_q and VCC_q;

    -- redist95_xIn_b_23_rdcnt(COUNTER,927)
    -- low=0, high=20, step=1, init=0
    redist95_xIn_b_23_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist95_xIn_b_23_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist95_xIn_b_23_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist95_xIn_b_23_rdcnt_i = TO_UNSIGNED(19, 5)) THEN
                redist95_xIn_b_23_rdcnt_eq <= '1';
            ELSE
                redist95_xIn_b_23_rdcnt_eq <= '0';
            END IF;
            IF (redist95_xIn_b_23_rdcnt_eq = '1') THEN
                redist95_xIn_b_23_rdcnt_i <= redist95_xIn_b_23_rdcnt_i + 12;
            ELSE
                redist95_xIn_b_23_rdcnt_i <= redist95_xIn_b_23_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist95_xIn_b_23_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist95_xIn_b_23_rdcnt_i, 5)));

    -- redist95_xIn_b_23_wraddr(REG,928)
    redist95_xIn_b_23_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist95_xIn_b_23_wraddr_q <= "10100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist95_xIn_b_23_wraddr_q <= STD_LOGIC_VECTOR(redist95_xIn_b_23_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist95_xIn_b_23_mem(DUALMEM,926)
    redist95_xIn_b_23_mem_ia <= STD_LOGIC_VECTOR(b);
    redist95_xIn_b_23_mem_aa <= redist95_xIn_b_23_wraddr_q;
    redist95_xIn_b_23_mem_ab <= redist95_xIn_b_23_rdcnt_q;
    redist95_xIn_b_23_mem_reset0 <= areset;
    redist95_xIn_b_23_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 21,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist95_xIn_b_23_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist95_xIn_b_23_mem_reset0,
        clock1 => clk,
        address_a => redist95_xIn_b_23_mem_aa,
        data_a => redist95_xIn_b_23_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist95_xIn_b_23_mem_ab,
        q_b => redist95_xIn_b_23_mem_iq
    );
    redist95_xIn_b_23_mem_q <= redist95_xIn_b_23_mem_iq(31 downto 0);

    -- redist95_xIn_b_23_outputreg(DELAY,925)
    redist95_xIn_b_23_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist95_xIn_b_23_mem_q, xout => redist95_xIn_b_23_outputreg_q, clk => clk, aclr => areset );

    -- signY_uid42_fpPowrTest(BITSELECT,41)@23
    signY_uid42_fpPowrTest_b <= STD_LOGIC_VECTOR(redist95_xIn_b_23_outputreg_q(31 downto 31));

    -- redist73_signY_uid42_fpPowrTest_b_4(DELAY,833)
    redist73_signY_uid42_fpPowrTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid42_fpPowrTest_b, xout => redist73_signY_uid42_fpPowrTest_b_4_q, clk => clk, aclr => areset );

    -- cstBiasMO_uid8_fpPowrTest(CONSTANT,7)
    cstBiasMO_uid8_fpPowrTest_q <= "01111110";

    -- exp_x_uid14_fpPowrTest(BITSELECT,13)@0
    exp_x_uid14_fpPowrTest_b <= a(30 downto 23);

    -- caseLog_uid50_fpPowrTest(LOGICAL,49)@0
    caseLog_uid50_fpPowrTest_q <= "1" WHEN exp_x_uid14_fpPowrTest_b = cstBiasMO_uid8_fpPowrTest_q ELSE "0";

    -- redist69_caseLog_uid50_fpPowrTest_q_12(DELAY,829)
    redist69_caseLog_uid50_fpPowrTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => caseLog_uid50_fpPowrTest_q, xout => redist69_caseLog_uid50_fpPowrTest_q_12_q, clk => clk, aclr => areset );

    -- redist70_caseLog_uid50_fpPowrTest_q_16(DELAY,830)
    redist70_caseLog_uid50_fpPowrTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist69_caseLog_uid50_fpPowrTest_q_12_q, xout => redist70_caseLog_uid50_fpPowrTest_q_16_q, clk => clk, aclr => areset );

    -- redist92_frac_x_uid15_fpPowrTest_b_12_notEnable(LOGICAL,911)
    redist92_frac_x_uid15_fpPowrTest_b_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist92_frac_x_uid15_fpPowrTest_b_12_nor(LOGICAL,912)
    redist92_frac_x_uid15_fpPowrTest_b_12_nor_q <= not (redist92_frac_x_uid15_fpPowrTest_b_12_notEnable_q or redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q);

    -- redist92_frac_x_uid15_fpPowrTest_b_12_mem_last(CONSTANT,908)
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_last_q <= "0110";

    -- redist92_frac_x_uid15_fpPowrTest_b_12_cmp(LOGICAL,909)
    redist92_frac_x_uid15_fpPowrTest_b_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_q);
    redist92_frac_x_uid15_fpPowrTest_b_12_cmp_q <= "1" WHEN redist92_frac_x_uid15_fpPowrTest_b_12_mem_last_q = redist92_frac_x_uid15_fpPowrTest_b_12_cmp_b ELSE "0";

    -- redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg(REG,910)
    redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg_q <= STD_LOGIC_VECTOR(redist92_frac_x_uid15_fpPowrTest_b_12_cmp_q);
        END IF;
    END PROCESS;

    -- redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena(REG,913)
    redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist92_frac_x_uid15_fpPowrTest_b_12_nor_q = "1") THEN
                redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist92_frac_x_uid15_fpPowrTest_b_12_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist92_frac_x_uid15_fpPowrTest_b_12_enaAnd(LOGICAL,914)
    redist92_frac_x_uid15_fpPowrTest_b_12_enaAnd_q <= redist92_frac_x_uid15_fpPowrTest_b_12_sticky_ena_q and VCC_q;

    -- redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt(COUNTER,906)
    -- low=0, high=7, step=1, init=0
    redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i <= redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_i, 3)));

    -- frac_x_uid15_fpPowrTest(BITSELECT,14)@0
    frac_x_uid15_fpPowrTest_b <= a(22 downto 0);

    -- redist91_frac_x_uid15_fpPowrTest_b_2(DELAY,851)
    redist91_frac_x_uid15_fpPowrTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_x_uid15_fpPowrTest_b, xout => redist91_frac_x_uid15_fpPowrTest_b_2_q, clk => clk, aclr => areset );

    -- redist92_frac_x_uid15_fpPowrTest_b_12_wraddr(REG,907)
    redist92_frac_x_uid15_fpPowrTest_b_12_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist92_frac_x_uid15_fpPowrTest_b_12_wraddr_q <= STD_LOGIC_VECTOR(redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist92_frac_x_uid15_fpPowrTest_b_12_mem(DUALMEM,905)
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_ia <= STD_LOGIC_VECTOR(redist91_frac_x_uid15_fpPowrTest_b_2_q);
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_aa <= redist92_frac_x_uid15_fpPowrTest_b_12_wraddr_q;
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_ab <= redist92_frac_x_uid15_fpPowrTest_b_12_rdcnt_q;
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_reset0 <= areset;
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist92_frac_x_uid15_fpPowrTest_b_12_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist92_frac_x_uid15_fpPowrTest_b_12_mem_reset0,
        clock1 => clk,
        address_a => redist92_frac_x_uid15_fpPowrTest_b_12_mem_aa,
        data_a => redist92_frac_x_uid15_fpPowrTest_b_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist92_frac_x_uid15_fpPowrTest_b_12_mem_ab,
        q_b => redist92_frac_x_uid15_fpPowrTest_b_12_mem_iq
    );
    redist92_frac_x_uid15_fpPowrTest_b_12_mem_q <= redist92_frac_x_uid15_fpPowrTest_b_12_mem_iq(22 downto 0);

    -- redist92_frac_x_uid15_fpPowrTest_b_12_outputreg(DELAY,904)
    redist92_frac_x_uid15_fpPowrTest_b_12_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist92_frac_x_uid15_fpPowrTest_b_12_mem_q, xout => redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q, clk => clk, aclr => areset );

    -- cstAllZWF_uid6_fpPowrTest(CONSTANT,5)
    cstAllZWF_uid6_fpPowrTest_q <= "00000000000000000000000";

    -- aPostPad_uid58_fpPowrTest(BITJOIN,57)@12
    aPostPad_uid58_fpPowrTest_q <= VCC_q & cstAllZWF_uid6_fpPowrTest_q;

    -- oMzLog_uid59_fpPowrTest(SUB,58)@12
    oMzLog_uid59_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid58_fpPowrTest_q);
    oMzLog_uid59_fpPowrTest_b <= STD_LOGIC_VECTOR("00" & redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q);
    oMzLog_uid59_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMzLog_uid59_fpPowrTest_a) - UNSIGNED(oMzLog_uid59_fpPowrTest_b));
    oMzLog_uid59_fpPowrTest_q <= oMzLog_uid59_fpPowrTest_o(24 downto 0);

    -- z2_uid60_fpPowrTest(CONSTANT,59)
    z2_uid60_fpPowrTest_q <= "00";

    -- sEzLog_uid61_fpPowrTest(BITJOIN,60)@12
    sEzLog_uid61_fpPowrTest_q <= z2_uid60_fpPowrTest_q & redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q;

    -- multTermOneLog_uid63_fpPowrTest(MUX,62)@12
    multTermOneLog_uid63_fpPowrTest_s <= redist69_caseLog_uid50_fpPowrTest_q_12_q;
    multTermOneLog_uid63_fpPowrTest_combproc: PROCESS (multTermOneLog_uid63_fpPowrTest_s, sEzLog_uid61_fpPowrTest_q, oMzLog_uid59_fpPowrTest_q)
    BEGIN
        CASE (multTermOneLog_uid63_fpPowrTest_s) IS
            WHEN "0" => multTermOneLog_uid63_fpPowrTest_q <= sEzLog_uid61_fpPowrTest_q;
            WHEN "1" => multTermOneLog_uid63_fpPowrTest_q <= oMzLog_uid59_fpPowrTest_q;
            WHEN OTHERS => multTermOneLog_uid63_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select(BITSELECT,746)@12
    postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_b <= STD_LOGIC_VECTOR(multTermOneLog_uid63_fpPowrTest_q(24 downto 18));
    postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_c <= STD_LOGIC_VECTOR(multTermOneLog_uid63_fpPowrTest_q(17 downto 0));

    -- addrFull_uid51_fpPowrTest(BITJOIN,50)@0
    addrFull_uid51_fpPowrTest_q <= caseLog_uid50_fpPowrTest_q & frac_x_uid15_fpPowrTest_b;

    -- yAddr_uid53_fpPowrTest(BITSELECT,52)@0
    yAddr_uid53_fpPowrTest_b <= addrFull_uid51_fpPowrTest_q(23 downto 15);

    -- memoryC3_uid266_lnTables_lutmem(DUALMEM,707)@0 + 2
    -- in j@20000000
    memoryC3_uid266_lnTables_lutmem_aa <= yAddr_uid53_fpPowrTest_b;
    memoryC3_uid266_lnTables_lutmem_reset0 <= areset;
    memoryC3_uid266_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC3_uid266_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid266_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid266_lnTables_lutmem_aa,
        q_a => memoryC3_uid266_lnTables_lutmem_ir
    );
    memoryC3_uid266_lnTables_lutmem_r <= memoryC3_uid266_lnTables_lutmem_ir(13 downto 0);

    -- zPPolyEvalLog_uid54_fpPowrTest(BITSELECT,53)@2
    zPPolyEvalLog_uid54_fpPowrTest_in <= redist91_frac_x_uid15_fpPowrTest_b_2_q(14 downto 0);
    zPPolyEvalLog_uid54_fpPowrTest_b <= zPPolyEvalLog_uid54_fpPowrTest_in(14 downto 0);

    -- yT1_uid273_invPolyEval(BITSELECT,272)@2
    yT1_uid273_invPolyEval_b <= zPPolyEvalLog_uid54_fpPowrTest_b(14 downto 1);

    -- prodXY_uid483_pT1_uid274_invPolyEval_cma(CHAINMULTADD,733)@2 + 2
    prodXY_uid483_pT1_uid274_invPolyEval_cma_reset <= areset;
    prodXY_uid483_pT1_uid274_invPolyEval_cma_ena0 <= '1';
    prodXY_uid483_pT1_uid274_invPolyEval_cma_ena1 <= prodXY_uid483_pT1_uid274_invPolyEval_cma_ena0;
    prodXY_uid483_pT1_uid274_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid483_pT1_uid274_invPolyEval_cma_a0(0),15));
    prodXY_uid483_pT1_uid274_invPolyEval_cma_p(0) <= prodXY_uid483_pT1_uid274_invPolyEval_cma_l(0) * prodXY_uid483_pT1_uid274_invPolyEval_cma_c0(0);
    prodXY_uid483_pT1_uid274_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid483_pT1_uid274_invPolyEval_cma_p(0),29);
    prodXY_uid483_pT1_uid274_invPolyEval_cma_w(0) <= prodXY_uid483_pT1_uid274_invPolyEval_cma_u(0);
    prodXY_uid483_pT1_uid274_invPolyEval_cma_x(0) <= prodXY_uid483_pT1_uid274_invPolyEval_cma_w(0);
    prodXY_uid483_pT1_uid274_invPolyEval_cma_y(0) <= prodXY_uid483_pT1_uid274_invPolyEval_cma_x(0);
    prodXY_uid483_pT1_uid274_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid483_pT1_uid274_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid483_pT1_uid274_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid483_pT1_uid274_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid483_pT1_uid274_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid273_invPolyEval_b),14);
                prodXY_uid483_pT1_uid274_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC3_uid266_lnTables_lutmem_r),14);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid483_pT1_uid274_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid483_pT1_uid274_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid483_pT1_uid274_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid483_pT1_uid274_invPolyEval_cma_s(0) <= prodXY_uid483_pT1_uid274_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid483_pT1_uid274_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid483_pT1_uid274_invPolyEval_cma_s(0)(27 downto 0)), xout => prodXY_uid483_pT1_uid274_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid483_pT1_uid274_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid483_pT1_uid274_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid484_pT1_uid274_invPolyEval(BITSELECT,483)@4
    osig_uid484_pT1_uid274_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid483_pT1_uid274_invPolyEval_cma_q(27 downto 14));

    -- highBBits_uid276_invPolyEval(BITSELECT,275)@4
    highBBits_uid276_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid484_pT1_uid274_invPolyEval_b(13 downto 1));

    -- redist66_yAddr_uid53_fpPowrTest_b_2(DELAY,826)
    redist66_yAddr_uid53_fpPowrTest_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid53_fpPowrTest_b, xout => redist66_yAddr_uid53_fpPowrTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC2_uid263_lnTables_lutmem(DUALMEM,706)@2 + 2
    -- in j@20000000
    memoryC2_uid263_lnTables_lutmem_aa <= redist66_yAddr_uid53_fpPowrTest_b_2_q;
    memoryC2_uid263_lnTables_lutmem_reset0 <= areset;
    memoryC2_uid263_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 2,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC2_uid263_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid263_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid263_lnTables_lutmem_aa,
        q_a => memoryC2_uid263_lnTables_lutmem_ir
    );
    memoryC2_uid263_lnTables_lutmem_r <= memoryC2_uid263_lnTables_lutmem_ir(1 downto 0);

    -- memoryC2_uid262_lnTables_lutmem(DUALMEM,705)@2 + 2
    -- in j@20000000
    memoryC2_uid262_lnTables_lutmem_aa <= redist66_yAddr_uid53_fpPowrTest_b_2_q;
    memoryC2_uid262_lnTables_lutmem_reset0 <= areset;
    memoryC2_uid262_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC2_uid262_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid262_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid262_lnTables_lutmem_aa,
        q_a => memoryC2_uid262_lnTables_lutmem_ir
    );
    memoryC2_uid262_lnTables_lutmem_r <= memoryC2_uid262_lnTables_lutmem_ir(19 downto 0);

    -- os_uid264_lnTables(BITJOIN,263)@4
    os_uid264_lnTables_q <= memoryC2_uid263_lnTables_lutmem_r & memoryC2_uid262_lnTables_lutmem_r;

    -- s1sumAHighB_uid277_invPolyEval(ADD,276)@4 + 1
    s1sumAHighB_uid277_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => os_uid264_lnTables_q(21)) & os_uid264_lnTables_q));
    s1sumAHighB_uid277_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 13 => highBBits_uid276_invPolyEval_b(12)) & highBBits_uid276_invPolyEval_b));
    s1sumAHighB_uid277_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid277_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid277_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid277_invPolyEval_a) + SIGNED(s1sumAHighB_uid277_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid277_invPolyEval_q <= s1sumAHighB_uid277_invPolyEval_o(22 downto 0);

    -- lowRangeB_uid275_invPolyEval(BITSELECT,274)@4
    lowRangeB_uid275_invPolyEval_in <= osig_uid484_pT1_uid274_invPolyEval_b(0 downto 0);
    lowRangeB_uid275_invPolyEval_b <= lowRangeB_uid275_invPolyEval_in(0 downto 0);

    -- redist37_lowRangeB_uid275_invPolyEval_b_1(DELAY,797)
    redist37_lowRangeB_uid275_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid275_invPolyEval_b, xout => redist37_lowRangeB_uid275_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid278_invPolyEval(BITJOIN,277)@5
    s1_uid278_invPolyEval_q <= s1sumAHighB_uid277_invPolyEval_q & redist37_lowRangeB_uid275_invPolyEval_b_1_q;

    -- redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3(DELAY,824)
    redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3 : dspba_delay
    GENERIC MAP ( width => 15, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => zPPolyEvalLog_uid54_fpPowrTest_b, xout => redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_q, clk => clk, aclr => areset );

    -- redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg(DELAY,895)
    redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_q, xout => redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg_q, clk => clk, aclr => areset );

    -- prodXY_uid486_pT2_uid280_invPolyEval_cma(CHAINMULTADD,734)@5 + 2
    prodXY_uid486_pT2_uid280_invPolyEval_cma_reset <= areset;
    prodXY_uid486_pT2_uid280_invPolyEval_cma_ena0 <= '1';
    prodXY_uid486_pT2_uid280_invPolyEval_cma_ena1 <= prodXY_uid486_pT2_uid280_invPolyEval_cma_ena0;
    prodXY_uid486_pT2_uid280_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid486_pT2_uid280_invPolyEval_cma_a0(0),16));
    prodXY_uid486_pT2_uid280_invPolyEval_cma_p(0) <= prodXY_uid486_pT2_uid280_invPolyEval_cma_l(0) * prodXY_uid486_pT2_uid280_invPolyEval_cma_c0(0);
    prodXY_uid486_pT2_uid280_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid486_pT2_uid280_invPolyEval_cma_p(0),40);
    prodXY_uid486_pT2_uid280_invPolyEval_cma_w(0) <= prodXY_uid486_pT2_uid280_invPolyEval_cma_u(0);
    prodXY_uid486_pT2_uid280_invPolyEval_cma_x(0) <= prodXY_uid486_pT2_uid280_invPolyEval_cma_w(0);
    prodXY_uid486_pT2_uid280_invPolyEval_cma_y(0) <= prodXY_uid486_pT2_uid280_invPolyEval_cma_x(0);
    prodXY_uid486_pT2_uid280_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid486_pT2_uid280_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid486_pT2_uid280_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid486_pT2_uid280_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid486_pT2_uid280_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg_q),15);
                prodXY_uid486_pT2_uid280_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid278_invPolyEval_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid486_pT2_uid280_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid486_pT2_uid280_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid486_pT2_uid280_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid486_pT2_uid280_invPolyEval_cma_s(0) <= prodXY_uid486_pT2_uid280_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid486_pT2_uid280_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 39, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid486_pT2_uid280_invPolyEval_cma_s(0)(38 downto 0)), xout => prodXY_uid486_pT2_uid280_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid486_pT2_uid280_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid486_pT2_uid280_invPolyEval_cma_qq(38 downto 0));

    -- osig_uid487_pT2_uid280_invPolyEval(BITSELECT,486)@7
    osig_uid487_pT2_uid280_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid486_pT2_uid280_invPolyEval_cma_q(38 downto 15));

    -- highBBits_uid282_invPolyEval(BITSELECT,281)@7
    highBBits_uid282_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid487_pT2_uid280_invPolyEval_b(23 downto 1));

    -- redist67_yAddr_uid53_fpPowrTest_b_5(DELAY,827)
    redist67_yAddr_uid53_fpPowrTest_b_5 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist66_yAddr_uid53_fpPowrTest_b_2_q, xout => redist67_yAddr_uid53_fpPowrTest_b_5_q, clk => clk, aclr => areset );

    -- memoryC1_uid259_lnTables_lutmem(DUALMEM,704)@5 + 2
    -- in j@20000000
    memoryC1_uid259_lnTables_lutmem_aa <= redist67_yAddr_uid53_fpPowrTest_b_5_q;
    memoryC1_uid259_lnTables_lutmem_reset0 <= areset;
    memoryC1_uid259_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC1_uid259_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid259_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid259_lnTables_lutmem_aa,
        q_a => memoryC1_uid259_lnTables_lutmem_ir
    );
    memoryC1_uid259_lnTables_lutmem_r <= memoryC1_uid259_lnTables_lutmem_ir(9 downto 0);

    -- memoryC1_uid258_lnTables_lutmem(DUALMEM,703)@5 + 2
    -- in j@20000000
    memoryC1_uid258_lnTables_lutmem_aa <= redist67_yAddr_uid53_fpPowrTest_b_5_q;
    memoryC1_uid258_lnTables_lutmem_reset0 <= areset;
    memoryC1_uid258_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC1_uid258_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid258_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid258_lnTables_lutmem_aa,
        q_a => memoryC1_uid258_lnTables_lutmem_ir
    );
    memoryC1_uid258_lnTables_lutmem_r <= memoryC1_uid258_lnTables_lutmem_ir(19 downto 0);

    -- os_uid260_lnTables(BITJOIN,259)@7
    os_uid260_lnTables_q <= memoryC1_uid259_lnTables_lutmem_r & memoryC1_uid258_lnTables_lutmem_r;

    -- s2sumAHighB_uid283_invPolyEval(ADD,282)@7 + 1
    s2sumAHighB_uid283_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => os_uid260_lnTables_q(29)) & os_uid260_lnTables_q));
    s2sumAHighB_uid283_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 23 => highBBits_uid282_invPolyEval_b(22)) & highBBits_uid282_invPolyEval_b));
    s2sumAHighB_uid283_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s2sumAHighB_uid283_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s2sumAHighB_uid283_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid283_invPolyEval_a) + SIGNED(s2sumAHighB_uid283_invPolyEval_b));
        END IF;
    END PROCESS;
    s2sumAHighB_uid283_invPolyEval_q <= s2sumAHighB_uid283_invPolyEval_o(30 downto 0);

    -- lowRangeB_uid281_invPolyEval(BITSELECT,280)@7
    lowRangeB_uid281_invPolyEval_in <= osig_uid487_pT2_uid280_invPolyEval_b(0 downto 0);
    lowRangeB_uid281_invPolyEval_b <= lowRangeB_uid281_invPolyEval_in(0 downto 0);

    -- redist36_lowRangeB_uid281_invPolyEval_b_1(DELAY,796)
    redist36_lowRangeB_uid281_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid281_invPolyEval_b, xout => redist36_lowRangeB_uid281_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s2_uid284_invPolyEval(BITJOIN,283)@8
    s2_uid284_invPolyEval_q <= s2sumAHighB_uid283_invPolyEval_q & redist36_lowRangeB_uid281_invPolyEval_b_1_q;

    -- topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select(BITSELECT,751)@8
    topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid284_invPolyEval_q(31 downto 14));
    topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid284_invPolyEval_q(13 downto 0));

    -- zs_uid318_countZLog_uid75_fpPowrTest(CONSTANT,317)
    zs_uid318_countZLog_uid75_fpPowrTest_q <= "0000";

    -- aboveLeftY_mergedSignalTM_uid516_pT3_uid286_invPolyEval(BITJOIN,515)@8
    aboveLeftY_mergedSignalTM_uid516_pT3_uid286_invPolyEval_q <= topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_c & zs_uid318_countZLog_uid75_fpPowrTest_q;

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_notEnable(LOGICAL,900)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_nor(LOGICAL,901)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_nor_q <= not (redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_notEnable_q or redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q);

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg(REG,899)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena(REG,902)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_nor_q = "1") THEN
                redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_enaAnd(LOGICAL,903)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_enaAnd_q <= redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_sticky_ena_q and VCC_q;

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt(COUNTER,897)
    -- low=0, high=1, step=1, init=0
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i <= redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_i, 1)));

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr(REG,898)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem(DUALMEM,896)
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ia <= STD_LOGIC_VECTOR(redist64_zPPolyEvalLog_uid54_fpPowrTest_b_3_outputreg_q);
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_aa <= redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_wraddr_q;
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ab <= redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_rdcnt_q;
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_reset0 <= areset;
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 15,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_reset0,
        clock1 => clk,
        address_a => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_aa,
        data_a => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_ab,
        q_b => redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_iq
    );
    redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_q <= redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_iq(14 downto 0);

    -- nx_mergedSignalTM_uid503_pT3_uid286_invPolyEval(BITJOIN,502)@8
    nx_mergedSignalTM_uid503_pT3_uid286_invPolyEval_q <= GND_q & redist65_zPPolyEvalLog_uid54_fpPowrTest_b_6_mem_q;

    -- topRangeX_mergedSignalTM_uid507_pT3_uid286_invPolyEval(BITJOIN,506)@8
    topRangeX_mergedSignalTM_uid507_pT3_uid286_invPolyEval_q <= nx_mergedSignalTM_uid503_pT3_uid286_invPolyEval_q & z2_uid60_fpPowrTest_q;

    -- sm0_uid522_pT3_uid286_invPolyEval_cma(CHAINMULTADD,736)@8 + 2
    sm0_uid522_pT3_uid286_invPolyEval_cma_reset <= areset;
    sm0_uid522_pT3_uid286_invPolyEval_cma_ena0 <= '1';
    sm0_uid522_pT3_uid286_invPolyEval_cma_ena1 <= sm0_uid522_pT3_uid286_invPolyEval_cma_ena0;
    sm0_uid522_pT3_uid286_invPolyEval_cma_r(0) <= SIGNED(RESIZE(sm0_uid522_pT3_uid286_invPolyEval_cma_c0(0),19));
    sm0_uid522_pT3_uid286_invPolyEval_cma_p(0) <= sm0_uid522_pT3_uid286_invPolyEval_cma_a0(0) * sm0_uid522_pT3_uid286_invPolyEval_cma_r(0);
    sm0_uid522_pT3_uid286_invPolyEval_cma_u(0) <= RESIZE(sm0_uid522_pT3_uid286_invPolyEval_cma_p(0),37);
    sm0_uid522_pT3_uid286_invPolyEval_cma_w(0) <= sm0_uid522_pT3_uid286_invPolyEval_cma_u(0);
    sm0_uid522_pT3_uid286_invPolyEval_cma_x(0) <= sm0_uid522_pT3_uid286_invPolyEval_cma_w(0);
    sm0_uid522_pT3_uid286_invPolyEval_cma_y(0) <= sm0_uid522_pT3_uid286_invPolyEval_cma_x(0);
    sm0_uid522_pT3_uid286_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid522_pT3_uid286_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid522_pT3_uid286_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid522_pT3_uid286_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid522_pT3_uid286_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_mergedSignalTM_uid507_pT3_uid286_invPolyEval_q),18);
                sm0_uid522_pT3_uid286_invPolyEval_cma_c0(0) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid516_pT3_uid286_invPolyEval_q),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid522_pT3_uid286_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid522_pT3_uid286_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid522_pT3_uid286_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid522_pT3_uid286_invPolyEval_cma_s(0) <= sm0_uid522_pT3_uid286_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid522_pT3_uid286_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid522_pT3_uid286_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid522_pT3_uid286_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid522_pT3_uid286_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid522_pT3_uid286_invPolyEval_cma_qq(35 downto 0));

    -- highBBits_uid524_pT3_uid286_invPolyEval(BITSELECT,523)@10
    highBBits_uid524_pT3_uid286_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid522_pT3_uid286_invPolyEval_cma_q(35 downto 18));

    -- sm0_uid521_pT3_uid286_invPolyEval_cma(CHAINMULTADD,735)@8 + 2
    sm0_uid521_pT3_uid286_invPolyEval_cma_reset <= areset;
    sm0_uid521_pT3_uid286_invPolyEval_cma_ena0 <= '1';
    sm0_uid521_pT3_uid286_invPolyEval_cma_ena1 <= sm0_uid521_pT3_uid286_invPolyEval_cma_ena0;
    sm0_uid521_pT3_uid286_invPolyEval_cma_p(0) <= sm0_uid521_pT3_uid286_invPolyEval_cma_a0(0) * sm0_uid521_pT3_uid286_invPolyEval_cma_c0(0);
    sm0_uid521_pT3_uid286_invPolyEval_cma_u(0) <= RESIZE(sm0_uid521_pT3_uid286_invPolyEval_cma_p(0),36);
    sm0_uid521_pT3_uid286_invPolyEval_cma_w(0) <= sm0_uid521_pT3_uid286_invPolyEval_cma_u(0);
    sm0_uid521_pT3_uid286_invPolyEval_cma_x(0) <= sm0_uid521_pT3_uid286_invPolyEval_cma_w(0);
    sm0_uid521_pT3_uid286_invPolyEval_cma_y(0) <= sm0_uid521_pT3_uid286_invPolyEval_cma_x(0);
    sm0_uid521_pT3_uid286_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid521_pT3_uid286_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid521_pT3_uid286_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid521_pT3_uid286_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid521_pT3_uid286_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_mergedSignalTM_uid507_pT3_uid286_invPolyEval_q),18);
                sm0_uid521_pT3_uid286_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid509_pT3_uid286_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid521_pT3_uid286_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid521_pT3_uid286_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid521_pT3_uid286_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid521_pT3_uid286_invPolyEval_cma_s(0) <= sm0_uid521_pT3_uid286_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid521_pT3_uid286_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid521_pT3_uid286_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid521_pT3_uid286_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid521_pT3_uid286_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid521_pT3_uid286_invPolyEval_cma_qq(35 downto 0));

    -- lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval(ADD,524)@10
    lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => sm0_uid521_pT3_uid286_invPolyEval_cma_q(35)) & sm0_uid521_pT3_uid286_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 18 => highBBits_uid524_pT3_uid286_invPolyEval_b(17)) & highBBits_uid524_pT3_uid286_invPolyEval_b));
    lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_b));
    lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_q <= lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid523_pT3_uid286_invPolyEval(BITSELECT,522)@10
    lowRangeB_uid523_pT3_uid286_invPolyEval_in <= sm0_uid522_pT3_uid286_invPolyEval_cma_q(17 downto 0);
    lowRangeB_uid523_pT3_uid286_invPolyEval_b <= lowRangeB_uid523_pT3_uid286_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid526_pT3_uid286_invPolyEval(BITJOIN,525)@10
    lev1_a0_uid526_pT3_uid286_invPolyEval_q <= lev1_a0sumAHighB_uid525_pT3_uid286_invPolyEval_q & lowRangeB_uid523_pT3_uid286_invPolyEval_b;

    -- os_uid527_pT3_uid286_invPolyEval(BITSELECT,526)@10
    os_uid527_pT3_uid286_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid526_pT3_uid286_invPolyEval_q(52 downto 0));
    os_uid527_pT3_uid286_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid527_pT3_uid286_invPolyEval_in(52 downto 20));

    -- redist22_os_uid527_pT3_uid286_invPolyEval_b_1(DELAY,782)
    redist22_os_uid527_pT3_uid286_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid527_pT3_uid286_invPolyEval_b, xout => redist22_os_uid527_pT3_uid286_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid288_invPolyEval(BITSELECT,287)@11
    highBBits_uid288_invPolyEval_b <= STD_LOGIC_VECTOR(redist22_os_uid527_pT3_uid286_invPolyEval_b_1_q(32 downto 2));

    -- redist68_yAddr_uid53_fpPowrTest_b_9(DELAY,828)
    redist68_yAddr_uid53_fpPowrTest_b_9 : dspba_delay
    GENERIC MAP ( width => 9, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist67_yAddr_uid53_fpPowrTest_b_5_q, xout => redist68_yAddr_uid53_fpPowrTest_b_9_q, clk => clk, aclr => areset );

    -- memoryC0_uid255_lnTables_lutmem(DUALMEM,702)@9 + 2
    -- in j@20000000
    memoryC0_uid255_lnTables_lutmem_aa <= redist68_yAddr_uid53_fpPowrTest_b_9_q;
    memoryC0_uid255_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid255_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC0_uid255_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid255_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid255_lnTables_lutmem_aa,
        q_a => memoryC0_uid255_lnTables_lutmem_ir
    );
    memoryC0_uid255_lnTables_lutmem_r <= memoryC0_uid255_lnTables_lutmem_ir(19 downto 0);

    -- memoryC0_uid254_lnTables_lutmem(DUALMEM,701)@9 + 2
    -- in j@20000000
    memoryC0_uid254_lnTables_lutmem_aa <= redist68_yAddr_uid53_fpPowrTest_b_9_q;
    memoryC0_uid254_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid254_lnTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC0_uid254_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid254_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid254_lnTables_lutmem_aa,
        q_a => memoryC0_uid254_lnTables_lutmem_ir
    );
    memoryC0_uid254_lnTables_lutmem_r <= memoryC0_uid254_lnTables_lutmem_ir(19 downto 0);

    -- os_uid256_lnTables(BITJOIN,255)@11
    os_uid256_lnTables_q <= memoryC0_uid255_lnTables_lutmem_r & memoryC0_uid254_lnTables_lutmem_r;

    -- s3sumAHighB_uid289_invPolyEval(ADD,288)@11
    s3sumAHighB_uid289_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => os_uid256_lnTables_q(39)) & os_uid256_lnTables_q));
    s3sumAHighB_uid289_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 31 => highBBits_uid288_invPolyEval_b(30)) & highBBits_uid288_invPolyEval_b));
    s3sumAHighB_uid289_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid289_invPolyEval_a) + SIGNED(s3sumAHighB_uid289_invPolyEval_b));
    s3sumAHighB_uid289_invPolyEval_q <= s3sumAHighB_uid289_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid287_invPolyEval(BITSELECT,286)@11
    lowRangeB_uid287_invPolyEval_in <= redist22_os_uid527_pT3_uid286_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid287_invPolyEval_b <= lowRangeB_uid287_invPolyEval_in(1 downto 0);

    -- s3_uid290_invPolyEval(BITJOIN,289)@11
    s3_uid290_invPolyEval_q <= s3sumAHighB_uid289_invPolyEval_q & lowRangeB_uid287_invPolyEval_b;

    -- peORNatLog_uid56_fpPowrTest(BITSELECT,55)@11
    peORNatLog_uid56_fpPowrTest_in <= STD_LOGIC_VECTOR(s3_uid290_invPolyEval_q(41 downto 0));
    peORNatLog_uid56_fpPowrTest_b <= STD_LOGIC_VECTOR(peORNatLog_uid56_fpPowrTest_in(41 downto 7));

    -- redist63_peORNatLog_uid56_fpPowrTest_b_1(DELAY,823)
    redist63_peORNatLog_uid56_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => peORNatLog_uid56_fpPowrTest_b, xout => redist63_peORNatLog_uid56_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select(BITSELECT,745)@12
    postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(redist63_peORNatLog_uid56_fpPowrTest_b_1_q(34 downto 27));
    postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(redist63_peORNatLog_uid56_fpPowrTest_b_1_q(26 downto 0));

    -- postPEMulLog_uid64_fpPowrTest_im0_im0(MULT,712)@12 + 2
    postPEMulLog_uid64_fpPowrTest_im0_im0_pr <= SIGNED(SIGNED(postPEMulLog_uid64_fpPowrTest_im0_im0_a0) * SIGNED(postPEMulLog_uid64_fpPowrTest_im0_im0_b0));
    postPEMulLog_uid64_fpPowrTest_im0_im0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_im0_a0 <= (others => '0');
            postPEMulLog_uid64_fpPowrTest_im0_im0_b0 <= (others => '0');
            postPEMulLog_uid64_fpPowrTest_im0_im0_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_im0_a0 <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_b);
            postPEMulLog_uid64_fpPowrTest_im0_im0_b0 <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_b);
            postPEMulLog_uid64_fpPowrTest_im0_im0_s1 <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im0_im0_pr);
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im0_im0_q <= postPEMulLog_uid64_fpPowrTest_im0_im0_s1;

    -- postPEMulLog_uid64_fpPowrTest_im0_align_7(BITSHIFT,719)@14
    postPEMulLog_uid64_fpPowrTest_im0_align_7_qint <= postPEMulLog_uid64_fpPowrTest_im0_im0_q & "000000000000000000";
    postPEMulLog_uid64_fpPowrTest_im0_align_7_q <= postPEMulLog_uid64_fpPowrTest_im0_align_7_qint(32 downto 0);

    -- postPEMulLog_uid64_fpPowrTest_im0_im3_cma(CHAINMULTADD,742)@12 + 2
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_reset <= areset;
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena0 <= '1';
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena1 <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena0;
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_r(0) <= SIGNED(RESIZE(postPEMulLog_uid64_fpPowrTest_im0_im3_cma_c0(0),19));
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_p(0) <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0(0) * postPEMulLog_uid64_fpPowrTest_im0_im3_cma_r(0);
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_u(0) <= RESIZE(postPEMulLog_uid64_fpPowrTest_im0_im3_cma_p(0),27);
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_w(0) <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_u(0);
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_x(0) <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_w(0);
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_y(0) <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_x(0);
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0 <= (others => (others => '0'));
            postPEMulLog_uid64_fpPowrTest_im0_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena0 = '1') THEN
                postPEMulLog_uid64_fpPowrTest_im0_im3_cma_a0(0) <= RESIZE(SIGNED(postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_b),8);
                postPEMulLog_uid64_fpPowrTest_im0_im3_cma_c0(0) <= RESIZE(UNSIGNED(postPEMulLog_uid64_fpPowrTest_im0_bs1_merged_bit_select_c),18);
            END IF;
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMulLog_uid64_fpPowrTest_im0_im3_cma_ena1 = '1') THEN
                postPEMulLog_uid64_fpPowrTest_im0_im3_cma_s(0) <= postPEMulLog_uid64_fpPowrTest_im0_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 26, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im0_im3_cma_s(0)(25 downto 0)), xout => postPEMulLog_uid64_fpPowrTest_im0_im3_cma_qq, clk => clk, aclr => areset );
    postPEMulLog_uid64_fpPowrTest_im0_im3_cma_q <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im0_im3_cma_qq(25 downto 0));

    -- postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0(ADD,721)@14 + 1
    postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => postPEMulLog_uid64_fpPowrTest_im0_im3_cma_q(25)) & postPEMulLog_uid64_fpPowrTest_im0_im3_cma_q));
    postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => postPEMulLog_uid64_fpPowrTest_im0_align_7_q(32)) & postPEMulLog_uid64_fpPowrTest_im0_align_7_q));
    postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_a) + SIGNED(postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_b));
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_q <= postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_o(33 downto 0);

    -- postPEMulLog_uid64_fpPowrTest_align_7(BITSHIFT,581)@15
    postPEMulLog_uid64_fpPowrTest_align_7_qint <= postPEMulLog_uid64_fpPowrTest_im0_result_add_0_0_q(32 downto 0) & "000000000000000000000000000";
    postPEMulLog_uid64_fpPowrTest_align_7_q <= postPEMulLog_uid64_fpPowrTest_align_7_qint(59 downto 0);

    -- postPEMulLog_uid64_fpPowrTest_im3_cma(CHAINMULTADD,740)@12 + 2
    postPEMulLog_uid64_fpPowrTest_im3_cma_reset <= areset;
    postPEMulLog_uid64_fpPowrTest_im3_cma_ena0 <= '1';
    postPEMulLog_uid64_fpPowrTest_im3_cma_ena1 <= postPEMulLog_uid64_fpPowrTest_im3_cma_ena0;
    postPEMulLog_uid64_fpPowrTest_im3_cma_l(0) <= SIGNED(RESIZE(postPEMulLog_uid64_fpPowrTest_im3_cma_a0(0),28));
    postPEMulLog_uid64_fpPowrTest_im3_cma_p(0) <= postPEMulLog_uid64_fpPowrTest_im3_cma_l(0) * postPEMulLog_uid64_fpPowrTest_im3_cma_c0(0);
    postPEMulLog_uid64_fpPowrTest_im3_cma_u(0) <= RESIZE(postPEMulLog_uid64_fpPowrTest_im3_cma_p(0),53);
    postPEMulLog_uid64_fpPowrTest_im3_cma_w(0) <= postPEMulLog_uid64_fpPowrTest_im3_cma_u(0);
    postPEMulLog_uid64_fpPowrTest_im3_cma_x(0) <= postPEMulLog_uid64_fpPowrTest_im3_cma_w(0);
    postPEMulLog_uid64_fpPowrTest_im3_cma_y(0) <= postPEMulLog_uid64_fpPowrTest_im3_cma_x(0);
    postPEMulLog_uid64_fpPowrTest_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im3_cma_a0 <= (others => (others => '0'));
            postPEMulLog_uid64_fpPowrTest_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMulLog_uid64_fpPowrTest_im3_cma_ena0 = '1') THEN
                postPEMulLog_uid64_fpPowrTest_im3_cma_a0(0) <= RESIZE(UNSIGNED(postPEMulLog_uid64_fpPowrTest_bs2_merged_bit_select_c),27);
                postPEMulLog_uid64_fpPowrTest_im3_cma_c0(0) <= RESIZE(SIGNED(multTermOneLog_uid63_fpPowrTest_q),25);
            END IF;
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMulLog_uid64_fpPowrTest_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (postPEMulLog_uid64_fpPowrTest_im3_cma_ena1 = '1') THEN
                postPEMulLog_uid64_fpPowrTest_im3_cma_s(0) <= postPEMulLog_uid64_fpPowrTest_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    postPEMulLog_uid64_fpPowrTest_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im3_cma_s(0)(51 downto 0)), xout => postPEMulLog_uid64_fpPowrTest_im3_cma_qq, clk => clk, aclr => areset );
    postPEMulLog_uid64_fpPowrTest_im3_cma_q <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_im3_cma_qq(51 downto 0));

    -- redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1(DELAY,779)
    redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => postPEMulLog_uid64_fpPowrTest_im3_cma_q, xout => redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1_q, clk => clk, aclr => areset );

    -- postPEMulLog_uid64_fpPowrTest_result_add_0_0(ADD,583)@15
    postPEMulLog_uid64_fpPowrTest_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 52 => redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1_q(51)) & redist19_postPEMulLog_uid64_fpPowrTest_im3_cma_q_1_q));
    postPEMulLog_uid64_fpPowrTest_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 60 => postPEMulLog_uid64_fpPowrTest_align_7_q(59)) & postPEMulLog_uid64_fpPowrTest_align_7_q));
    postPEMulLog_uid64_fpPowrTest_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMulLog_uid64_fpPowrTest_result_add_0_0_a) + SIGNED(postPEMulLog_uid64_fpPowrTest_result_add_0_0_b));
    postPEMulLog_uid64_fpPowrTest_result_add_0_0_q <= postPEMulLog_uid64_fpPowrTest_result_add_0_0_o(60 downto 0);

    -- highBBits_uid68_fpPowrTest(BITSELECT,67)@15
    highBBits_uid68_fpPowrTest_in <= STD_LOGIC_VECTOR(postPEMulLog_uid64_fpPowrTest_result_add_0_0_q(59 downto 0));
    highBBits_uid68_fpPowrTest_b <= STD_LOGIC_VECTOR(highBBits_uid68_fpPowrTest_in(59 downto 20));

    -- redist61_highBBits_uid68_fpPowrTest_b_1(DELAY,821)
    redist61_highBBits_uid68_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highBBits_uid68_fpPowrTest_b, xout => redist61_highBBits_uid68_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest(CONSTANT,217)
    maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest_q <= "011111111111111111111111111111111111111111111";

    -- minValueInFormat_uid219_eLn2_uid49_fpPowrTest(CONSTANT,218)
    minValueInFormat_uid219_eLn2_uid49_fpPowrTest_q <= "100000000000000000000000000000000000000000000";

    -- redist93_exp_x_uid14_fpPowrTest_b_12_notEnable(LOGICAL,921)
    redist93_exp_x_uid14_fpPowrTest_b_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist93_exp_x_uid14_fpPowrTest_b_12_nor(LOGICAL,922)
    redist93_exp_x_uid14_fpPowrTest_b_12_nor_q <= not (redist93_exp_x_uid14_fpPowrTest_b_12_notEnable_q or redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q);

    -- redist93_exp_x_uid14_fpPowrTest_b_12_mem_last(CONSTANT,918)
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_last_q <= "01001";

    -- redist93_exp_x_uid14_fpPowrTest_b_12_cmp(LOGICAL,919)
    redist93_exp_x_uid14_fpPowrTest_b_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_q);
    redist93_exp_x_uid14_fpPowrTest_b_12_cmp_q <= "1" WHEN redist93_exp_x_uid14_fpPowrTest_b_12_mem_last_q = redist93_exp_x_uid14_fpPowrTest_b_12_cmp_b ELSE "0";

    -- redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg(REG,920)
    redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg_q <= STD_LOGIC_VECTOR(redist93_exp_x_uid14_fpPowrTest_b_12_cmp_q);
        END IF;
    END PROCESS;

    -- redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena(REG,923)
    redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist93_exp_x_uid14_fpPowrTest_b_12_nor_q = "1") THEN
                redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_exp_x_uid14_fpPowrTest_b_12_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_exp_x_uid14_fpPowrTest_b_12_enaAnd(LOGICAL,924)
    redist93_exp_x_uid14_fpPowrTest_b_12_enaAnd_q <= redist93_exp_x_uid14_fpPowrTest_b_12_sticky_ena_q and VCC_q;

    -- redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt(COUNTER,916)
    -- low=0, high=10, step=1, init=0
    redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq <= '1';
            ELSE
                redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq <= '0';
            END IF;
            IF (redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_eq = '1') THEN
                redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i <= redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i + 6;
            ELSE
                redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i <= redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_i, 4)));

    -- redist93_exp_x_uid14_fpPowrTest_b_12_wraddr(REG,917)
    redist93_exp_x_uid14_fpPowrTest_b_12_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist93_exp_x_uid14_fpPowrTest_b_12_wraddr_q <= STD_LOGIC_VECTOR(redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist93_exp_x_uid14_fpPowrTest_b_12_mem(DUALMEM,915)
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_ia <= STD_LOGIC_VECTOR(exp_x_uid14_fpPowrTest_b);
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_aa <= redist93_exp_x_uid14_fpPowrTest_b_12_wraddr_q;
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_ab <= redist93_exp_x_uid14_fpPowrTest_b_12_rdcnt_q;
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_reset0 <= areset;
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 11,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist93_exp_x_uid14_fpPowrTest_b_12_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist93_exp_x_uid14_fpPowrTest_b_12_mem_reset0,
        clock1 => clk,
        address_a => redist93_exp_x_uid14_fpPowrTest_b_12_mem_aa,
        data_a => redist93_exp_x_uid14_fpPowrTest_b_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_exp_x_uid14_fpPowrTest_b_12_mem_ab,
        q_b => redist93_exp_x_uid14_fpPowrTest_b_12_mem_iq
    );
    redist93_exp_x_uid14_fpPowrTest_b_12_mem_q <= redist93_exp_x_uid14_fpPowrTest_b_12_mem_iq(7 downto 0);

    -- redist94_exp_x_uid14_fpPowrTest_b_13(DELAY,854)
    redist94_exp_x_uid14_fpPowrTest_b_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist93_exp_x_uid14_fpPowrTest_b_12_mem_q, xout => redist94_exp_x_uid14_fpPowrTest_b_13_q, clk => clk, aclr => areset );

    -- e_uid48_fpPowrTest(SUB,47)@13
    e_uid48_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & redist94_exp_x_uid14_fpPowrTest_b_13_q);
    e_uid48_fpPowrTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid7_fpPowrTest_q);
    e_uid48_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid48_fpPowrTest_a) - UNSIGNED(e_uid48_fpPowrTest_b));
    e_uid48_fpPowrTest_q <= e_uid48_fpPowrTest_o(8 downto 0);

    -- xv0_uid210_eLn2_uid49_fpPowrTest(BITSELECT,209)@13
    xv0_uid210_eLn2_uid49_fpPowrTest_in <= e_uid48_fpPowrTest_q(5 downto 0);
    xv0_uid210_eLn2_uid49_fpPowrTest_b <= xv0_uid210_eLn2_uid49_fpPowrTest_in(5 downto 0);

    -- redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1(DELAY,799)
    redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv0_uid210_eLn2_uid49_fpPowrTest_b, xout => redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p0_uid213_eLn2_uid49_fpPowrTest(LOOKUP,212)@14
    p0_uid213_eLn2_uid49_fpPowrTest_combproc: PROCESS (redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist39_xv0_uid210_eLn2_uid49_fpPowrTest_b_1_q) IS
            WHEN "000000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000000000000000000000000000000000000000000000";
            WHEN "000001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000000101100010111001000010111111101111110000";
            WHEN "000010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000001011000101110010000101111111011111100000";
            WHEN "000011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000010000101000101011001000111111001111010000";
            WHEN "000100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000010110001011100100001011111110111111000000";
            WHEN "000101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000011011101110011101001110111110101110110000";
            WHEN "000110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000100001010001010110010001111110011110100000";
            WHEN "000111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000100110110100001111010100111110001110010000";
            WHEN "001000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000101100010111001000010111111101111110000000";
            WHEN "001001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000110001111010000001011010111101101101110000";
            WHEN "001010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000110111011100111010011101111101011101100000";
            WHEN "001011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "000111100111111110011100000111101001101010000";
            WHEN "001100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001000010100010101100100011111100111101000000";
            WHEN "001101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001001000000101100101100110111100101100110000";
            WHEN "001110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001001101101000011110101001111100011100100000";
            WHEN "001111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001010011001011010111101100111100001100010000";
            WHEN "010000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001011000101110010000101111111011111100000000";
            WHEN "010001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001011110010001001001110010111011101011110000";
            WHEN "010010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001100011110100000010110101111011011011100000";
            WHEN "010011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001101001010110111011111000111011001011010000";
            WHEN "010100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001101110111001110100111011111010111011000000";
            WHEN "010101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001110100011100101101111110111010101010110000";
            WHEN "010110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001111001111111100111000001111010011010100000";
            WHEN "010111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "001111111100010100000000100111010001010010000";
            WHEN "011000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010000101000101011001000111111001111010000000";
            WHEN "011001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010001010101000010010001010111001101001110000";
            WHEN "011010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010010000001011001011001101111001011001100000";
            WHEN "011011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010010101101110000100010000111001001001010000";
            WHEN "011100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010011011010000111101010011111000111001000000";
            WHEN "011101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010100000110011110110010110111000101000110000";
            WHEN "011110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010100110010110101111011001111000011000100000";
            WHEN "011111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010101011111001101000011100111000001000010000";
            WHEN "100000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010110001011100100001011111110111111000000000";
            WHEN "100001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010110110111111011010100010110111100111110000";
            WHEN "100010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "010111100100010010011100101110111010111100000";
            WHEN "100011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011000010000101001100101000110111000111010000";
            WHEN "100100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011000111101000000101101011110110110111000000";
            WHEN "100101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011001101001010111110101110110110100110110000";
            WHEN "100110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011010010101101110111110001110110010110100000";
            WHEN "100111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011011000010000110000110100110110000110010000";
            WHEN "101000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011011101110011101001110111110101110110000000";
            WHEN "101001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011100011010110100010111010110101100101110000";
            WHEN "101010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011101000111001011011111101110101010101100000";
            WHEN "101011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011101110011100010101000000110101000101010000";
            WHEN "101100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011110011111111001110000011110100110101000000";
            WHEN "101101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011111001100010000111000110110100100100110000";
            WHEN "101110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "011111111000101000000001001110100010100100000";
            WHEN "101111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100000100100111111001001100110100000100010000";
            WHEN "110000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100001010001010110010001111110011110100000000";
            WHEN "110001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100001111101101101011010010110011100011110000";
            WHEN "110010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100010101010000100100010101110011010011100000";
            WHEN "110011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100011010110011011101011000110011000011010000";
            WHEN "110100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100100000010110010110011011110010110011000000";
            WHEN "110101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100100101111001001111011110110010100010110000";
            WHEN "110110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100101011011100001000100001110010010010100000";
            WHEN "110111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100110000111111000001100100110010000010010000";
            WHEN "111000" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100110110100001111010100111110001110010000000";
            WHEN "111001" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "100111100000100110011101010110001100001110000";
            WHEN "111010" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101000001100111101100101101110001010001100000";
            WHEN "111011" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101000111001010100101110000110001000001010000";
            WHEN "111100" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101001100101101011110110011110000110001000000";
            WHEN "111101" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101010010010000010111110110110000100000110000";
            WHEN "111110" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101010111110011010000111001110000010000100000";
            WHEN "111111" => p0_uid213_eLn2_uid49_fpPowrTest_q <= "101011101010110001001111100110000000000010000";
            WHEN OTHERS => -- unreachable
                           p0_uid213_eLn2_uid49_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select(BITSELECT,750)@14
    lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b <= p0_uid213_eLn2_uid49_fpPowrTest_q(0 downto 0);
    lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_c <= p0_uid213_eLn2_uid49_fpPowrTest_q(44 downto 1);

    -- xv1_uid211_eLn2_uid49_fpPowrTest(BITSELECT,210)@13
    xv1_uid211_eLn2_uid49_fpPowrTest_b <= STD_LOGIC_VECTOR(e_uid48_fpPowrTest_q(8 downto 6));

    -- redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1(DELAY,798)
    redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv1_uid211_eLn2_uid49_fpPowrTest_b, xout => redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p1_uid212_eLn2_uid49_fpPowrTest(LOOKUP,211)@14
    p1_uid212_eLn2_uid49_fpPowrTest_combproc: PROCESS (redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist38_xv1_uid211_eLn2_uid49_fpPowrTest_b_1_q) IS
            WHEN "000" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "000000000000000000000000000000000000000000000010";
            WHEN "001" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "000010110001011100100001011111110111111000000010";
            WHEN "010" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "000101100010111001000010111111101111110000000010";
            WHEN "011" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "001000010100010101100100011111100111101000000010";
            WHEN "100" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "110100111010001101111010000000100000100000000010";
            WHEN "101" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "110111101011101010011011100000011000011000000010";
            WHEN "110" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "111010011101000110111101000000010000010000000010";
            WHEN "111" => p1_uid212_eLn2_uid49_fpPowrTest_q <= "111101001110100011011110100000001000001000000010";
            WHEN OTHERS => -- unreachable
                           p1_uid212_eLn2_uid49_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest(ADD,215)@14 + 1
    lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 48 => p1_uid212_eLn2_uid49_fpPowrTest_q(47)) & p1_uid212_eLn2_uid49_fpPowrTest_q));
    lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_c));
    lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_a) + SIGNED(lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_q <= lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_o(48 downto 0);

    -- redist8_lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b_1(DELAY,768)
    redist8_lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b, xout => redist8_lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- lev1_a0_uid217_eLn2_uid49_fpPowrTest(BITJOIN,216)@15
    lev1_a0_uid217_eLn2_uid49_fpPowrTest_q <= lev1_a0sumAHighB_uid216_eLn2_uid49_fpPowrTest_q & redist8_lowRangeB_uid214_eLn2_uid49_fpPowrTest_merged_bit_select_b_1_q;

    -- sR_uid227_eLn2_uid49_fpPowrTest(BITSELECT,226)@15
    sR_uid227_eLn2_uid49_fpPowrTest_in <= STD_LOGIC_VECTOR(lev1_a0_uid217_eLn2_uid49_fpPowrTest_q(47 downto 0));
    sR_uid227_eLn2_uid49_fpPowrTest_b <= STD_LOGIC_VECTOR(sR_uid227_eLn2_uid49_fpPowrTest_in(47 downto 3));

    -- paddingX_uid220_eLn2_uid49_fpPowrTest(CONSTANT,219)
    paddingX_uid220_eLn2_uid49_fpPowrTest_q <= "000";

    -- updatedX_uid221_eLn2_uid49_fpPowrTest(BITJOIN,220)@15
    updatedX_uid221_eLn2_uid49_fpPowrTest_q <= maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest_q & paddingX_uid220_eLn2_uid49_fpPowrTest_q;

    -- ovf_uid220_eLn2_uid49_fpPowrTest(COMPARE,221)@15
    ovf_uid220_eLn2_uid49_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 48 => updatedX_uid221_eLn2_uid49_fpPowrTest_q(47)) & updatedX_uid221_eLn2_uid49_fpPowrTest_q));
    ovf_uid220_eLn2_uid49_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => lev1_a0_uid217_eLn2_uid49_fpPowrTest_q(49)) & lev1_a0_uid217_eLn2_uid49_fpPowrTest_q));
    ovf_uid220_eLn2_uid49_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid220_eLn2_uid49_fpPowrTest_a) - SIGNED(ovf_uid220_eLn2_uid49_fpPowrTest_b));
    ovf_uid220_eLn2_uid49_fpPowrTest_c(0) <= ovf_uid220_eLn2_uid49_fpPowrTest_o(51);

    -- updatedY_uid224_eLn2_uid49_fpPowrTest(BITJOIN,223)@15
    updatedY_uid224_eLn2_uid49_fpPowrTest_q <= minValueInFormat_uid219_eLn2_uid49_fpPowrTest_q & paddingX_uid220_eLn2_uid49_fpPowrTest_q;

    -- udf_uid223_eLn2_uid49_fpPowrTest(COMPARE,224)@15
    udf_uid223_eLn2_uid49_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => lev1_a0_uid217_eLn2_uid49_fpPowrTest_q(49)) & lev1_a0_uid217_eLn2_uid49_fpPowrTest_q));
    udf_uid223_eLn2_uid49_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 48 => updatedY_uid224_eLn2_uid49_fpPowrTest_q(47)) & updatedY_uid224_eLn2_uid49_fpPowrTest_q));
    udf_uid223_eLn2_uid49_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid223_eLn2_uid49_fpPowrTest_a) - SIGNED(udf_uid223_eLn2_uid49_fpPowrTest_b));
    udf_uid223_eLn2_uid49_fpPowrTest_c(0) <= udf_uid223_eLn2_uid49_fpPowrTest_o(51);

    -- ovfudfcond_uid226_eLn2_uid49_fpPowrTest(BITJOIN,225)@15
    ovfudfcond_uid226_eLn2_uid49_fpPowrTest_q <= ovf_uid220_eLn2_uid49_fpPowrTest_c & udf_uid223_eLn2_uid49_fpPowrTest_c;

    -- sRA0_uid228_eLn2_uid49_fpPowrTest(MUX,227)@15 + 1
    sRA0_uid228_eLn2_uid49_fpPowrTest_s <= ovfudfcond_uid226_eLn2_uid49_fpPowrTest_q;
    sRA0_uid228_eLn2_uid49_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sRA0_uid228_eLn2_uid49_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sRA0_uid228_eLn2_uid49_fpPowrTest_s) IS
                WHEN "00" => sRA0_uid228_eLn2_uid49_fpPowrTest_q <= sR_uid227_eLn2_uid49_fpPowrTest_b;
                WHEN "01" => sRA0_uid228_eLn2_uid49_fpPowrTest_q <= minValueInFormat_uid219_eLn2_uid49_fpPowrTest_q;
                WHEN "10" => sRA0_uid228_eLn2_uid49_fpPowrTest_q <= maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest_q;
                WHEN "11" => sRA0_uid228_eLn2_uid49_fpPowrTest_q <= maxValInOutFormat_uid218_eLn2_uid49_fpPowrTest_q;
                WHEN OTHERS => sRA0_uid228_eLn2_uid49_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- finalSumLogsumAHighB_uid69_fpPowrTest(ADD,68)@16 + 1
    finalSumLogsumAHighB_uid69_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 45 => sRA0_uid228_eLn2_uid49_fpPowrTest_q(44)) & sRA0_uid228_eLn2_uid49_fpPowrTest_q));
    finalSumLogsumAHighB_uid69_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 40 => redist61_highBBits_uid68_fpPowrTest_b_1_q(39)) & redist61_highBBits_uid68_fpPowrTest_b_1_q));
    finalSumLogsumAHighB_uid69_fpPowrTest_i <= finalSumLogsumAHighB_uid69_fpPowrTest_b;
    finalSumLogsumAHighB_uid69_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            finalSumLogsumAHighB_uid69_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist70_caseLog_uid50_fpPowrTest_q_16_q = "1") THEN
                finalSumLogsumAHighB_uid69_fpPowrTest_o <= finalSumLogsumAHighB_uid69_fpPowrTest_i;
            ELSE
                finalSumLogsumAHighB_uid69_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumLogsumAHighB_uid69_fpPowrTest_a) + SIGNED(finalSumLogsumAHighB_uid69_fpPowrTest_b));
            END IF;
        END IF;
    END PROCESS;
    finalSumLogsumAHighB_uid69_fpPowrTest_q <= finalSumLogsumAHighB_uid69_fpPowrTest_o(45 downto 0);

    -- lowRangeB_uid67_fpPowrTest(BITSELECT,66)@15
    lowRangeB_uid67_fpPowrTest_in <= postPEMulLog_uid64_fpPowrTest_result_add_0_0_q(19 downto 0);
    lowRangeB_uid67_fpPowrTest_b <= lowRangeB_uid67_fpPowrTest_in(19 downto 0);

    -- redist62_lowRangeB_uid67_fpPowrTest_b_2(DELAY,822)
    redist62_lowRangeB_uid67_fpPowrTest_b_2 : dspba_delay
    GENERIC MAP ( width => 20, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid67_fpPowrTest_b, xout => redist62_lowRangeB_uid67_fpPowrTest_b_2_q, clk => clk, aclr => areset );

    -- finalSumLog_uid70_fpPowrTest(BITJOIN,69)@17
    finalSumLog_uid70_fpPowrTest_q <= finalSumLogsumAHighB_uid69_fpPowrTest_q & redist62_lowRangeB_uid67_fpPowrTest_b_2_q;

    -- finalSumSignLog_uid71_fpPowrTest(BITSELECT,70)@17
    finalSumSignLog_uid71_fpPowrTest_b <= STD_LOGIC_VECTOR(finalSumLog_uid70_fpPowrTest_q(65 downto 65));

    -- notCaseLog_uid77_fpPowrTest(LOGICAL,76)@17
    notCaseLog_uid77_fpPowrTest_q <= not (redist71_caseLog_uid50_fpPowrTest_q_17_q);

    -- signSignLog_uid78_fpPowrTest(LOGICAL,77)@17
    signSignLog_uid78_fpPowrTest_q <= notCaseLog_uid77_fpPowrTest_q and finalSumSignLog_uid71_fpPowrTest_b;

    -- redist71_caseLog_uid50_fpPowrTest_q_17(DELAY,831)
    redist71_caseLog_uid50_fpPowrTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist70_caseLog_uid50_fpPowrTest_q_16_q, xout => redist71_caseLog_uid50_fpPowrTest_q_17_q, clk => clk, aclr => areset );

    -- signRLog0_uid79_fpPowrTest(LOGICAL,78)@17 + 1
    signRLog0_uid79_fpPowrTest_qi <= redist71_caseLog_uid50_fpPowrTest_q_17_q or signSignLog_uid78_fpPowrTest_q;
    signRLog0_uid79_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRLog0_uid79_fpPowrTest_qi, xout => signRLog0_uid79_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist59_signRLog0_uid79_fpPowrTest_q_9(DELAY,819)
    redist59_signRLog0_uid79_fpPowrTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRLog0_uid79_fpPowrTest_q, xout => redist59_signRLog0_uid79_fpPowrTest_q_9_q, clk => clk, aclr => areset );

    -- expXIsMax_uid17_fpPowrTest(LOGICAL,16)@13 + 1
    expXIsMax_uid17_fpPowrTest_qi <= "1" WHEN redist94_exp_x_uid14_fpPowrTest_b_13_q = cstAllOWE_uid11_fpPowrTest_q ELSE "0";
    expXIsMax_uid17_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid17_fpPowrTest_qi, xout => expXIsMax_uid17_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist87_expXIsMax_uid17_fpPowrTest_q_13(DELAY,847)
    redist87_expXIsMax_uid17_fpPowrTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid17_fpPowrTest_q, xout => redist87_expXIsMax_uid17_fpPowrTest_q_13_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid22_fpPowrTest(LOGICAL,21)@26
    invExpXIsMax_uid22_fpPowrTest_q <= not (redist87_expXIsMax_uid17_fpPowrTest_q_13_q);

    -- excZ_x_uid16_fpPowrTest(LOGICAL,15)@13 + 1
    excZ_x_uid16_fpPowrTest_qi <= "1" WHEN redist94_exp_x_uid14_fpPowrTest_b_13_q = cstAllZWE_uid13_fpPowrTest_q ELSE "0";
    excZ_x_uid16_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid16_fpPowrTest_qi, xout => excZ_x_uid16_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist88_excZ_x_uid16_fpPowrTest_q_13(DELAY,848)
    redist88_excZ_x_uid16_fpPowrTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid16_fpPowrTest_q, xout => redist88_excZ_x_uid16_fpPowrTest_q_13_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid23_fpPowrTest(LOGICAL,22)@26
    InvExpXIsZero_uid23_fpPowrTest_q <= not (redist88_excZ_x_uid16_fpPowrTest_q_13_q);

    -- excR_x_uid24_fpPowrTest(LOGICAL,23)@26
    excR_x_uid24_fpPowrTest_q <= InvExpXIsZero_uid23_fpPowrTest_q and invExpXIsMax_uid22_fpPowrTest_q;

    -- signRLog_uid80_fpPowrTest(LOGICAL,79)@26 + 1
    signRLog_uid80_fpPowrTest_qi <= excR_x_uid24_fpPowrTest_q and redist59_signRLog0_uid79_fpPowrTest_q_9_q;
    signRLog_uid80_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRLog_uid80_fpPowrTest_qi, xout => signRLog_uid80_fpPowrTest_q, clk => clk, aclr => areset );

    -- signProd_uid104_fpPowrTest(LOGICAL,103)@27
    signProd_uid104_fpPowrTest_q <= signRLog_uid80_fpPowrTest_q xor redist73_signY_uid42_fpPowrTest_b_4_q;

    -- frac_y_uid29_fpPowrTest(BITSELECT,28)@23
    frac_y_uid29_fpPowrTest_b <= redist95_xIn_b_23_outputreg_q(22 downto 0);

    -- oFracY_uid89_fpPowrTest(BITJOIN,88)@23
    oFracY_uid89_fpPowrTest_q <= VCC_q & frac_y_uid29_fpPowrTest_b;

    -- prodYLogX_uid91_fpPowrTest_im0_bs1(BITSELECT,723)@23
    prodYLogX_uid91_fpPowrTest_im0_bs1_b <= oFracY_uid89_fpPowrTest_q(23 downto 18);

    -- zs_uid292_countZLog_uid75_fpPowrTest(CONSTANT,291)
    zs_uid292_countZLog_uid75_fpPowrTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- finalSumOneCompLog_uid73_fpPowrTest(LOGICAL,72)@17
    finalSumOneCompLog_uid73_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((65 downto 1 => finalSumSignLog_uid71_fpPowrTest_b(0)) & finalSumSignLog_uid71_fpPowrTest_b));
    finalSumOneCompLog_uid73_fpPowrTest_q <= finalSumLog_uid70_fpPowrTest_q xor finalSumOneCompLog_uid73_fpPowrTest_b;

    -- finalSumAbsLog_uid74_fpPowrTest(ADD,73)@17 + 1
    finalSumAbsLog_uid74_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & finalSumOneCompLog_uid73_fpPowrTest_q);
    finalSumAbsLog_uid74_fpPowrTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & finalSumSignLog_uid71_fpPowrTest_b);
    finalSumAbsLog_uid74_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            finalSumAbsLog_uid74_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            finalSumAbsLog_uid74_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(finalSumAbsLog_uid74_fpPowrTest_a) + UNSIGNED(finalSumAbsLog_uid74_fpPowrTest_b));
        END IF;
    END PROCESS;
    finalSumAbsLog_uid74_fpPowrTest_q <= finalSumAbsLog_uid74_fpPowrTest_o(66 downto 0);

    -- rVStage_uid293_countZLog_uid75_fpPowrTest(BITSELECT,292)@18
    rVStage_uid293_countZLog_uid75_fpPowrTest_b <= finalSumAbsLog_uid74_fpPowrTest_q(66 downto 3);

    -- vCount_uid294_countZLog_uid75_fpPowrTest(LOGICAL,293)@18
    vCount_uid294_countZLog_uid75_fpPowrTest_q <= "1" WHEN rVStage_uid293_countZLog_uid75_fpPowrTest_b = zs_uid292_countZLog_uid75_fpPowrTest_q ELSE "0";

    -- redist35_vCount_uid294_countZLog_uid75_fpPowrTest_q_3(DELAY,795)
    redist35_vCount_uid294_countZLog_uid75_fpPowrTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid294_countZLog_uid75_fpPowrTest_q, xout => redist35_vCount_uid294_countZLog_uid75_fpPowrTest_q_3_q, clk => clk, aclr => areset );

    -- zs_uid300_countZLog_uid75_fpPowrTest(CONSTANT,299)
    zs_uid300_countZLog_uid75_fpPowrTest_q <= "00000000000000000000000000000000";

    -- vStage_uid296_countZLog_uid75_fpPowrTest(BITSELECT,295)@18
    vStage_uid296_countZLog_uid75_fpPowrTest_in <= finalSumAbsLog_uid74_fpPowrTest_q(2 downto 0);
    vStage_uid296_countZLog_uid75_fpPowrTest_b <= vStage_uid296_countZLog_uid75_fpPowrTest_in(2 downto 0);

    -- mO_uid295_countZLog_uid75_fpPowrTest(CONSTANT,294)
    mO_uid295_countZLog_uid75_fpPowrTest_q <= "1111111111111111111111111111111111111111111111111111111111111";

    -- cStage_uid297_countZLog_uid75_fpPowrTest(BITJOIN,296)@18
    cStage_uid297_countZLog_uid75_fpPowrTest_q <= vStage_uid296_countZLog_uid75_fpPowrTest_b & mO_uid295_countZLog_uid75_fpPowrTest_q;

    -- vStagei_uid299_countZLog_uid75_fpPowrTest(MUX,298)@18 + 1
    vStagei_uid299_countZLog_uid75_fpPowrTest_s <= vCount_uid294_countZLog_uid75_fpPowrTest_q;
    vStagei_uid299_countZLog_uid75_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid299_countZLog_uid75_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid299_countZLog_uid75_fpPowrTest_s) IS
                WHEN "0" => vStagei_uid299_countZLog_uid75_fpPowrTest_q <= rVStage_uid293_countZLog_uid75_fpPowrTest_b;
                WHEN "1" => vStagei_uid299_countZLog_uid75_fpPowrTest_q <= cStage_uid297_countZLog_uid75_fpPowrTest_q;
                WHEN OTHERS => vStagei_uid299_countZLog_uid75_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select(BITSELECT,752)@19
    rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_b <= vStagei_uid299_countZLog_uid75_fpPowrTest_q(63 downto 32);
    rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_c <= vStagei_uid299_countZLog_uid75_fpPowrTest_q(31 downto 0);

    -- vCount_uid302_countZLog_uid75_fpPowrTest(LOGICAL,301)@19
    vCount_uid302_countZLog_uid75_fpPowrTest_q <= "1" WHEN rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_b = zs_uid300_countZLog_uid75_fpPowrTest_q ELSE "0";

    -- redist33_vCount_uid302_countZLog_uid75_fpPowrTest_q_2(DELAY,793)
    redist33_vCount_uid302_countZLog_uid75_fpPowrTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid302_countZLog_uid75_fpPowrTest_q, xout => redist33_vCount_uid302_countZLog_uid75_fpPowrTest_q_2_q, clk => clk, aclr => areset );

    -- zs_uid306_countZLog_uid75_fpPowrTest(CONSTANT,305)
    zs_uid306_countZLog_uid75_fpPowrTest_q <= "0000000000000000";

    -- vStagei_uid305_countZLog_uid75_fpPowrTest(MUX,304)@19
    vStagei_uid305_countZLog_uid75_fpPowrTest_s <= vCount_uid302_countZLog_uid75_fpPowrTest_q;
    vStagei_uid305_countZLog_uid75_fpPowrTest_combproc: PROCESS (vStagei_uid305_countZLog_uid75_fpPowrTest_s, rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_b, rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid305_countZLog_uid75_fpPowrTest_s) IS
            WHEN "0" => vStagei_uid305_countZLog_uid75_fpPowrTest_q <= rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid305_countZLog_uid75_fpPowrTest_q <= rVStage_uid301_countZLog_uid75_fpPowrTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid305_countZLog_uid75_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select(BITSELECT,753)@19
    rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b <= vStagei_uid305_countZLog_uid75_fpPowrTest_q(31 downto 16);
    rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c <= vStagei_uid305_countZLog_uid75_fpPowrTest_q(15 downto 0);

    -- vCount_uid308_countZLog_uid75_fpPowrTest(LOGICAL,307)@19 + 1
    vCount_uid308_countZLog_uid75_fpPowrTest_qi <= "1" WHEN rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b = zs_uid306_countZLog_uid75_fpPowrTest_q ELSE "0";
    vCount_uid308_countZLog_uid75_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid308_countZLog_uid75_fpPowrTest_qi, xout => vCount_uid308_countZLog_uid75_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist32_vCount_uid308_countZLog_uid75_fpPowrTest_q_2(DELAY,792)
    redist32_vCount_uid308_countZLog_uid75_fpPowrTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid308_countZLog_uid75_fpPowrTest_q, xout => redist32_vCount_uid308_countZLog_uid75_fpPowrTest_q_2_q, clk => clk, aclr => areset );

    -- redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1(DELAY,767)
    redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c, xout => redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1(DELAY,766)
    redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b, xout => redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid311_countZLog_uid75_fpPowrTest(MUX,310)@20
    vStagei_uid311_countZLog_uid75_fpPowrTest_s <= vCount_uid308_countZLog_uid75_fpPowrTest_q;
    vStagei_uid311_countZLog_uid75_fpPowrTest_combproc: PROCESS (vStagei_uid311_countZLog_uid75_fpPowrTest_s, redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q, redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid311_countZLog_uid75_fpPowrTest_s) IS
            WHEN "0" => vStagei_uid311_countZLog_uid75_fpPowrTest_q <= redist6_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid311_countZLog_uid75_fpPowrTest_q <= redist7_rVStage_uid307_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid311_countZLog_uid75_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select(BITSELECT,754)@20
    rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_b <= vStagei_uid311_countZLog_uid75_fpPowrTest_q(15 downto 8);
    rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_c <= vStagei_uid311_countZLog_uid75_fpPowrTest_q(7 downto 0);

    -- vCount_uid314_countZLog_uid75_fpPowrTest(LOGICAL,313)@20
    vCount_uid314_countZLog_uid75_fpPowrTest_q <= "1" WHEN rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_b = cstAllZWE_uid13_fpPowrTest_q ELSE "0";

    -- redist31_vCount_uid314_countZLog_uid75_fpPowrTest_q_1(DELAY,791)
    redist31_vCount_uid314_countZLog_uid75_fpPowrTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid314_countZLog_uid75_fpPowrTest_q, xout => redist31_vCount_uid314_countZLog_uid75_fpPowrTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid317_countZLog_uid75_fpPowrTest(MUX,316)@20
    vStagei_uid317_countZLog_uid75_fpPowrTest_s <= vCount_uid314_countZLog_uid75_fpPowrTest_q;
    vStagei_uid317_countZLog_uid75_fpPowrTest_combproc: PROCESS (vStagei_uid317_countZLog_uid75_fpPowrTest_s, rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_b, rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid317_countZLog_uid75_fpPowrTest_s) IS
            WHEN "0" => vStagei_uid317_countZLog_uid75_fpPowrTest_q <= rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid317_countZLog_uid75_fpPowrTest_q <= rVStage_uid313_countZLog_uid75_fpPowrTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid317_countZLog_uid75_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select(BITSELECT,755)@20
    rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b <= vStagei_uid317_countZLog_uid75_fpPowrTest_q(7 downto 4);
    rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c <= vStagei_uid317_countZLog_uid75_fpPowrTest_q(3 downto 0);

    -- vCount_uid320_countZLog_uid75_fpPowrTest(LOGICAL,319)@20 + 1
    vCount_uid320_countZLog_uid75_fpPowrTest_qi <= "1" WHEN rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b = zs_uid318_countZLog_uid75_fpPowrTest_q ELSE "0";
    vCount_uid320_countZLog_uid75_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid320_countZLog_uid75_fpPowrTest_qi, xout => vCount_uid320_countZLog_uid75_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1(DELAY,765)
    redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c, xout => redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1(DELAY,764)
    redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b, xout => redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid323_countZLog_uid75_fpPowrTest(MUX,322)@21
    vStagei_uid323_countZLog_uid75_fpPowrTest_s <= vCount_uid320_countZLog_uid75_fpPowrTest_q;
    vStagei_uid323_countZLog_uid75_fpPowrTest_combproc: PROCESS (vStagei_uid323_countZLog_uid75_fpPowrTest_s, redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q, redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid323_countZLog_uid75_fpPowrTest_s) IS
            WHEN "0" => vStagei_uid323_countZLog_uid75_fpPowrTest_q <= redist4_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid323_countZLog_uid75_fpPowrTest_q <= redist5_rVStage_uid319_countZLog_uid75_fpPowrTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid323_countZLog_uid75_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select(BITSELECT,756)@21
    rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_b <= vStagei_uid323_countZLog_uid75_fpPowrTest_q(3 downto 2);
    rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_c <= vStagei_uid323_countZLog_uid75_fpPowrTest_q(1 downto 0);

    -- vCount_uid326_countZLog_uid75_fpPowrTest(LOGICAL,325)@21
    vCount_uid326_countZLog_uid75_fpPowrTest_q <= "1" WHEN rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_b = z2_uid60_fpPowrTest_q ELSE "0";

    -- vStagei_uid329_countZLog_uid75_fpPowrTest(MUX,328)@21
    vStagei_uid329_countZLog_uid75_fpPowrTest_s <= vCount_uid326_countZLog_uid75_fpPowrTest_q;
    vStagei_uid329_countZLog_uid75_fpPowrTest_combproc: PROCESS (vStagei_uid329_countZLog_uid75_fpPowrTest_s, rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_b, rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid329_countZLog_uid75_fpPowrTest_s) IS
            WHEN "0" => vStagei_uid329_countZLog_uid75_fpPowrTest_q <= rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid329_countZLog_uid75_fpPowrTest_q <= rVStage_uid325_countZLog_uid75_fpPowrTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid329_countZLog_uid75_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid331_countZLog_uid75_fpPowrTest(BITSELECT,330)@21
    rVStage_uid331_countZLog_uid75_fpPowrTest_b <= vStagei_uid329_countZLog_uid75_fpPowrTest_q(1 downto 1);

    -- vCount_uid332_countZLog_uid75_fpPowrTest(LOGICAL,331)@21
    vCount_uid332_countZLog_uid75_fpPowrTest_q <= "1" WHEN rVStage_uid331_countZLog_uid75_fpPowrTest_b = GND_q ELSE "0";

    -- r_uid333_countZLog_uid75_fpPowrTest(BITJOIN,332)@21
    r_uid333_countZLog_uid75_fpPowrTest_q <= redist35_vCount_uid294_countZLog_uid75_fpPowrTest_q_3_q & redist33_vCount_uid302_countZLog_uid75_fpPowrTest_q_2_q & redist32_vCount_uid308_countZLog_uid75_fpPowrTest_q_2_q & redist31_vCount_uid314_countZLog_uid75_fpPowrTest_q_1_q & vCount_uid320_countZLog_uid75_fpPowrTest_q & vCount_uid326_countZLog_uid75_fpPowrTest_q & vCount_uid332_countZLog_uid75_fpPowrTest_q;

    -- cstMSBFinalSumPBias_uid81_fpPowrTest(CONSTANT,80)
    cstMSBFinalSumPBias_uid81_fpPowrTest_q <= "010001001";

    -- expRExtLog_uid82_fpPowrTest(SUB,81)@21 + 1
    expRExtLog_uid82_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid81_fpPowrTest_q);
    expRExtLog_uid82_fpPowrTest_b <= STD_LOGIC_VECTOR("000" & r_uid333_countZLog_uid75_fpPowrTest_q);
    expRExtLog_uid82_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRExtLog_uid82_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRExtLog_uid82_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExtLog_uid82_fpPowrTest_a) - UNSIGNED(expRExtLog_uid82_fpPowrTest_b));
        END IF;
    END PROCESS;
    expRExtLog_uid82_fpPowrTest_q <= expRExtLog_uid82_fpPowrTest_o(9 downto 0);

    -- leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest(BITSELECT,618)@22
    leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_in <= leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q(65 downto 0);
    leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_b <= leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_in(65 downto 0);

    -- leftShiftStage3Idx1_uid620_normValLog_uid76_fpPowrTest(BITJOIN,619)@22
    leftShiftStage3Idx1_uid620_normValLog_uid76_fpPowrTest_q <= leftShiftStage3Idx1Rng1_uid619_normValLog_uid76_fpPowrTest_b & GND_q;

    -- leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest(BITSELECT,613)@22
    leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_in <= leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q(60 downto 0);
    leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_b <= leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_in(60 downto 0);

    -- leftShiftStage2Idx3Pad6_uid613_normValLog_uid76_fpPowrTest(CONSTANT,612)
    leftShiftStage2Idx3Pad6_uid613_normValLog_uid76_fpPowrTest_q <= "000000";

    -- leftShiftStage2Idx3_uid615_normValLog_uid76_fpPowrTest(BITJOIN,614)@22
    leftShiftStage2Idx3_uid615_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx3Rng6_uid614_normValLog_uid76_fpPowrTest_b & leftShiftStage2Idx3Pad6_uid613_normValLog_uid76_fpPowrTest_q;

    -- leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest(BITSELECT,610)@22
    leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_in <= leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q(62 downto 0);
    leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_b <= leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_in(62 downto 0);

    -- leftShiftStage2Idx2_uid612_normValLog_uid76_fpPowrTest(BITJOIN,611)@22
    leftShiftStage2Idx2_uid612_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx2Rng4_uid611_normValLog_uid76_fpPowrTest_b & zs_uid318_countZLog_uid75_fpPowrTest_q;

    -- leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest(BITSELECT,607)@22
    leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_in <= leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q(64 downto 0);
    leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_b <= leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_in(64 downto 0);

    -- leftShiftStage2Idx1_uid609_normValLog_uid76_fpPowrTest(BITJOIN,608)@22
    leftShiftStage2Idx1_uid609_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx1Rng2_uid608_normValLog_uid76_fpPowrTest_b & z2_uid60_fpPowrTest_q;

    -- leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest(BITSELECT,602)@21
    leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_in <= leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q(42 downto 0);
    leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_b <= leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_in(42 downto 0);

    -- leftShiftStage1Idx3Pad24_uid602_normValLog_uid76_fpPowrTest(CONSTANT,601)
    leftShiftStage1Idx3Pad24_uid602_normValLog_uid76_fpPowrTest_q <= "000000000000000000000000";

    -- leftShiftStage1Idx3_uid604_normValLog_uid76_fpPowrTest(BITJOIN,603)@21
    leftShiftStage1Idx3_uid604_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx3Rng24_uid603_normValLog_uid76_fpPowrTest_b & leftShiftStage1Idx3Pad24_uid602_normValLog_uid76_fpPowrTest_q;

    -- leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest(BITSELECT,599)@21
    leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_in <= leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q(50 downto 0);
    leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_b <= leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_in(50 downto 0);

    -- leftShiftStage1Idx2_uid601_normValLog_uid76_fpPowrTest(BITJOIN,600)@21
    leftShiftStage1Idx2_uid601_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx2Rng16_uid600_normValLog_uid76_fpPowrTest_b & zs_uid306_countZLog_uid75_fpPowrTest_q;

    -- leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest(BITSELECT,596)@21
    leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_in <= leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q(58 downto 0);
    leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_b <= leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_in(58 downto 0);

    -- leftShiftStage1Idx1_uid598_normValLog_uid76_fpPowrTest(BITJOIN,597)@21
    leftShiftStage1Idx1_uid598_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx1Rng8_uid597_normValLog_uid76_fpPowrTest_b & cstAllZWE_uid13_fpPowrTest_q;

    -- leftShiftStage0Idx3_uid593_normValLog_uid76_fpPowrTest(CONSTANT,592)
    leftShiftStage0Idx3_uid593_normValLog_uid76_fpPowrTest_q <= "0000000000000000000000000000000000000000000000000000000000000000000";

    -- redist34_vStage_uid296_countZLog_uid75_fpPowrTest_b_3(DELAY,794)
    redist34_vStage_uid296_countZLog_uid75_fpPowrTest_b_3 : dspba_delay
    GENERIC MAP ( width => 3, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid296_countZLog_uid75_fpPowrTest_b, xout => redist34_vStage_uid296_countZLog_uid75_fpPowrTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid592_normValLog_uid76_fpPowrTest(BITJOIN,591)@21
    leftShiftStage0Idx2_uid592_normValLog_uid76_fpPowrTest_q <= redist34_vStage_uid296_countZLog_uid75_fpPowrTest_b_3_q & zs_uid292_countZLog_uid75_fpPowrTest_q;

    -- leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest(BITSELECT,587)@21
    leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_in <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_q(34 downto 0);
    leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_b <= leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_in(34 downto 0);

    -- leftShiftStage0Idx1_uid589_normValLog_uid76_fpPowrTest(BITJOIN,588)@21
    leftShiftStage0Idx1_uid589_normValLog_uid76_fpPowrTest_q <= leftShiftStage0Idx1Rng32_uid588_normValLog_uid76_fpPowrTest_b & zs_uid300_countZLog_uid75_fpPowrTest_q;

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_notEnable(LOGICAL,891)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_nor(LOGICAL,892)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_nor_q <= not (redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_notEnable_q or redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q);

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg(REG,890)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena(REG,893)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_nor_q = "1") THEN
                redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_enaAnd(LOGICAL,894)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_enaAnd_q <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_sticky_ena_q and VCC_q;

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt(COUNTER,888)
    -- low=0, high=1, step=1, init=0
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_i, 1)));

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr(REG,889)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr_q <= STD_LOGIC_VECTOR(redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem(DUALMEM,887)
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ia <= STD_LOGIC_VECTOR(finalSumAbsLog_uid74_fpPowrTest_q);
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_aa <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_wraddr_q;
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ab <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_rdcnt_q;
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_reset0 <= areset;
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 67,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 67,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_reset0,
        clock1 => clk,
        address_a => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_aa,
        data_a => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_ab,
        q_b => redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_iq
    );
    redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_q <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_iq(66 downto 0);

    -- leftShiftStage0_uid595_normValLog_uid76_fpPowrTest(MUX,594)@21
    leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_s <= leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_b;
    leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_combproc: PROCESS (leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_s, redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_q, leftShiftStage0Idx1_uid589_normValLog_uid76_fpPowrTest_q, leftShiftStage0Idx2_uid592_normValLog_uid76_fpPowrTest_q, leftShiftStage0Idx3_uid593_normValLog_uid76_fpPowrTest_q)
    BEGIN
        CASE (leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_s) IS
            WHEN "00" => leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q <= redist60_finalSumAbsLog_uid74_fpPowrTest_q_4_mem_q;
            WHEN "01" => leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q <= leftShiftStage0Idx1_uid589_normValLog_uid76_fpPowrTest_q;
            WHEN "10" => leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q <= leftShiftStage0Idx2_uid592_normValLog_uid76_fpPowrTest_q;
            WHEN "11" => leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q <= leftShiftStage0Idx3_uid593_normValLog_uid76_fpPowrTest_q;
            WHEN OTHERS => leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select(BITSELECT,757)@21
    leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_b <= r_uid333_countZLog_uid75_fpPowrTest_q(6 downto 5);
    leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_c <= r_uid333_countZLog_uid75_fpPowrTest_q(4 downto 3);
    leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d <= r_uid333_countZLog_uid75_fpPowrTest_q(2 downto 1);
    leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e <= r_uid333_countZLog_uid75_fpPowrTest_q(0 downto 0);

    -- leftShiftStage1_uid606_normValLog_uid76_fpPowrTest(MUX,605)@21 + 1
    leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_s <= leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_c;
    leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_s) IS
                WHEN "00" => leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= leftShiftStage0_uid595_normValLog_uid76_fpPowrTest_q;
                WHEN "01" => leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx1_uid598_normValLog_uid76_fpPowrTest_q;
                WHEN "10" => leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx2_uid601_normValLog_uid76_fpPowrTest_q;
                WHEN "11" => leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= leftShiftStage1Idx3_uid604_normValLog_uid76_fpPowrTest_q;
                WHEN OTHERS => leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d_1(DELAY,762)
    redist2_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d, xout => redist2_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid617_normValLog_uid76_fpPowrTest(MUX,616)@22
    leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_s <= redist2_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_d_1_q;
    leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_combproc: PROCESS (leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_s, leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q, leftShiftStage2Idx1_uid609_normValLog_uid76_fpPowrTest_q, leftShiftStage2Idx2_uid612_normValLog_uid76_fpPowrTest_q, leftShiftStage2Idx3_uid615_normValLog_uid76_fpPowrTest_q)
    BEGIN
        CASE (leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_s) IS
            WHEN "00" => leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q <= leftShiftStage1_uid606_normValLog_uid76_fpPowrTest_q;
            WHEN "01" => leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx1_uid609_normValLog_uid76_fpPowrTest_q;
            WHEN "10" => leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx2_uid612_normValLog_uid76_fpPowrTest_q;
            WHEN "11" => leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q <= leftShiftStage2Idx3_uid615_normValLog_uid76_fpPowrTest_q;
            WHEN OTHERS => leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e_1(DELAY,763)
    redist3_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e, xout => redist3_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e_1_q, clk => clk, aclr => areset );

    -- leftShiftStage3_uid622_normValLog_uid76_fpPowrTest(MUX,621)@22
    leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_s <= redist3_leftShiftStageSel6Dto5_uid594_normValLog_uid76_fpPowrTest_merged_bit_select_e_1_q;
    leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_combproc: PROCESS (leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_s, leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q, leftShiftStage3Idx1_uid620_normValLog_uid76_fpPowrTest_q)
    BEGIN
        CASE (leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_s) IS
            WHEN "0" => leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_q <= leftShiftStage2_uid617_normValLog_uid76_fpPowrTest_q;
            WHEN "1" => leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_q <= leftShiftStage3Idx1_uid620_normValLog_uid76_fpPowrTest_q;
            WHEN OTHERS => leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreRndLog_uid83_fpPowrTest(BITSELECT,82)@22
    fracRPreRndLog_uid83_fpPowrTest_in <= leftShiftStage3_uid622_normValLog_uid76_fpPowrTest_q(65 downto 0);
    fracRPreRndLog_uid83_fpPowrTest_b <= fracRPreRndLog_uid83_fpPowrTest_in(65 downto 32);

    -- expFracConc_uid84_fpPowrTest(BITJOIN,83)@22
    expFracConc_uid84_fpPowrTest_q <= expRExtLog_uid82_fpPowrTest_q & fracRPreRndLog_uid83_fpPowrTest_b;

    -- expFracPostRndLog_uid86_fpPowrTest(ADD,85)@22
    expFracPostRndLog_uid86_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid84_fpPowrTest_q);
    expFracPostRndLog_uid86_fpPowrTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000" & VCC_q);
    expFracPostRndLog_uid86_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndLog_uid86_fpPowrTest_a) + UNSIGNED(expFracPostRndLog_uid86_fpPowrTest_b));
    expFracPostRndLog_uid86_fpPowrTest_q <= expFracPostRndLog_uid86_fpPowrTest_o(44 downto 0);

    -- fracRLog_uid87_fpPowrTest(BITSELECT,86)@22
    fracRLog_uid87_fpPowrTest_in <= expFracPostRndLog_uid86_fpPowrTest_q(33 downto 0);
    fracRLog_uid87_fpPowrTest_b <= fracRLog_uid87_fpPowrTest_in(33 downto 1);

    -- redist58_fracRLog_uid87_fpPowrTest_b_1(DELAY,818)
    redist58_fracRLog_uid87_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRLog_uid87_fpPowrTest_b, xout => redist58_fracRLog_uid87_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- oFracLog_uid90_fpPowrTest(BITJOIN,89)@23
    oFracLog_uid90_fpPowrTest_q <= VCC_q & redist58_fracRLog_uid87_fpPowrTest_b_1_q;

    -- prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select(BITSELECT,747)@23
    prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_b <= oFracLog_uid90_fpPowrTest_q(33 downto 27);
    prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c <= oFracLog_uid90_fpPowrTest_q(26 downto 0);

    -- prodYLogX_uid91_fpPowrTest_im0_im0(MULT,722)@23 + 2
    prodYLogX_uid91_fpPowrTest_im0_im0_pr <= UNSIGNED(UNSIGNED(prodYLogX_uid91_fpPowrTest_im0_im0_a0) * UNSIGNED(prodYLogX_uid91_fpPowrTest_im0_im0_b0));
    prodYLogX_uid91_fpPowrTest_im0_im0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_im0_a0 <= (others => '0');
            prodYLogX_uid91_fpPowrTest_im0_im0_b0 <= (others => '0');
            prodYLogX_uid91_fpPowrTest_im0_im0_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_im0_a0 <= prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_b;
            prodYLogX_uid91_fpPowrTest_im0_im0_b0 <= prodYLogX_uid91_fpPowrTest_im0_bs1_b;
            prodYLogX_uid91_fpPowrTest_im0_im0_s1 <= STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im0_im0_pr);
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im0_im0_q <= prodYLogX_uid91_fpPowrTest_im0_im0_s1;

    -- prodYLogX_uid91_fpPowrTest_im0_align_8(BITSHIFT,730)@25
    prodYLogX_uid91_fpPowrTest_im0_align_8_qint <= prodYLogX_uid91_fpPowrTest_im0_im0_q & "000000000000000000";
    prodYLogX_uid91_fpPowrTest_im0_align_8_q <= prodYLogX_uid91_fpPowrTest_im0_align_8_qint(30 downto 0);

    -- prodYLogX_uid91_fpPowrTest_im0_bs4(BITSELECT,726)@23
    prodYLogX_uid91_fpPowrTest_im0_bs4_in <= STD_LOGIC_VECTOR(oFracY_uid89_fpPowrTest_q(17 downto 0));
    prodYLogX_uid91_fpPowrTest_im0_bs4_b <= STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im0_bs4_in(17 downto 0));

    -- prodYLogX_uid91_fpPowrTest_im0_bjA5(BITJOIN,727)@23
    prodYLogX_uid91_fpPowrTest_im0_bjA5_q <= GND_q & prodYLogX_uid91_fpPowrTest_im0_bs4_b;

    -- prodYLogX_uid91_fpPowrTest_im0_im3_cma(CHAINMULTADD,743)@23 + 2
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_reset <= areset;
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena0 <= '1';
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena1 <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena0;
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_r(0) <= SIGNED(RESIZE(prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0(0),11));
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_p(0) <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_a0(0) * prodYLogX_uid91_fpPowrTest_im0_im3_cma_r(0);
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_u(0) <= RESIZE(prodYLogX_uid91_fpPowrTest_im0_im3_cma_p(0),30);
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_w(0) <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_u(0);
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_x(0) <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_w(0);
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_y(0) <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_x(0);
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_im3_cma_a0 <= (others => (others => '0'));
            prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena0 = '1') THEN
                prodYLogX_uid91_fpPowrTest_im0_im3_cma_a0(0) <= RESIZE(SIGNED(prodYLogX_uid91_fpPowrTest_im0_bjA5_q),19);
                prodYLogX_uid91_fpPowrTest_im0_im3_cma_c0(0) <= RESIZE(UNSIGNED(prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_b),10);
            END IF;
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodYLogX_uid91_fpPowrTest_im0_im3_cma_ena1 = '1') THEN
                prodYLogX_uid91_fpPowrTest_im0_im3_cma_s(0) <= prodYLogX_uid91_fpPowrTest_im0_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im0_im3_cma_s(0)(28 downto 0)), xout => prodYLogX_uid91_fpPowrTest_im0_im3_cma_qq, clk => clk, aclr => areset );
    prodYLogX_uid91_fpPowrTest_im0_im3_cma_q <= STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im0_im3_cma_qq(25 downto 0));

    -- prodYLogX_uid91_fpPowrTest_im0_result_add_0_0(ADD,732)@25 + 1
    prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => prodYLogX_uid91_fpPowrTest_im0_im3_cma_q(25)) & prodYLogX_uid91_fpPowrTest_im0_im3_cma_q));
    prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & prodYLogX_uid91_fpPowrTest_im0_align_8_q));
    prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_a) + SIGNED(prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_b));
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_q <= prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_o(32 downto 0);

    -- prodYLogX_uid91_fpPowrTest_align_7(BITSHIFT,630)@26
    prodYLogX_uid91_fpPowrTest_align_7_qint <= prodYLogX_uid91_fpPowrTest_im0_result_add_0_0_q(30 downto 0) & "000000000000000000000000000";
    prodYLogX_uid91_fpPowrTest_align_7_q <= prodYLogX_uid91_fpPowrTest_align_7_qint(57 downto 0);

    -- redist56_oFracY_uid89_fpPowrTest_q_1(DELAY,816)
    redist56_oFracY_uid89_fpPowrTest_q_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracY_uid89_fpPowrTest_q, xout => redist56_oFracY_uid89_fpPowrTest_q_1_q, clk => clk, aclr => areset );

    -- redist18_prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c_1(DELAY,778)
    redist18_prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c, xout => redist18_prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- prodYLogX_uid91_fpPowrTest_im3_cma(CHAINMULTADD,741)@24 + 2
    prodYLogX_uid91_fpPowrTest_im3_cma_reset <= areset;
    prodYLogX_uid91_fpPowrTest_im3_cma_ena0 <= '1';
    prodYLogX_uid91_fpPowrTest_im3_cma_ena1 <= prodYLogX_uid91_fpPowrTest_im3_cma_ena0;
    prodYLogX_uid91_fpPowrTest_im3_cma_p(0) <= prodYLogX_uid91_fpPowrTest_im3_cma_a0(0) * prodYLogX_uid91_fpPowrTest_im3_cma_c0(0);
    prodYLogX_uid91_fpPowrTest_im3_cma_u(0) <= RESIZE(prodYLogX_uid91_fpPowrTest_im3_cma_p(0),51);
    prodYLogX_uid91_fpPowrTest_im3_cma_w(0) <= prodYLogX_uid91_fpPowrTest_im3_cma_u(0);
    prodYLogX_uid91_fpPowrTest_im3_cma_x(0) <= prodYLogX_uid91_fpPowrTest_im3_cma_w(0);
    prodYLogX_uid91_fpPowrTest_im3_cma_y(0) <= prodYLogX_uid91_fpPowrTest_im3_cma_x(0);
    prodYLogX_uid91_fpPowrTest_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im3_cma_a0 <= (others => (others => '0'));
            prodYLogX_uid91_fpPowrTest_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodYLogX_uid91_fpPowrTest_im3_cma_ena0 = '1') THEN
                prodYLogX_uid91_fpPowrTest_im3_cma_a0(0) <= RESIZE(UNSIGNED(redist18_prodYLogX_uid91_fpPowrTest_bs2_merged_bit_select_c_1_q),27);
                prodYLogX_uid91_fpPowrTest_im3_cma_c0(0) <= RESIZE(UNSIGNED(redist56_oFracY_uid89_fpPowrTest_q_1_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodYLogX_uid91_fpPowrTest_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodYLogX_uid91_fpPowrTest_im3_cma_ena1 = '1') THEN
                prodYLogX_uid91_fpPowrTest_im3_cma_s(0) <= prodYLogX_uid91_fpPowrTest_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodYLogX_uid91_fpPowrTest_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 51, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im3_cma_s(0)(50 downto 0)), xout => prodYLogX_uid91_fpPowrTest_im3_cma_qq, clk => clk, aclr => areset );
    prodYLogX_uid91_fpPowrTest_im3_cma_q <= STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_im3_cma_qq(50 downto 0));

    -- prodYLogX_uid91_fpPowrTest_result_add_0_0(ADD,632)@26
    prodYLogX_uid91_fpPowrTest_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000" & prodYLogX_uid91_fpPowrTest_im3_cma_q);
    prodYLogX_uid91_fpPowrTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & prodYLogX_uid91_fpPowrTest_align_7_q);
    prodYLogX_uid91_fpPowrTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodYLogX_uid91_fpPowrTest_result_add_0_0_a) + UNSIGNED(prodYLogX_uid91_fpPowrTest_result_add_0_0_b));
    prodYLogX_uid91_fpPowrTest_result_add_0_0_q <= prodYLogX_uid91_fpPowrTest_result_add_0_0_o(58 downto 0);

    -- normProdYLogXHigh_uid94_fpPowrTest(BITSELECT,93)@26
    normProdYLogXHigh_uid94_fpPowrTest_in <= prodYLogX_uid91_fpPowrTest_result_add_0_0_q(56 downto 0);
    normProdYLogXHigh_uid94_fpPowrTest_b <= normProdYLogXHigh_uid94_fpPowrTest_in(56 downto 24);

    -- normProdYLogXLow_uid95_fpPowrTest(BITSELECT,94)@26
    normProdYLogXLow_uid95_fpPowrTest_in <= prodYLogX_uid91_fpPowrTest_result_add_0_0_q(55 downto 0);
    normProdYLogXLow_uid95_fpPowrTest_b <= normProdYLogXLow_uid95_fpPowrTest_in(55 downto 23);

    -- prodNormBit_uid92_fpPowrTest(BITSELECT,91)@26
    prodNormBit_uid92_fpPowrTest_in <= STD_LOGIC_VECTOR(prodYLogX_uid91_fpPowrTest_result_add_0_0_q(57 downto 0));
    prodNormBit_uid92_fpPowrTest_b <= STD_LOGIC_VECTOR(prodNormBit_uid92_fpPowrTest_in(57 downto 57));

    -- normProdYLogX_uid96_fpPowrTest(MUX,95)@26 + 1
    normProdYLogX_uid96_fpPowrTest_s <= prodNormBit_uid92_fpPowrTest_b;
    normProdYLogX_uid96_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            normProdYLogX_uid96_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (normProdYLogX_uid96_fpPowrTest_s) IS
                WHEN "0" => normProdYLogX_uid96_fpPowrTest_q <= normProdYLogXLow_uid95_fpPowrTest_b;
                WHEN "1" => normProdYLogX_uid96_fpPowrTest_q <= normProdYLogXHigh_uid94_fpPowrTest_b;
                WHEN OTHERS => normProdYLogX_uid96_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracProd_uid97_fpPowrTest(BITJOIN,96)@27
    oFracProd_uid97_fpPowrTest_q <= VCC_q & normProdYLogX_uid96_fpPowrTest_q;

    -- zoFracQ_uid109_fpPowrTest(BITJOIN,108)@27
    zoFracQ_uid109_fpPowrTest_q <= GND_q & oFracProd_uid97_fpPowrTest_q;

    -- onesCmpFxpInQ_uid110_fpPowrTest(LOGICAL,109)@27
    onesCmpFxpInQ_uid110_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 1 => signProd_uid104_fpPowrTest_q(0)) & signProd_uid104_fpPowrTest_q));
    onesCmpFxpInQ_uid110_fpPowrTest_q <= zoFracQ_uid109_fpPowrTest_q xor onesCmpFxpInQ_uid110_fpPowrTest_b;

    -- fxpInExtQ_uid111_fpPowrTest(ADD,110)@27
    fxpInExtQ_uid111_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpInQ_uid110_fpPowrTest_q);
    fxpInExtQ_uid111_fpPowrTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & signProd_uid104_fpPowrTest_q);
    fxpInExtQ_uid111_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExtQ_uid111_fpPowrTest_a) + UNSIGNED(fxpInExtQ_uid111_fpPowrTest_b));
    fxpInExtQ_uid111_fpPowrTest_q <= fxpInExtQ_uid111_fpPowrTest_o(35 downto 0);

    -- fxpInQPreConstMult_uid112_fpPowrTest(BITSELECT,111)@27
    fxpInQPreConstMult_uid112_fpPowrTest_in <= STD_LOGIC_VECTOR(fxpInExtQ_uid111_fpPowrTest_q(34 downto 0));
    fxpInQPreConstMult_uid112_fpPowrTest_b <= STD_LOGIC_VECTOR(fxpInQPreConstMult_uid112_fpPowrTest_in(34 downto 0));

    -- xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,334)@27
    xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_in <= fxpInQPreConstMult_uid112_fpPowrTest_b(5 downto 0);
    xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b <= xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_in(5 downto 0);

    -- redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2(DELAY,790)
    redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q, clk => clk, aclr => areset );

    -- p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,345)@29
    p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist30_xv0_uid335_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q) IS
            WHEN "000000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000000000000";
            WHEN "000001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000010111000";
            WHEN "000010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000101110001";
            WHEN "000011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001000101001";
            WHEN "000100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001011100010";
            WHEN "000101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001110011011";
            WHEN "000110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010001010011";
            WHEN "000111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010100001100";
            WHEN "001000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010111000101";
            WHEN "001001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011001111101";
            WHEN "001010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011100110110";
            WHEN "001011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011111101111";
            WHEN "001100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100010100111";
            WHEN "001101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100101100000";
            WHEN "001110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101000011001";
            WHEN "001111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101011010001";
            WHEN "010000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101110001010";
            WHEN "010001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110001000011";
            WHEN "010010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110011111011";
            WHEN "010011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110110110100";
            WHEN "010100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111001101101";
            WHEN "010101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111100100101";
            WHEN "010110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111111011110";
            WHEN "010111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000010010111";
            WHEN "011000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000101001111";
            WHEN "011001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001000001000";
            WHEN "011010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001011000001";
            WHEN "011011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001101111001";
            WHEN "011100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010000110010";
            WHEN "011101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010011101011";
            WHEN "011110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010110100011";
            WHEN "011111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011001011100";
            WHEN "100000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011100010101";
            WHEN "100001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011111001101";
            WHEN "100010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100010000110";
            WHEN "100011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100100111111";
            WHEN "100100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100111110111";
            WHEN "100101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101010110000";
            WHEN "100110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101101101001";
            WHEN "100111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110000100001";
            WHEN "101000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110011011010";
            WHEN "101001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110110010011";
            WHEN "101010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111001001011";
            WHEN "101011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111100000100";
            WHEN "101100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111110111101";
            WHEN "101101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000001110101";
            WHEN "101110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000100101110";
            WHEN "101111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000111100111";
            WHEN "110000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001010011111";
            WHEN "110001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001101011000";
            WHEN "110010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010000010001";
            WHEN "110011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010011001001";
            WHEN "110100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010110000010";
            WHEN "110101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011000111011";
            WHEN "110110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011011110011";
            WHEN "110111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011110101100";
            WHEN "111000" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100001100101";
            WHEN "111001" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100100011101";
            WHEN "111010" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100111010110";
            WHEN "111011" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101010001111";
            WHEN "111100" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101101000111";
            WHEN "111101" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110000000000";
            WHEN "111110" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110010111001";
            WHEN "111111" => p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110101110001";
            WHEN OTHERS => -- unreachable
                           p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,335)@27
    xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_in <= fxpInQPreConstMult_uid112_fpPowrTest_b(11 downto 0);
    xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b <= xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_in(11 downto 6);

    -- redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2(DELAY,789)
    redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q, clk => clk, aclr => areset );

    -- p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,344)@29
    p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist29_xv1_uid336_qTimesOOlog2Ext_uid113_fpPowrTest_b_2_q) IS
            WHEN "000000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000000000000000000";
            WHEN "000001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000010111000101010";
            WHEN "000010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000101110001010101";
            WHEN "000011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001000101001111111";
            WHEN "000100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001011100010101010";
            WHEN "000101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001110011011010100";
            WHEN "000110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010001010011111111";
            WHEN "000111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010100001100101001";
            WHEN "001000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010111000101010100";
            WHEN "001001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011001111101111111";
            WHEN "001010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011100110110101001";
            WHEN "001011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011111101111010100";
            WHEN "001100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100010100111111110";
            WHEN "001101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100101100000101001";
            WHEN "001110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101000011001010011";
            WHEN "001111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101011010001111110";
            WHEN "010000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101110001010101000";
            WHEN "010001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110001000011010011";
            WHEN "010010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110011111011111110";
            WHEN "010011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110110110100101000";
            WHEN "010100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111001101101010011";
            WHEN "010101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111100100101111101";
            WHEN "010110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111111011110101000";
            WHEN "010111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000010010111010010";
            WHEN "011000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000101001111111101";
            WHEN "011001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001000001000100111";
            WHEN "011010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001011000001010010";
            WHEN "011011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001101111001111101";
            WHEN "011100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010000110010100111";
            WHEN "011101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010011101011010010";
            WHEN "011110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010110100011111100";
            WHEN "011111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011001011100100111";
            WHEN "100000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011100010101010001";
            WHEN "100001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011111001101111100";
            WHEN "100010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100010000110100110";
            WHEN "100011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100100111111010001";
            WHEN "100100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100111110111111100";
            WHEN "100101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101010110000100110";
            WHEN "100110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101101101001010001";
            WHEN "100111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110000100001111011";
            WHEN "101000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110011011010100110";
            WHEN "101001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110110010011010000";
            WHEN "101010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111001001011111011";
            WHEN "101011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111100000100100101";
            WHEN "101100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111110111101010000";
            WHEN "101101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000001110101111011";
            WHEN "101110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000100101110100101";
            WHEN "101111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000111100111010000";
            WHEN "110000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001010011111111010";
            WHEN "110001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001101011000100101";
            WHEN "110010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010000010001001111";
            WHEN "110011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010011001001111010";
            WHEN "110100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010110000010100101";
            WHEN "110101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011000111011001111";
            WHEN "110110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011011110011111010";
            WHEN "110111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011110101100100100";
            WHEN "111000" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100001100101001111";
            WHEN "111001" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100100011101111001";
            WHEN "111010" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100111010110100100";
            WHEN "111011" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101010001111001110";
            WHEN "111100" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101101000111111001";
            WHEN "111101" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110000000000100100";
            WHEN "111110" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110010111001001110";
            WHEN "111111" => p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110101110001111001";
            WHEN OTHERS => -- unreachable
                           p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest(ADD,351)@29 + 1
    lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & p1_uid345_qTimesOOlog2Ext_uid113_fpPowrTest_q);
    lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR("0000000" & p0_uid346_qTimesOOlog2Ext_uid113_fpPowrTest_q);
    lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_a) + UNSIGNED(lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_o(20 downto 0);

    -- xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,336)@27
    xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_in <= fxpInQPreConstMult_uid112_fpPowrTest_b(17 downto 0);
    xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b <= xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_in(17 downto 12);

    -- redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1(DELAY,788)
    redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,343)@28
    p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist28_xv2_uid337_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q) IS
            WHEN "000000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000000000000000000000000";
            WHEN "000001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000010111000101010100011";
            WHEN "000010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000101110001010101000111";
            WHEN "000011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001000101001111111101011";
            WHEN "000100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001011100010101010001110";
            WHEN "000101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001110011011010100110010";
            WHEN "000110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010001010011111111010110";
            WHEN "000111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010100001100101001111001";
            WHEN "001000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010111000101010100011101";
            WHEN "001001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011001111101111111000001";
            WHEN "001010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011100110110101001100100";
            WHEN "001011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011111101111010100001000";
            WHEN "001100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100010100111111110101100";
            WHEN "001101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100101100000101001010000";
            WHEN "001110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101000011001010011110011";
            WHEN "001111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101011010001111110010111";
            WHEN "010000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101110001010101000111011";
            WHEN "010001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110001000011010011011110";
            WHEN "010010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110011111011111110000010";
            WHEN "010011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110110110100101000100110";
            WHEN "010100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111001101101010011001001";
            WHEN "010101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111100100101111101101101";
            WHEN "010110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111111011110101000010001";
            WHEN "010111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000010010111010010110101";
            WHEN "011000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000101001111111101011000";
            WHEN "011001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001000001000100111111100";
            WHEN "011010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001011000001010010100000";
            WHEN "011011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001101111001111101000011";
            WHEN "011100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010000110010100111100111";
            WHEN "011101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010011101011010010001011";
            WHEN "011110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010110100011111100101110";
            WHEN "011111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011001011100100111010010";
            WHEN "100000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011100010101010001110110";
            WHEN "100001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011111001101111100011010";
            WHEN "100010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100010000110100110111101";
            WHEN "100011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100100111111010001100001";
            WHEN "100100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100111110111111100000101";
            WHEN "100101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101010110000100110101000";
            WHEN "100110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101101101001010001001100";
            WHEN "100111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110000100001111011110000";
            WHEN "101000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110011011010100110010011";
            WHEN "101001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110110010011010000110111";
            WHEN "101010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111001001011111011011011";
            WHEN "101011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111100000100100101111110";
            WHEN "101100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111110111101010000100010";
            WHEN "101101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000001110101111011000110";
            WHEN "101110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000100101110100101101010";
            WHEN "101111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000111100111010000001101";
            WHEN "110000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001010011111111010110001";
            WHEN "110001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001101011000100101010101";
            WHEN "110010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010000010001001111111000";
            WHEN "110011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010011001001111010011100";
            WHEN "110100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010110000010100101000000";
            WHEN "110101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011000111011001111100011";
            WHEN "110110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011011110011111010000111";
            WHEN "110111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011110101100100100101011";
            WHEN "111000" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100001100101001111001111";
            WHEN "111001" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100100011101111001110010";
            WHEN "111010" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100111010110100100010110";
            WHEN "111011" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101010001111001110111010";
            WHEN "111100" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101101000111111001011101";
            WHEN "111101" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110000000000100100000001";
            WHEN "111110" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110010111001001110100101";
            WHEN "111111" => p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110101110001111001001000";
            WHEN OTHERS => -- unreachable
                           p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,337)@27
    xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_in <= fxpInQPreConstMult_uid112_fpPowrTest_b(23 downto 0);
    xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b <= xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_in(23 downto 18);

    -- redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1(DELAY,787)
    redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,342)@28
    p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist27_xv3_uid338_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q) IS
            WHEN "000000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000000000000000000000000000000";
            WHEN "000001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000010111000101010100011101100";
            WHEN "000010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000101110001010101000111011001";
            WHEN "000011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001000101001111111101011000101";
            WHEN "000100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001011100010101010001110110010";
            WHEN "000101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001110011011010100110010011111";
            WHEN "000110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010001010011111111010110001011";
            WHEN "000111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010100001100101001111001111000";
            WHEN "001000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010111000101010100011101100101";
            WHEN "001001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011001111101111111000001010001";
            WHEN "001010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011100110110101001100100111110";
            WHEN "001011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011111101111010100001000101011";
            WHEN "001100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100010100111111110101100010111";
            WHEN "001101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100101100000101001010000000100";
            WHEN "001110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101000011001010011110011110001";
            WHEN "001111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101011010001111110010111011101";
            WHEN "010000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101110001010101000111011001010";
            WHEN "010001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110001000011010011011110110110";
            WHEN "010010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110011111011111110000010100011";
            WHEN "010011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110110110100101000100110010000";
            WHEN "010100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111001101101010011001001111100";
            WHEN "010101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111100100101111101101101101001";
            WHEN "010110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111111011110101000010001010110";
            WHEN "010111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000010010111010010110101000010";
            WHEN "011000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000101001111111101011000101111";
            WHEN "011001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001000001000100111111100011100";
            WHEN "011010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001011000001010010100000001000";
            WHEN "011011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001101111001111101000011110101";
            WHEN "011100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010000110010100111100111100010";
            WHEN "011101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010011101011010010001011001110";
            WHEN "011110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010110100011111100101110111011";
            WHEN "011111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011001011100100111010010101000";
            WHEN "100000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011100010101010001110110010100";
            WHEN "100001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011111001101111100011010000001";
            WHEN "100010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100010000110100110111101101101";
            WHEN "100011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100100111111010001100001011010";
            WHEN "100100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100111110111111100000101000111";
            WHEN "100101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101010110000100110101000110011";
            WHEN "100110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101101101001010001001100100000";
            WHEN "100111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110000100001111011110000001101";
            WHEN "101000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110011011010100110010011111001";
            WHEN "101001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110110010011010000110111100110";
            WHEN "101010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111001001011111011011011010011";
            WHEN "101011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111100000100100101111110111111";
            WHEN "101100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111110111101010000100010101100";
            WHEN "101101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000001110101111011000110011001";
            WHEN "101110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000100101110100101101010000101";
            WHEN "101111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000111100111010000001101110010";
            WHEN "110000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001010011111111010110001011111";
            WHEN "110001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001101011000100101010101001011";
            WHEN "110010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010000010001001111111000111000";
            WHEN "110011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010011001001111010011100100100";
            WHEN "110100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010110000010100101000000010001";
            WHEN "110101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011000111011001111100011111110";
            WHEN "110110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011011110011111010000111101010";
            WHEN "110111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011110101100100100101011010111";
            WHEN "111000" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100001100101001111001111000100";
            WHEN "111001" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100100011101111001110010110000";
            WHEN "111010" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100111010110100100010110011101";
            WHEN "111011" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101010001111001110111010001010";
            WHEN "111100" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101101000111111001011101110110";
            WHEN "111101" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110000000000100100000001100011";
            WHEN "111110" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110010111001001110100101010000";
            WHEN "111111" => p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110101110001111001001000111100";
            WHEN OTHERS => -- unreachable
                           p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest(ADD,350)@28 + 1
    lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & p3_uid343_qTimesOOlog2Ext_uid113_fpPowrTest_q);
    lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR("0000000" & p2_uid344_qTimesOOlog2Ext_uid113_fpPowrTest_q);
    lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_a) + UNSIGNED(lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_o(32 downto 0);

    -- xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,338)@27
    xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_in <= fxpInQPreConstMult_uid112_fpPowrTest_b(29 downto 0);
    xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b <= xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_in(29 downto 24);

    -- redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1(DELAY,786)
    redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,341)@28
    p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist26_xv4_uid339_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q) IS
            WHEN "000000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000000000000000000000000000000000000";
            WHEN "000001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000010111000101010100011101100101001";
            WHEN "000010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00000101110001010101000111011001010010";
            WHEN "000011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001000101001111111101011000101111100";
            WHEN "000100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001011100010101010001110110010100101";
            WHEN "000101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00001110011011010100110010011111001110";
            WHEN "000110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010001010011111111010110001011111000";
            WHEN "000111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010100001100101001111001111000100001";
            WHEN "001000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00010111000101010100011101100101001010";
            WHEN "001001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011001111101111111000001010001110100";
            WHEN "001010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011100110110101001100100111110011101";
            WHEN "001011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00011111101111010100001000101011000110";
            WHEN "001100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100010100111111110101100010111110000";
            WHEN "001101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00100101100000101001010000000100011001";
            WHEN "001110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101000011001010011110011110001000011";
            WHEN "001111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101011010001111110010111011101101100";
            WHEN "010000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00101110001010101000111011001010010101";
            WHEN "010001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110001000011010011011110110110111111";
            WHEN "010010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110011111011111110000010100011101000";
            WHEN "010011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00110110110100101000100110010000010001";
            WHEN "010100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111001101101010011001001111100111011";
            WHEN "010101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111100100101111101101101101001100100";
            WHEN "010110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "00111111011110101000010001010110001101";
            WHEN "010111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000010010111010010110101000010110111";
            WHEN "011000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01000101001111111101011000101111100000";
            WHEN "011001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001000001000100111111100011100001001";
            WHEN "011010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001011000001010010100000001000110011";
            WHEN "011011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01001101111001111101000011110101011100";
            WHEN "011100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010000110010100111100111100010000110";
            WHEN "011101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010011101011010010001011001110101111";
            WHEN "011110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01010110100011111100101110111011011000";
            WHEN "011111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011001011100100111010010101000000010";
            WHEN "100000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011100010101010001110110010100101011";
            WHEN "100001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01011111001101111100011010000001010100";
            WHEN "100010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100010000110100110111101101101111110";
            WHEN "100011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100100111111010001100001011010100111";
            WHEN "100100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01100111110111111100000101000111010000";
            WHEN "100101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101010110000100110101000110011111010";
            WHEN "100110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01101101101001010001001100100000100011";
            WHEN "100111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110000100001111011110000001101001101";
            WHEN "101000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110011011010100110010011111001110110";
            WHEN "101001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01110110010011010000110111100110011111";
            WHEN "101010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111001001011111011011011010011001001";
            WHEN "101011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111100000100100101111110111111110010";
            WHEN "101100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "01111110111101010000100010101100011011";
            WHEN "101101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000001110101111011000110011001000101";
            WHEN "101110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000100101110100101101010000101101110";
            WHEN "101111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10000111100111010000001101110010010111";
            WHEN "110000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001010011111111010110001011111000001";
            WHEN "110001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10001101011000100101010101001011101010";
            WHEN "110010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010000010001001111111000111000010011";
            WHEN "110011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010011001001111010011100100100111101";
            WHEN "110100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10010110000010100101000000010001100110";
            WHEN "110101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011000111011001111100011111110010000";
            WHEN "110110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011011110011111010000111101010111001";
            WHEN "110111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10011110101100100100101011010111100010";
            WHEN "111000" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100001100101001111001111000100001100";
            WHEN "111001" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100100011101111001110010110000110101";
            WHEN "111010" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10100111010110100100010110011101011110";
            WHEN "111011" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101010001111001110111010001010001000";
            WHEN "111100" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10101101000111111001011101110110110001";
            WHEN "111101" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110000000000100100000001100011011010";
            WHEN "111110" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110010111001001110100101010000000100";
            WHEN "111111" => p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "10110101110001111001001000111100101101";
            WHEN OTHERS => -- unreachable
                           p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select(BITSELECT,758)@28
    lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b <= p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q(0 downto 0);
    lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_c <= p4_uid342_qTimesOOlog2Ext_uid113_fpPowrTest_q(37 downto 1);

    -- xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,339)@27
    xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(fxpInQPreConstMult_uid112_fpPowrTest_b(34 downto 30));

    -- redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1(DELAY,785)
    redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b, xout => redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest(LOOKUP,340)@28
    p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_combproc: PROCESS (redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist25_xv5_uid340_qTimesOOlog2Ext_uid113_fpPowrTest_b_1_q) IS
            WHEN "00000" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000000000000000000000000000000000000000100";
            WHEN "00001" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000001011100010101010001110110010100101111";
            WHEN "00010" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000010111000101010100011101100101001011011";
            WHEN "00011" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000100010100111111110101100010111110000110";
            WHEN "00100" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000101110001010101000111011001010010110010";
            WHEN "00101" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0000111001101101010011001001111100111011101";
            WHEN "00110" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001000101001111111101011000101111100001001";
            WHEN "00111" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001010000110010100111100111100010000110100";
            WHEN "01000" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001011100010101010001110110010100101100000";
            WHEN "01001" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001100111110111111100000101000111010001011";
            WHEN "01010" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001110011011010100110010011111001110110111";
            WHEN "01011" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0001111110111101010000100010101100011100010";
            WHEN "01100" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0010001010011111111010110001011111000001110";
            WHEN "01101" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0010010110000010100101000000010001100111001";
            WHEN "01110" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0010100001100101001111001111000100001100101";
            WHEN "01111" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "0010101101000111111001011101110110110010000";
            WHEN "10000" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1101000111010101011100010011010110101001100";
            WHEN "10001" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1101010010111000000110100010001001001110111";
            WHEN "10010" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1101011110011010110000110000111011110100011";
            WHEN "10011" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1101101001111101011010111111101110011001110";
            WHEN "10100" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1101110101100000000101001110100000111111010";
            WHEN "10101" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110000001000010101111011101010011100100101";
            WHEN "10110" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110001100100101011001101100000110001010001";
            WHEN "10111" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110011000001000000011111010111000101111100";
            WHEN "11000" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110100011101010101110001001101011010101000";
            WHEN "11001" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110101111001101011000011000011101111010011";
            WHEN "11010" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1110111010110000000010100111010000011111111";
            WHEN "11011" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1111000110010010101100110110000011000101010";
            WHEN "11100" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1111010001110101010111000100110101101010110";
            WHEN "11101" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1111011101011000000001010011101000010000001";
            WHEN "11110" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1111101000111010101011100010011010110101101";
            WHEN "11111" => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= "1111110100011101010101110001001101011011000";
            WHEN OTHERS => -- unreachable
                           p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest(ADD,348)@28 + 1
    lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((44 downto 43 => p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q(42)) & p5_uid341_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_c));
    lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_a) + SIGNED(lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_o(43 downto 0);

    -- redist1_lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b_1(DELAY,761)
    redist1_lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b, xout => redist1_lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- lev1_a0_uid350_qTimesOOlog2Ext_uid113_fpPowrTest(BITJOIN,349)@29
    lev1_a0_uid350_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev1_a0sumAHighB_uid349_qTimesOOlog2Ext_uid113_fpPowrTest_q & redist1_lowRangeB_uid347_qTimesOOlog2Ext_uid113_fpPowrTest_merged_bit_select_b_1_q;

    -- lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest(ADD,352)@29 + 1
    lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 45 => lev1_a0_uid350_qTimesOOlog2Ext_uid113_fpPowrTest_q(44)) & lev1_a0_uid350_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & lev1_a1_uid351_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_a) + SIGNED(lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_o(45 downto 0);

    -- lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest(ADD,353)@30 + 1
    lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 46 => lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_q(45)) & lev2_a0_uid353_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000000000000000" & lev1_a2_uid352_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_a) + SIGNED(lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q <= lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_o(46 downto 0);

    -- sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest(BITSELECT,363)@31
    sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_in <= STD_LOGIC_VECTOR(lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q(42 downto 0));
    sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_in(42 downto 4));

    -- updatedX_uid358_qTimesOOlog2Ext_uid113_fpPowrTest(BITJOIN,357)@31
    updatedX_uid358_qTimesOOlog2Ext_uid113_fpPowrTest_q <= maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest_q & zs_uid318_countZLog_uid75_fpPowrTest_q;

    -- ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest(COMPARE,358)@31
    ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 43 => updatedX_uid358_qTimesOOlog2Ext_uid113_fpPowrTest_q(42)) & updatedX_uid358_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q(46)) & lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_a) - SIGNED(ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_b));
    ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_c(0) <= ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_o(48);

    -- updatedY_uid361_qTimesOOlog2Ext_uid113_fpPowrTest(BITJOIN,360)@31
    updatedY_uid361_qTimesOOlog2Ext_uid113_fpPowrTest_q <= minValueInFormat_uid356_qTimesOOlog2Ext_uid113_fpPowrTest_q & zs_uid318_countZLog_uid75_fpPowrTest_q;

    -- udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest(COMPARE,361)@31
    udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q(46)) & lev3_a0_uid354_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 43 => updatedY_uid361_qTimesOOlog2Ext_uid113_fpPowrTest_q(42)) & updatedY_uid361_qTimesOOlog2Ext_uid113_fpPowrTest_q));
    udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_a) - SIGNED(udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_b));
    udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_c(0) <= udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_o(48);

    -- ovfudfcond_uid363_qTimesOOlog2Ext_uid113_fpPowrTest(BITJOIN,362)@31
    ovfudfcond_uid363_qTimesOOlog2Ext_uid113_fpPowrTest_q <= ovf_uid357_qTimesOOlog2Ext_uid113_fpPowrTest_c & udf_uid360_qTimesOOlog2Ext_uid113_fpPowrTest_c;

    -- sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest(MUX,364)@31 + 1
    sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_s <= ovfudfcond_uid363_qTimesOOlog2Ext_uid113_fpPowrTest_q;
    sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_s) IS
                WHEN "00" => sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= sR_uid364_qTimesOOlog2Ext_uid113_fpPowrTest_b;
                WHEN "01" => sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= minValueInFormat_uid356_qTimesOOlog2Ext_uid113_fpPowrTest_q;
                WHEN "10" => sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest_q;
                WHEN "11" => sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= maxValInOutFormat_uid355_qTimesOOlog2Ext_uid113_fpPowrTest_q;
                WHEN OTHERS => sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracXZwE_uid115_fpPowrTest(BITJOIN,114)@32
    oFracXZwE_uid115_fpPowrTest_q <= sRA0_uid365_qTimesOOlog2Ext_uid113_fpPowrTest_q & cstAllZWE_uid13_fpPowrTest_q;

    -- xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,633)@32
    xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b <= STD_LOGIC_VECTOR(oFracXZwE_uid115_fpPowrTest_q(46 downto 46));

    -- seMsb_to3_uid662(BITSELECT,661)@32
    seMsb_to3_uid662_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to3_uid662_b <= STD_LOGIC_VECTOR(seMsb_to3_uid662_in(2 downto 0));

    -- rightShiftStage2Idx3Rng3_uid663_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,662)@32
    rightShiftStage2Idx3Rng3_uid663_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 3);

    -- rightShiftStage2Idx3_uid664_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,663)@32
    rightShiftStage2Idx3_uid664_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to3_uid662_b & rightShiftStage2Idx3Rng3_uid663_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- seMsb_to2_uid659(BITSELECT,658)@32
    seMsb_to2_uid659_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to2_uid659_b <= STD_LOGIC_VECTOR(seMsb_to2_uid659_in(1 downto 0));

    -- rightShiftStage2Idx2Rng2_uid660_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,659)@32
    rightShiftStage2Idx2Rng2_uid660_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 2);

    -- rightShiftStage2Idx2_uid661_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,660)@32
    rightShiftStage2Idx2_uid661_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to2_uid659_b & rightShiftStage2Idx2Rng2_uid660_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- rightShiftStage2Idx1Rng1_uid657_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,656)@32
    rightShiftStage2Idx1Rng1_uid657_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 1);

    -- rightShiftStage2Idx1_uid658_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,657)@32
    rightShiftStage2Idx1_uid658_fxpInPostAlignExp_uid122_fpPowrTest_q <= xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b & rightShiftStage2Idx1Rng1_uid657_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- seMsb_to12_uid652(BITSELECT,651)@32
    seMsb_to12_uid652_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to12_uid652_b <= STD_LOGIC_VECTOR(seMsb_to12_uid652_in(11 downto 0));

    -- rightShiftStage1Idx3Rng12_uid653_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,652)@32
    rightShiftStage1Idx3Rng12_uid653_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 12);

    -- rightShiftStage1Idx3_uid654_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,653)@32
    rightShiftStage1Idx3_uid654_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to12_uid652_b & rightShiftStage1Idx3Rng12_uid653_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- seMsb_to8_uid649(BITSELECT,648)@32
    seMsb_to8_uid649_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to8_uid649_b <= STD_LOGIC_VECTOR(seMsb_to8_uid649_in(7 downto 0));

    -- rightShiftStage1Idx2Rng8_uid650_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,649)@32
    rightShiftStage1Idx2Rng8_uid650_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 8);

    -- rightShiftStage1Idx2_uid651_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,650)@32
    rightShiftStage1Idx2_uid651_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to8_uid649_b & rightShiftStage1Idx2Rng8_uid650_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- seMsb_to4_uid646(BITSELECT,645)@32
    seMsb_to4_uid646_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to4_uid646_b <= STD_LOGIC_VECTOR(seMsb_to4_uid646_in(3 downto 0));

    -- rightShiftStage1Idx1Rng4_uid647_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,646)@32
    rightShiftStage1Idx1Rng4_uid647_fxpInPostAlignExp_uid122_fpPowrTest_b <= rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 4);

    -- rightShiftStage1Idx1_uid648_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,647)@32
    rightShiftStage1Idx1_uid648_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to4_uid646_b & rightShiftStage1Idx1Rng4_uid647_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- stageIndexName_to47_uid642(BITSELECT,641)@32
    stageIndexName_to47_uid642_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    stageIndexName_to47_uid642_b <= STD_LOGIC_VECTOR(stageIndexName_to47_uid642_in(46 downto 0));

    -- seMsb_to32_uid639(BITSELECT,638)@32
    seMsb_to32_uid639_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to32_uid639_b <= STD_LOGIC_VECTOR(seMsb_to32_uid639_in(31 downto 0));

    -- rightShiftStage0Idx2Rng32_uid640_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,639)@32
    rightShiftStage0Idx2Rng32_uid640_fxpInPostAlignExp_uid122_fpPowrTest_b <= oFracXZwE_uid115_fpPowrTest_q(46 downto 32);

    -- rightShiftStage0Idx2_uid641_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,640)@32
    rightShiftStage0Idx2_uid641_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to32_uid639_b & rightShiftStage0Idx2Rng32_uid640_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- seMsb_to16_uid636(BITSELECT,635)@32
    seMsb_to16_uid636_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b(0)) & xMSB_uid634_fxpInPostAlignExp_uid122_fpPowrTest_b));
    seMsb_to16_uid636_b <= STD_LOGIC_VECTOR(seMsb_to16_uid636_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid637_fxpInPostAlignExp_uid122_fpPowrTest(BITSELECT,636)@32
    rightShiftStage0Idx1Rng16_uid637_fxpInPostAlignExp_uid122_fpPowrTest_b <= oFracXZwE_uid115_fpPowrTest_q(46 downto 16);

    -- rightShiftStage0Idx1_uid638_fxpInPostAlignExp_uid122_fpPowrTest(BITJOIN,637)@32
    rightShiftStage0Idx1_uid638_fxpInPostAlignExp_uid122_fpPowrTest_q <= seMsb_to16_uid636_b & rightShiftStage0Idx1Rng16_uid637_fxpInPostAlignExp_uid122_fpPowrTest_b;

    -- rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest(MUX,644)@32
    rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_s <= rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b;
    rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_combproc: PROCESS (rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_s, oFracXZwE_uid115_fpPowrTest_q, rightShiftStage0Idx1_uid638_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage0Idx2_uid641_fxpInPostAlignExp_uid122_fpPowrTest_q, stageIndexName_to47_uid642_b)
    BEGIN
        CASE (rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_s) IS
            WHEN "00" => rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q <= oFracXZwE_uid115_fpPowrTest_q;
            WHEN "01" => rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage0Idx1_uid638_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "10" => rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage0Idx2_uid641_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "11" => rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q <= stageIndexName_to47_uid642_b;
            WHEN OTHERS => rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest(MUX,655)@32
    rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_s <= rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c;
    rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_combproc: PROCESS (rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_s, rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage1Idx1_uid648_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage1Idx2_uid651_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage1Idx3_uid654_fxpInPostAlignExp_uid122_fpPowrTest_q)
    BEGIN
        CASE (rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_s) IS
            WHEN "00" => rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage0_uid645_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "01" => rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage1Idx1_uid648_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "10" => rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage1Idx2_uid651_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "11" => rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage1Idx3_uid654_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN OTHERS => rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstBiasPWE_uid108_fpPowrTest(CONSTANT,107)
    cstBiasPWE_uid108_fpPowrTest_q <= "101011";

    -- msbuExpProdPre_uid101_fpPowrTest(BITSELECT,100)@27
    msbuExpProdPre_uid101_fpPowrTest_b <= STD_LOGIC_VECTOR(expProdPre_uid100_fpPowrTest_q(11 downto 11));

    -- invMsbuExpProdPre_uid102_fpPowrTest(LOGICAL,101)@27
    invMsbuExpProdPre_uid102_fpPowrTest_q <= not (msbuExpProdPre_uid101_fpPowrTest_b);

    -- redist55_prodNormBit_uid92_fpPowrTest_b_1(DELAY,815)
    redist55_prodNormBit_uid92_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodNormBit_uid92_fpPowrTest_b, xout => redist55_prodNormBit_uid92_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- expRLog_uid88_fpPowrTest(BITSELECT,87)@22
    expRLog_uid88_fpPowrTest_in <= STD_LOGIC_VECTOR(expFracPostRndLog_uid86_fpPowrTest_q(42 downto 0));
    expRLog_uid88_fpPowrTest_b <= STD_LOGIC_VECTOR(expRLog_uid88_fpPowrTest_in(42 downto 34));

    -- redist57_expRLog_uid88_fpPowrTest_b_1(DELAY,817)
    redist57_expRLog_uid88_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRLog_uid88_fpPowrTest_b, xout => redist57_expRLog_uid88_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- exp_y_uid28_fpPowrTest(BITSELECT,27)@23
    exp_y_uid28_fpPowrTest_b <= redist95_xIn_b_23_outputreg_q(30 downto 23);

    -- expProdPhase1_uid98_fpPowrTest(ADD,97)@23 + 1
    expProdPhase1_uid98_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_y_uid28_fpPowrTest_b));
    expProdPhase1_uid98_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist57_expRLog_uid88_fpPowrTest_b_1_q(8)) & redist57_expRLog_uid88_fpPowrTest_b_1_q));
    expProdPhase1_uid98_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expProdPhase1_uid98_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expProdPhase1_uid98_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expProdPhase1_uid98_fpPowrTest_a) + SIGNED(expProdPhase1_uid98_fpPowrTest_b));
        END IF;
    END PROCESS;
    expProdPhase1_uid98_fpPowrTest_q <= expProdPhase1_uid98_fpPowrTest_o(9 downto 0);

    -- redist53_expProdPhase1_uid98_fpPowrTest_q_4(DELAY,813)
    redist53_expProdPhase1_uid98_fpPowrTest_q_4 : dspba_delay
    GENERIC MAP ( width => 10, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expProdPhase1_uid98_fpPowrTest_q, xout => redist53_expProdPhase1_uid98_fpPowrTest_q_4_q, clk => clk, aclr => areset );

    -- expProdPhase2_uid99_fpPowrTest(ADD,98)@27
    expProdPhase2_uid99_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist53_expProdPhase1_uid98_fpPowrTest_q_4_q(9)) & redist53_expProdPhase1_uid98_fpPowrTest_q_4_q));
    expProdPhase2_uid99_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & redist55_prodNormBit_uid92_fpPowrTest_b_1_q));
    expProdPhase2_uid99_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expProdPhase2_uid99_fpPowrTest_a) + SIGNED(expProdPhase2_uid99_fpPowrTest_b));
    expProdPhase2_uid99_fpPowrTest_q <= expProdPhase2_uid99_fpPowrTest_o(10 downto 0);

    -- expProdPre_uid100_fpPowrTest(SUB,99)@27
    expProdPre_uid100_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expProdPhase2_uid99_fpPowrTest_q(10)) & expProdPhase2_uid99_fpPowrTest_q));
    expProdPre_uid100_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstBias_uid7_fpPowrTest_q));
    expProdPre_uid100_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expProdPre_uid100_fpPowrTest_a) - SIGNED(expProdPre_uid100_fpPowrTest_b));
    expProdPre_uid100_fpPowrTest_q <= expProdPre_uid100_fpPowrTest_o(11 downto 0);

    -- expProd_uid103_fpPowrTest(LOGICAL,102)@27 + 1
    expProd_uid103_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => invMsbuExpProdPre_uid102_fpPowrTest_q(0)) & invMsbuExpProdPre_uid102_fpPowrTest_q));
    expProd_uid103_fpPowrTest_qi <= expProdPre_uid100_fpPowrTest_q and expProd_uid103_fpPowrTest_b;
    expProd_uid103_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expProd_uid103_fpPowrTest_qi, xout => expProd_uid103_fpPowrTest_q, clk => clk, aclr => areset );

    -- cstBiasPWE_uid107_fpPowrTest(CONSTANT,106)
    cstBiasPWE_uid107_fpPowrTest_q <= "10000111";

    -- shiftValuePreSatExp_uid117_fpPowrTest(SUB,116)@28
    shiftValuePreSatExp_uid117_fpPowrTest_a <= STD_LOGIC_VECTOR("00000" & cstBiasPWE_uid107_fpPowrTest_q);
    shiftValuePreSatExp_uid117_fpPowrTest_b <= STD_LOGIC_VECTOR("0" & expProd_uid103_fpPowrTest_q);
    shiftValuePreSatExp_uid117_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSatExp_uid117_fpPowrTest_a) - UNSIGNED(shiftValuePreSatExp_uid117_fpPowrTest_b));
    shiftValuePreSatExp_uid117_fpPowrTest_q <= shiftValuePreSatExp_uid117_fpPowrTest_o(12 downto 0);

    -- shiftValuePreSatRedExp_uid120_fpPowrTest(BITSELECT,119)@28
    shiftValuePreSatRedExp_uid120_fpPowrTest_in <= shiftValuePreSatExp_uid117_fpPowrTest_q(5 downto 0);
    shiftValuePreSatRedExp_uid120_fpPowrTest_b <= shiftValuePreSatRedExp_uid120_fpPowrTest_in(5 downto 0);

    -- redist48_shiftValuePreSatRedExp_uid120_fpPowrTest_b_1(DELAY,808)
    redist48_shiftValuePreSatRedExp_uid120_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftValuePreSatRedExp_uid120_fpPowrTest_b, xout => redist48_shiftValuePreSatRedExp_uid120_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- shiftUdfExp_uid119_fpPowrTest(COMPARE,118)@28 + 1
    shiftUdfExp_uid119_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => shiftValuePreSatExp_uid117_fpPowrTest_q(12)) & shiftValuePreSatExp_uid117_fpPowrTest_q));
    shiftUdfExp_uid119_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000" & cstBiasPWE_uid108_fpPowrTest_q));
    shiftUdfExp_uid119_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftUdfExp_uid119_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftUdfExp_uid119_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdfExp_uid119_fpPowrTest_a) - SIGNED(shiftUdfExp_uid119_fpPowrTest_b));
        END IF;
    END PROCESS;
    shiftUdfExp_uid119_fpPowrTest_n(0) <= not (shiftUdfExp_uid119_fpPowrTest_o(14));

    -- shiftValExp_uid121_fpPowrTest(MUX,120)@29 + 1
    shiftValExp_uid121_fpPowrTest_s <= shiftUdfExp_uid119_fpPowrTest_n;
    shiftValExp_uid121_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValExp_uid121_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftValExp_uid121_fpPowrTest_s) IS
                WHEN "0" => shiftValExp_uid121_fpPowrTest_q <= redist48_shiftValuePreSatRedExp_uid120_fpPowrTest_b_1_q;
                WHEN "1" => shiftValExp_uid121_fpPowrTest_q <= cstBiasPWE_uid108_fpPowrTest_q;
                WHEN OTHERS => shiftValExp_uid121_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist47_shiftValExp_uid121_fpPowrTest_q_3(DELAY,807)
    redist47_shiftValExp_uid121_fpPowrTest_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftValExp_uid121_fpPowrTest_q, xout => redist47_shiftValExp_uid121_fpPowrTest_q_3_q, clk => clk, aclr => areset );

    -- rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select(BITSELECT,748)@32
    rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b <= redist47_shiftValExp_uid121_fpPowrTest_q_3_q(5 downto 4);
    rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c <= redist47_shiftValExp_uid121_fpPowrTest_q_3_q(3 downto 2);
    rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d <= redist47_shiftValExp_uid121_fpPowrTest_q_3_q(1 downto 0);

    -- rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest(MUX,665)@32
    rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_s <= rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d;
    rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_combproc: PROCESS (rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_s, rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage2Idx1_uid658_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage2Idx2_uid661_fxpInPostAlignExp_uid122_fpPowrTest_q, rightShiftStage2Idx3_uid664_fxpInPostAlignExp_uid122_fpPowrTest_q)
    BEGIN
        CASE (rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_s) IS
            WHEN "00" => rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage1_uid656_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "01" => rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage2Idx1_uid658_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "10" => rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage2Idx2_uid661_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN "11" => rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q <= rightShiftStage2Idx3_uid664_fxpInPostAlignExp_uid122_fpPowrTest_q;
            WHEN OTHERS => rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- ePreRndExp_uid124_fpPowrTest(BITSELECT,123)@32
    ePreRndExp_uid124_fpPowrTest_b <= STD_LOGIC_VECTOR(rightShiftStage2_uid666_fxpInPostAlignExp_uid122_fpPowrTest_q(46 downto 36));

    -- redist45_ePreRndExp_uid124_fpPowrTest_b_1(DELAY,805)
    redist45_ePreRndExp_uid124_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ePreRndExp_uid124_fpPowrTest_b, xout => redist45_ePreRndExp_uid124_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- xv0_uid401_eRndXlog2_uid125_fpPowrTest(BITSELECT,400)@33
    xv0_uid401_eRndXlog2_uid125_fpPowrTest_in <= redist45_ePreRndExp_uid124_fpPowrTest_b_1_q(5 downto 0);
    xv0_uid401_eRndXlog2_uid125_fpPowrTest_b <= xv0_uid401_eRndXlog2_uid125_fpPowrTest_in(5 downto 0);

    -- p0_uid404_eRndXlog2_uid125_fpPowrTest(LOOKUP,403)@33
    p0_uid404_eRndXlog2_uid125_fpPowrTest_combproc: PROCESS (xv0_uid401_eRndXlog2_uid125_fpPowrTest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv0_uid401_eRndXlog2_uid125_fpPowrTest_b) IS
            WHEN "000000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00000000000000000000000000000000000000000000";
            WHEN "000001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00000010110001011100100001011111110111110100";
            WHEN "000010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00000101100010111001000010111111101111101000";
            WHEN "000011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00001000010100010101100100011111100111011100";
            WHEN "000100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00001011000101110010000101111111011111010000";
            WHEN "000101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00001101110111001110100111011111010111000100";
            WHEN "000110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00010000101000101011001000111111001110111000";
            WHEN "000111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00010011011010000111101010011111000110101100";
            WHEN "001000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00010110001011100100001011111110111110100000";
            WHEN "001001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00011000111101000000101101011110110110010100";
            WHEN "001010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00011011101110011101001110111110101110001000";
            WHEN "001011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00011110011111111001110000011110100101111100";
            WHEN "001100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00100001010001010110010001111110011101110000";
            WHEN "001101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00100100000010110010110011011110010101100100";
            WHEN "001110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00100110110100001111010100111110001101011000";
            WHEN "001111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00101001100101101011110110011110000101001100";
            WHEN "010000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00101100010111001000010111111101111101000000";
            WHEN "010001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00101111001000100100111001011101110100110100";
            WHEN "010010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00110001111010000001011010111101101100101000";
            WHEN "010011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00110100101011011101111100011101100100011100";
            WHEN "010100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00110111011100111010011101111101011100010000";
            WHEN "010101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00111010001110010110111111011101010100000100";
            WHEN "010110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00111100111111110011100000111101001011111000";
            WHEN "010111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "00111111110001010000000010011101000011101100";
            WHEN "011000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01000010100010101100100011111100111011100000";
            WHEN "011001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01000101010100001001000101011100110011010100";
            WHEN "011010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01001000000101100101100110111100101011001000";
            WHEN "011011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01001010110111000010001000011100100010111100";
            WHEN "011100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01001101101000011110101001111100011010110000";
            WHEN "011101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01010000011001111011001011011100010010100100";
            WHEN "011110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01010011001011010111101100111100001010011000";
            WHEN "011111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01010101111100110100001110011100000010001100";
            WHEN "100000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01011000101110010000101111111011111010000000";
            WHEN "100001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01011011011111101101010001011011110001110100";
            WHEN "100010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01011110010001001001110010111011101001101000";
            WHEN "100011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01100001000010100110010100011011100001011100";
            WHEN "100100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01100011110100000010110101111011011001010000";
            WHEN "100101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01100110100101011111010111011011010001000100";
            WHEN "100110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01101001010110111011111000111011001000111000";
            WHEN "100111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01101100001000011000011010011011000000101100";
            WHEN "101000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01101110111001110100111011111010111000100000";
            WHEN "101001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01110001101011010001011101011010110000010100";
            WHEN "101010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01110100011100101101111110111010101000001000";
            WHEN "101011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01110111001110001010100000011010011111111100";
            WHEN "101100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01111001111111100111000001111010010111110000";
            WHEN "101101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01111100110001000011100011011010001111100100";
            WHEN "101110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "01111111100010100000000100111010000111011000";
            WHEN "101111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10000010010011111100100110011001111111001100";
            WHEN "110000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10000101000101011001000111111001110111000000";
            WHEN "110001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10000111110110110101101001011001101110110100";
            WHEN "110010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10001010101000010010001010111001100110101000";
            WHEN "110011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10001101011001101110101100011001011110011100";
            WHEN "110100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10010000001011001011001101111001010110010000";
            WHEN "110101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10010010111100100111101111011001001110000100";
            WHEN "110110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10010101101110000100010000111001000101111000";
            WHEN "110111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10011000011111100000110010011000111101101100";
            WHEN "111000" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10011011010000111101010011111000110101100000";
            WHEN "111001" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10011110000010011001110101011000101101010100";
            WHEN "111010" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10100000110011110110010110111000100101001000";
            WHEN "111011" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10100011100101010010111000011000011100111100";
            WHEN "111100" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10100110010110101111011001111000010100110000";
            WHEN "111101" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10101001001000001011111011011000001100100100";
            WHEN "111110" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10101011111001101000011100111000000100011000";
            WHEN "111111" => p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= "10101110101011000100111110010111111100001100";
            WHEN OTHERS => -- unreachable
                           p0_uid404_eRndXlog2_uid125_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select(BITSELECT,759)@33
    lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b <= p0_uid404_eRndXlog2_uid125_fpPowrTest_q(0 downto 0);
    lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_c <= p0_uid404_eRndXlog2_uid125_fpPowrTest_q(43 downto 1);

    -- xv1_uid402_eRndXlog2_uid125_fpPowrTest(BITSELECT,401)@33
    xv1_uid402_eRndXlog2_uid125_fpPowrTest_b <= STD_LOGIC_VECTOR(redist45_ePreRndExp_uid124_fpPowrTest_b_1_q(10 downto 6));

    -- p1_uid403_eRndXlog2_uid125_fpPowrTest(LOOKUP,402)@33
    p1_uid403_eRndXlog2_uid125_fpPowrTest_combproc: PROCESS (xv1_uid402_eRndXlog2_uid125_fpPowrTest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv1_uid402_eRndXlog2_uid125_fpPowrTest_b) IS
            WHEN "00000" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000000000000000000000000000000000000000000000010";
            WHEN "00001" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000001011000101110010000101111111011111010000010";
            WHEN "00010" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000010110001011100100001011111110111110100000010";
            WHEN "00011" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000100001010001010110010001111110011101110000010";
            WHEN "00100" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000101100010111001000010111111101111101000000010";
            WHEN "00101" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0000110111011100111010011101111101011100010000010";
            WHEN "00110" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001000010100010101100100011111100111011100000010";
            WHEN "00111" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001001101101000011110101001111100011010110000010";
            WHEN "01000" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001011000101110010000101111111011111010000000010";
            WHEN "01001" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001100011110100000010110101111011011001010000010";
            WHEN "01010" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001101110111001110100111011111010111000100000010";
            WHEN "01011" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0001111001111111100111000001111010010111110000010";
            WHEN "01100" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0010000101000101011001000111111001110111000000010";
            WHEN "01101" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0010010000001011001011001101111001010110010000010";
            WHEN "01110" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0010011011010000111101010011111000110101100000010";
            WHEN "01111" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "0010100110010110101111011001111000010100110000010";
            WHEN "10000" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1101001110100011011110100000001000001100000000010";
            WHEN "10001" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1101011001101001010000100110000111101011010000010";
            WHEN "10010" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1101100100101111000010101100000111001010100000010";
            WHEN "10011" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1101101111110100110100110010000110101001110000010";
            WHEN "10100" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1101111010111010100110111000000110001001000000010";
            WHEN "10101" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110000110000000011000111110000101101000010000010";
            WHEN "10110" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110010001000110001011000100000101000111100000010";
            WHEN "10111" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110011100001011111101001010000100100110110000010";
            WHEN "11000" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110100111010001101111010000000100000110000000010";
            WHEN "11001" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110110010010111100001010110000011100101010000010";
            WHEN "11010" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1110111101011101010011011100000011000100100000010";
            WHEN "11011" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1111001000100011000101100010000010100011110000010";
            WHEN "11100" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1111010011101000110111101000000010000011000000010";
            WHEN "11101" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1111011110101110101001101110000001100010010000010";
            WHEN "11110" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1111101001110100011011110100000001000001100000010";
            WHEN "11111" => p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= "1111110100111010001101111010000000100000110000010";
            WHEN OTHERS => -- unreachable
                           p1_uid403_eRndXlog2_uid125_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest(ADD,406)@33 + 1
    lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => p1_uid403_eRndXlog2_uid125_fpPowrTest_q(48)) & p1_uid403_eRndXlog2_uid125_fpPowrTest_q));
    lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_c));
    lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_a) + SIGNED(lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_q <= lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_o(49 downto 0);

    -- redist0_lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b_1(DELAY,760)
    redist0_lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b, xout => redist0_lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest(BITJOIN,407)@34
    lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q <= lev1_a0sumAHighB_uid407_eRndXlog2_uid125_fpPowrTest_q & redist0_lowRangeB_uid405_eRndXlog2_uid125_fpPowrTest_merged_bit_select_b_1_q;

    -- sR_uid418_eRndXlog2_uid125_fpPowrTest(BITSELECT,417)@34
    sR_uid418_eRndXlog2_uid125_fpPowrTest_in <= STD_LOGIC_VECTOR(lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q(48 downto 0));
    sR_uid418_eRndXlog2_uid125_fpPowrTest_b <= STD_LOGIC_VECTOR(sR_uid418_eRndXlog2_uid125_fpPowrTest_in(48 downto 3));

    -- updatedX_uid412_eRndXlog2_uid125_fpPowrTest(BITJOIN,411)@34
    updatedX_uid412_eRndXlog2_uid125_fpPowrTest_q <= maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest_q & paddingX_uid220_eLn2_uid49_fpPowrTest_q;

    -- ovf_uid411_eRndXlog2_uid125_fpPowrTest(COMPARE,412)@34
    ovf_uid411_eRndXlog2_uid125_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 49 => updatedX_uid412_eRndXlog2_uid125_fpPowrTest_q(48)) & updatedX_uid412_eRndXlog2_uid125_fpPowrTest_q));
    ovf_uid411_eRndXlog2_uid125_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 51 => lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q(50)) & lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q));
    ovf_uid411_eRndXlog2_uid125_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid411_eRndXlog2_uid125_fpPowrTest_a) - SIGNED(ovf_uid411_eRndXlog2_uid125_fpPowrTest_b));
    ovf_uid411_eRndXlog2_uid125_fpPowrTest_c(0) <= ovf_uid411_eRndXlog2_uid125_fpPowrTest_o(52);

    -- updatedY_uid415_eRndXlog2_uid125_fpPowrTest(BITJOIN,414)@34
    updatedY_uid415_eRndXlog2_uid125_fpPowrTest_q <= minValueInFormat_uid410_eRndXlog2_uid125_fpPowrTest_q & paddingX_uid220_eLn2_uid49_fpPowrTest_q;

    -- udf_uid414_eRndXlog2_uid125_fpPowrTest(COMPARE,415)@34
    udf_uid414_eRndXlog2_uid125_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 51 => lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q(50)) & lev1_a0_uid408_eRndXlog2_uid125_fpPowrTest_q));
    udf_uid414_eRndXlog2_uid125_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 49 => updatedY_uid415_eRndXlog2_uid125_fpPowrTest_q(48)) & updatedY_uid415_eRndXlog2_uid125_fpPowrTest_q));
    udf_uid414_eRndXlog2_uid125_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid414_eRndXlog2_uid125_fpPowrTest_a) - SIGNED(udf_uid414_eRndXlog2_uid125_fpPowrTest_b));
    udf_uid414_eRndXlog2_uid125_fpPowrTest_c(0) <= udf_uid414_eRndXlog2_uid125_fpPowrTest_o(52);

    -- ovfudfcond_uid417_eRndXlog2_uid125_fpPowrTest(BITJOIN,416)@34
    ovfudfcond_uid417_eRndXlog2_uid125_fpPowrTest_q <= ovf_uid411_eRndXlog2_uid125_fpPowrTest_c & udf_uid414_eRndXlog2_uid125_fpPowrTest_c;

    -- sRA0_uid419_eRndXlog2_uid125_fpPowrTest(MUX,418)@34 + 1
    sRA0_uid419_eRndXlog2_uid125_fpPowrTest_s <= ovfudfcond_uid417_eRndXlog2_uid125_fpPowrTest_q;
    sRA0_uid419_eRndXlog2_uid125_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sRA0_uid419_eRndXlog2_uid125_fpPowrTest_s) IS
                WHEN "00" => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= sR_uid418_eRndXlog2_uid125_fpPowrTest_b;
                WHEN "01" => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= minValueInFormat_uid410_eRndXlog2_uid125_fpPowrTest_q;
                WHEN "10" => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest_q;
                WHEN "11" => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= maxValInOutFormat_uid409_eRndXlog2_uid125_fpPowrTest_q;
                WHEN OTHERS => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist51_signProd_uid104_fpPowrTest_q_6(DELAY,811)
    redist51_signProd_uid104_fpPowrTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => signProd_uid104_fpPowrTest_q, xout => redist51_signProd_uid104_fpPowrTest_q_6_q, clk => clk, aclr => areset );

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_notEnable(LOGICAL,883)
    redist54_oFracProd_uid97_fpPowrTest_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_nor(LOGICAL,884)
    redist54_oFracProd_uid97_fpPowrTest_q_6_nor_q <= not (redist54_oFracProd_uid97_fpPowrTest_q_6_notEnable_q or redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q);

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_mem_last(CONSTANT,880)
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_last_q <= "011";

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_cmp(LOGICAL,881)
    redist54_oFracProd_uid97_fpPowrTest_q_6_cmp_q <= "1" WHEN redist54_oFracProd_uid97_fpPowrTest_q_6_mem_last_q = redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_q ELSE "0";

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg(REG,882)
    redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist54_oFracProd_uid97_fpPowrTest_q_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena(REG,885)
    redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist54_oFracProd_uid97_fpPowrTest_q_6_nor_q = "1") THEN
                redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist54_oFracProd_uid97_fpPowrTest_q_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_enaAnd(LOGICAL,886)
    redist54_oFracProd_uid97_fpPowrTest_q_6_enaAnd_q <= redist54_oFracProd_uid97_fpPowrTest_q_6_sticky_ena_q and VCC_q;

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt(COUNTER,878)
    -- low=0, high=4, step=1, init=0
    redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq <= '1';
            ELSE
                redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq <= '0';
            END IF;
            IF (redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_eq = '1') THEN
                redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i <= redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i + 4;
            ELSE
                redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i <= redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_i, 3)));

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr(REG,879)
    redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr_q <= "100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist54_oFracProd_uid97_fpPowrTest_q_6_mem(DUALMEM,877)
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ia <= STD_LOGIC_VECTOR(oFracProd_uid97_fpPowrTest_q);
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_aa <= redist54_oFracProd_uid97_fpPowrTest_q_6_wraddr_q;
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ab <= redist54_oFracProd_uid97_fpPowrTest_q_6_rdcnt_q;
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_reset0 <= areset;
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 34,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 34,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist54_oFracProd_uid97_fpPowrTest_q_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist54_oFracProd_uid97_fpPowrTest_q_6_mem_reset0,
        clock1 => clk,
        address_a => redist54_oFracProd_uid97_fpPowrTest_q_6_mem_aa,
        data_a => redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist54_oFracProd_uid97_fpPowrTest_q_6_mem_ab,
        q_b => redist54_oFracProd_uid97_fpPowrTest_q_6_mem_iq
    );
    redist54_oFracProd_uid97_fpPowrTest_q_6_mem_q <= redist54_oFracProd_uid97_fpPowrTest_q_6_mem_iq(33 downto 0);

    -- cstZeroWEP1_uid106_fpPowrTest(CONSTANT,105)
    cstZeroWEP1_uid106_fpPowrTest_q <= "000000000";

    -- oFracQZwE_uid127_fpPowrTest(BITJOIN,126)@33
    oFracQZwE_uid127_fpPowrTest_q <= GND_q & redist54_oFracProd_uid97_fpPowrTest_q_6_mem_q & cstZeroWEP1_uid106_fpPowrTest_q;

    -- onesCmpFxpInQ2_uid128_fpPowrTest(LOGICAL,127)@33
    onesCmpFxpInQ2_uid128_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 1 => redist51_signProd_uid104_fpPowrTest_q_6_q(0)) & redist51_signProd_uid104_fpPowrTest_q_6_q));
    onesCmpFxpInQ2_uid128_fpPowrTest_q <= oFracQZwE_uid127_fpPowrTest_q xor onesCmpFxpInQ2_uid128_fpPowrTest_b;

    -- fxpInExtQ2_uid129_fpPowrTest(ADD,128)@33
    fxpInExtQ2_uid129_fpPowrTest_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpInQ2_uid128_fpPowrTest_q);
    fxpInExtQ2_uid129_fpPowrTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000" & redist51_signProd_uid104_fpPowrTest_q_6_q);
    fxpInExtQ2_uid129_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExtQ2_uid129_fpPowrTest_a) + UNSIGNED(fxpInExtQ2_uid129_fpPowrTest_b));
    fxpInExtQ2_uid129_fpPowrTest_q <= fxpInExtQ2_uid129_fpPowrTest_o(44 downto 0);

    -- fxpInPreAlignQ2_uid130_fpPowrTest(BITSELECT,129)@33
    fxpInPreAlignQ2_uid130_fpPowrTest_in <= STD_LOGIC_VECTOR(fxpInExtQ2_uid129_fpPowrTest_q(43 downto 0));
    fxpInPreAlignQ2_uid130_fpPowrTest_b <= STD_LOGIC_VECTOR(fxpInPreAlignQ2_uid130_fpPowrTest_in(43 downto 0));

    -- xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,667)@33
    xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b <= STD_LOGIC_VECTOR(fxpInPreAlignQ2_uid130_fpPowrTest_b(43 downto 43));

    -- redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1(DELAY,780)
    redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b, xout => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- seMsb_to3_uid696(BITSELECT,695)@34
    seMsb_to3_uid696_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q(0)) & redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q));
    seMsb_to3_uid696_b <= STD_LOGIC_VECTOR(seMsb_to3_uid696_in(2 downto 0));

    -- rightShiftStage2Idx3Rng3_uid697_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,696)@34
    rightShiftStage2Idx3Rng3_uid697_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 3);

    -- rightShiftStage2Idx3_uid698_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,697)@34
    rightShiftStage2Idx3_uid698_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to3_uid696_b & rightShiftStage2Idx3Rng3_uid697_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- seMsb_to2_uid693(BITSELECT,692)@34
    seMsb_to2_uid693_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q(0)) & redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q));
    seMsb_to2_uid693_b <= STD_LOGIC_VECTOR(seMsb_to2_uid693_in(1 downto 0));

    -- rightShiftStage2Idx2Rng2_uid694_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,693)@34
    rightShiftStage2Idx2Rng2_uid694_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 2);

    -- rightShiftStage2Idx2_uid695_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,694)@34
    rightShiftStage2Idx2_uid695_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to2_uid693_b & rightShiftStage2Idx2Rng2_uid694_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- rightShiftStage2Idx1Rng1_uid691_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,690)@34
    rightShiftStage2Idx1Rng1_uid691_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 1);

    -- rightShiftStage2Idx1_uid692_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,691)@34
    rightShiftStage2Idx1_uid692_fxpInPostAlign_X_uid135_fpPowrTest_q <= redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q & rightShiftStage2Idx1Rng1_uid691_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- seMsb_to12_uid686(BITSELECT,685)@34
    seMsb_to12_uid686_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q(0)) & redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q));
    seMsb_to12_uid686_b <= STD_LOGIC_VECTOR(seMsb_to12_uid686_in(11 downto 0));

    -- rightShiftStage1Idx3Rng12_uid687_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,686)@34
    rightShiftStage1Idx3Rng12_uid687_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 12);

    -- rightShiftStage1Idx3_uid688_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,687)@34
    rightShiftStage1Idx3_uid688_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to12_uid686_b & rightShiftStage1Idx3Rng12_uid687_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- seMsb_to8_uid683(BITSELECT,682)@34
    seMsb_to8_uid683_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q(0)) & redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q));
    seMsb_to8_uid683_b <= STD_LOGIC_VECTOR(seMsb_to8_uid683_in(7 downto 0));

    -- rightShiftStage1Idx2Rng8_uid684_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,683)@34
    rightShiftStage1Idx2Rng8_uid684_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 8);

    -- rightShiftStage1Idx2_uid685_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,684)@34
    rightShiftStage1Idx2_uid685_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to8_uid683_b & rightShiftStage1Idx2Rng8_uid684_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- seMsb_to4_uid680(BITSELECT,679)@34
    seMsb_to4_uid680_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q(0)) & redist20_xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b_1_q));
    seMsb_to4_uid680_b <= STD_LOGIC_VECTOR(seMsb_to4_uid680_in(3 downto 0));

    -- rightShiftStage1Idx1Rng4_uid681_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,680)@34
    rightShiftStage1Idx1Rng4_uid681_fxpInPostAlign_X_uid135_fpPowrTest_b <= rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q(43 downto 4);

    -- rightShiftStage1Idx1_uid682_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,681)@34
    rightShiftStage1Idx1_uid682_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to4_uid680_b & rightShiftStage1Idx1Rng4_uid681_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- stageIndexName_to44_uid676(BITSELECT,675)@33
    stageIndexName_to44_uid676_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 1 => xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b(0)) & xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b));
    stageIndexName_to44_uid676_b <= STD_LOGIC_VECTOR(stageIndexName_to44_uid676_in(43 downto 0));

    -- seMsb_to32_uid673(BITSELECT,672)@33
    seMsb_to32_uid673_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b(0)) & xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b));
    seMsb_to32_uid673_b <= STD_LOGIC_VECTOR(seMsb_to32_uid673_in(31 downto 0));

    -- rightShiftStage0Idx2Rng32_uid674_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,673)@33
    rightShiftStage0Idx2Rng32_uid674_fxpInPostAlign_X_uid135_fpPowrTest_b <= fxpInPreAlignQ2_uid130_fpPowrTest_b(43 downto 32);

    -- rightShiftStage0Idx2_uid675_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,674)@33
    rightShiftStage0Idx2_uid675_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to32_uid673_b & rightShiftStage0Idx2Rng32_uid674_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- seMsb_to16_uid670(BITSELECT,669)@33
    seMsb_to16_uid670_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b(0)) & xMSB_uid668_fxpInPostAlign_X_uid135_fpPowrTest_b));
    seMsb_to16_uid670_b <= STD_LOGIC_VECTOR(seMsb_to16_uid670_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid671_fxpInPostAlign_X_uid135_fpPowrTest(BITSELECT,670)@33
    rightShiftStage0Idx1Rng16_uid671_fxpInPostAlign_X_uid135_fpPowrTest_b <= fxpInPreAlignQ2_uid130_fpPowrTest_b(43 downto 16);

    -- rightShiftStage0Idx1_uid672_fxpInPostAlign_X_uid135_fpPowrTest(BITJOIN,671)@33
    rightShiftStage0Idx1_uid672_fxpInPostAlign_X_uid135_fpPowrTest_q <= seMsb_to16_uid670_b & rightShiftStage0Idx1Rng16_uid671_fxpInPostAlign_X_uid135_fpPowrTest_b;

    -- redist15_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b_1(DELAY,775)
    redist15_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b, xout => redist15_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest(MUX,678)@33 + 1
    rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_s <= redist15_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_b_1_q;
    rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_s) IS
                WHEN "00" => rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= fxpInPreAlignQ2_uid130_fpPowrTest_b;
                WHEN "01" => rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage0Idx1_uid672_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN "10" => rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage0Idx2_uid675_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN "11" => rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= stageIndexName_to44_uid676_b;
                WHEN OTHERS => rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist16_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c_2(DELAY,776)
    redist16_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c, xout => redist16_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest(MUX,689)@34
    rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_s <= redist16_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_c_2_q;
    rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_combproc: PROCESS (rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_s, rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q, rightShiftStage1Idx1_uid682_fxpInPostAlign_X_uid135_fpPowrTest_q, rightShiftStage1Idx2_uid685_fxpInPostAlign_X_uid135_fpPowrTest_q, rightShiftStage1Idx3_uid688_fxpInPostAlign_X_uid135_fpPowrTest_q)
    BEGIN
        CASE (rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_s) IS
            WHEN "00" => rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage0_uid679_fxpInPostAlign_X_uid135_fpPowrTest_q;
            WHEN "01" => rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage1Idx1_uid682_fxpInPostAlign_X_uid135_fpPowrTest_q;
            WHEN "10" => rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage1Idx2_uid685_fxpInPostAlign_X_uid135_fpPowrTest_q;
            WHEN "11" => rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage1Idx3_uid688_fxpInPostAlign_X_uid135_fpPowrTest_q;
            WHEN OTHERS => rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist17_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d_2(DELAY,777)
    redist17_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d, xout => redist17_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest(MUX,699)@34 + 1
    rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_s <= redist17_rightShiftStageSel5Dto4_uid644_fxpInPostAlignExp_uid122_fpPowrTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_s) IS
                WHEN "00" => rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage1_uid690_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN "01" => rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage2Idx1_uid692_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN "10" => rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage2Idx2_uid695_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN "11" => rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= rightShiftStage2Idx3_uid698_fxpInPostAlign_X_uid135_fpPowrTest_q;
                WHEN OTHERS => rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- aPostPad_uid138_fpPowrTest(BITJOIN,137)@35
    aPostPad_uid138_fpPowrTest_q <= rightShiftStage2_uid700_fxpInPostAlign_X_uid135_fpPowrTest_q & GND_q;

    -- yExtExp_uid139_fpPowrTest(SUB,138)@35
    yExtExp_uid139_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 45 => aPostPad_uid138_fpPowrTest_q(44)) & aPostPad_uid138_fpPowrTest_q));
    yExtExp_uid139_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q(45)) & sRA0_uid419_eRndXlog2_uid125_fpPowrTest_q));
    yExtExp_uid139_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(yExtExp_uid139_fpPowrTest_a) - SIGNED(yExtExp_uid139_fpPowrTest_b));
    yExtExp_uid139_fpPowrTest_q <= yExtExp_uid139_fpPowrTest_o(46 downto 0);

    -- yRed_uid142_fpPowrTest(BITSELECT,141)@35
    yRed_uid142_fpPowrTest_in <= yExtExp_uid139_fpPowrTest_q(34 downto 0);
    yRed_uid142_fpPowrTest_b <= yRed_uid142_fpPowrTest_in(34 downto 1);

    -- yExtNeg_uid140_fpPowrTest(BITSELECT,139)@35
    yExtNeg_uid140_fpPowrTest_b <= STD_LOGIC_VECTOR(yExtExp_uid139_fpPowrTest_q(46 downto 46));

    -- yRedPostMux_uid143_fpPowrTest(MUX,142)@35
    yRedPostMux_uid143_fpPowrTest_s <= yExtNeg_uid140_fpPowrTest_b;
    yRedPostMux_uid143_fpPowrTest_combproc: PROCESS (yRedPostMux_uid143_fpPowrTest_s, yRed_uid142_fpPowrTest_b, zY_uid141_fpPowrTest_q)
    BEGIN
        CASE (yRedPostMux_uid143_fpPowrTest_s) IS
            WHEN "0" => yRedPostMux_uid143_fpPowrTest_q <= yRed_uid142_fpPowrTest_b;
            WHEN "1" => yRedPostMux_uid143_fpPowrTest_q <= zY_uid141_fpPowrTest_q;
            WHEN OTHERS => yRedPostMux_uid143_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- yAddr_uid145_fpPowrTest_merged_bit_select(BITSELECT,749)@35
    yAddr_uid145_fpPowrTest_merged_bit_select_b <= yRedPostMux_uid143_fpPowrTest_q(33 downto 26);
    yAddr_uid145_fpPowrTest_merged_bit_select_c <= yRedPostMux_uid143_fpPowrTest_q(25 downto 0);

    -- redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2(DELAY,772)
    redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 26, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid145_fpPowrTest_merged_bit_select_c, xout => redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5(DELAY,773)
    redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 26, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2_q, xout => redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- redist14_yAddr_uid145_fpPowrTest_merged_bit_select_c_8(DELAY,774)
    redist14_yAddr_uid145_fpPowrTest_merged_bit_select_c_8 : dspba_delay
    GENERIC MAP ( width => 26, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5_q, xout => redist14_yAddr_uid145_fpPowrTest_merged_bit_select_c_8_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval(BITJOIN,546)@43
    nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval_q <= GND_q & redist14_yAddr_uid145_fpPowrTest_merged_bit_select_c_8_q;

    -- topRangeX_uid549_pT3_uid477_invPolyEval(BITSELECT,548)@43
    topRangeX_uid549_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval_q(26 downto 9));

    -- memoryC3_uid457_sqrtTables_lutmem(DUALMEM,711)@35 + 2
    -- in j@20000000
    memoryC3_uid457_sqrtTables_lutmem_aa <= yAddr_uid145_fpPowrTest_merged_bit_select_b;
    memoryC3_uid457_sqrtTables_lutmem_reset0 <= areset;
    memoryC3_uid457_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 15,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC3_uid457_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid457_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid457_sqrtTables_lutmem_aa,
        q_a => memoryC3_uid457_sqrtTables_lutmem_ir
    );
    memoryC3_uid457_sqrtTables_lutmem_r <= memoryC3_uid457_sqrtTables_lutmem_ir(14 downto 0);

    -- yT1_uid464_invPolyEval(BITSELECT,463)@37
    yT1_uid464_invPolyEval_b <= redist12_yAddr_uid145_fpPowrTest_merged_bit_select_c_2_q(25 downto 11);

    -- prodXY_uid529_pT1_uid465_invPolyEval_cma(CHAINMULTADD,737)@37 + 2
    prodXY_uid529_pT1_uid465_invPolyEval_cma_reset <= areset;
    prodXY_uid529_pT1_uid465_invPolyEval_cma_ena0 <= '1';
    prodXY_uid529_pT1_uid465_invPolyEval_cma_ena1 <= prodXY_uid529_pT1_uid465_invPolyEval_cma_ena0;
    prodXY_uid529_pT1_uid465_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid529_pT1_uid465_invPolyEval_cma_a0(0),16));
    prodXY_uid529_pT1_uid465_invPolyEval_cma_p(0) <= prodXY_uid529_pT1_uid465_invPolyEval_cma_l(0) * prodXY_uid529_pT1_uid465_invPolyEval_cma_c0(0);
    prodXY_uid529_pT1_uid465_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid529_pT1_uid465_invPolyEval_cma_p(0),31);
    prodXY_uid529_pT1_uid465_invPolyEval_cma_w(0) <= prodXY_uid529_pT1_uid465_invPolyEval_cma_u(0);
    prodXY_uid529_pT1_uid465_invPolyEval_cma_x(0) <= prodXY_uid529_pT1_uid465_invPolyEval_cma_w(0);
    prodXY_uid529_pT1_uid465_invPolyEval_cma_y(0) <= prodXY_uid529_pT1_uid465_invPolyEval_cma_x(0);
    prodXY_uid529_pT1_uid465_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid529_pT1_uid465_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid529_pT1_uid465_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid529_pT1_uid465_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid529_pT1_uid465_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid464_invPolyEval_b),15);
                prodXY_uid529_pT1_uid465_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC3_uid457_sqrtTables_lutmem_r),15);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid529_pT1_uid465_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid529_pT1_uid465_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid529_pT1_uid465_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid529_pT1_uid465_invPolyEval_cma_s(0) <= prodXY_uid529_pT1_uid465_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid529_pT1_uid465_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid529_pT1_uid465_invPolyEval_cma_s(0)(29 downto 0)), xout => prodXY_uid529_pT1_uid465_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid529_pT1_uid465_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid529_pT1_uid465_invPolyEval_cma_qq(29 downto 0));

    -- osig_uid530_pT1_uid465_invPolyEval(BITSELECT,529)@39
    osig_uid530_pT1_uid465_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid529_pT1_uid465_invPolyEval_cma_q(29 downto 15));

    -- highBBits_uid467_invPolyEval(BITSELECT,466)@39
    highBBits_uid467_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid530_pT1_uid465_invPolyEval_b(14 downto 1));

    -- redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2(DELAY,769)
    redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid145_fpPowrTest_merged_bit_select_b, xout => redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC2_uid454_sqrtTables_lutmem(DUALMEM,710)@37 + 2
    -- in j@20000000
    memoryC2_uid454_sqrtTables_lutmem_aa <= redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2_q;
    memoryC2_uid454_sqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid454_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 24,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC2_uid454_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid454_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid454_sqrtTables_lutmem_aa,
        q_a => memoryC2_uid454_sqrtTables_lutmem_ir
    );
    memoryC2_uid454_sqrtTables_lutmem_r <= memoryC2_uid454_sqrtTables_lutmem_ir(23 downto 0);

    -- s1sumAHighB_uid468_invPolyEval(ADD,467)@39 + 1
    s1sumAHighB_uid468_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => memoryC2_uid454_sqrtTables_lutmem_r(23)) & memoryC2_uid454_sqrtTables_lutmem_r));
    s1sumAHighB_uid468_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 14 => highBBits_uid467_invPolyEval_b(13)) & highBBits_uid467_invPolyEval_b));
    s1sumAHighB_uid468_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid468_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid468_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid468_invPolyEval_a) + SIGNED(s1sumAHighB_uid468_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid468_invPolyEval_q <= s1sumAHighB_uid468_invPolyEval_o(24 downto 0);

    -- lowRangeB_uid466_invPolyEval(BITSELECT,465)@39
    lowRangeB_uid466_invPolyEval_in <= osig_uid530_pT1_uid465_invPolyEval_b(0 downto 0);
    lowRangeB_uid466_invPolyEval_b <= lowRangeB_uid466_invPolyEval_in(0 downto 0);

    -- redist24_lowRangeB_uid466_invPolyEval_b_1(DELAY,784)
    redist24_lowRangeB_uid466_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid466_invPolyEval_b, xout => redist24_lowRangeB_uid466_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid469_invPolyEval(BITJOIN,468)@40
    s1_uid469_invPolyEval_q <= s1sumAHighB_uid468_invPolyEval_q & redist24_lowRangeB_uid466_invPolyEval_b_1_q;

    -- yT2_uid470_invPolyEval(BITSELECT,469)@40
    yT2_uid470_invPolyEval_b <= redist13_yAddr_uid145_fpPowrTest_merged_bit_select_c_5_q(25 downto 2);

    -- prodXY_uid532_pT2_uid471_invPolyEval_cma(CHAINMULTADD,738)@40 + 2
    prodXY_uid532_pT2_uid471_invPolyEval_cma_reset <= areset;
    prodXY_uid532_pT2_uid471_invPolyEval_cma_ena0 <= '1';
    prodXY_uid532_pT2_uid471_invPolyEval_cma_ena1 <= prodXY_uid532_pT2_uid471_invPolyEval_cma_ena0;
    prodXY_uid532_pT2_uid471_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid532_pT2_uid471_invPolyEval_cma_a0(0),25));
    prodXY_uid532_pT2_uid471_invPolyEval_cma_p(0) <= prodXY_uid532_pT2_uid471_invPolyEval_cma_l(0) * prodXY_uid532_pT2_uid471_invPolyEval_cma_c0(0);
    prodXY_uid532_pT2_uid471_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid532_pT2_uid471_invPolyEval_cma_p(0),51);
    prodXY_uid532_pT2_uid471_invPolyEval_cma_w(0) <= prodXY_uid532_pT2_uid471_invPolyEval_cma_u(0);
    prodXY_uid532_pT2_uid471_invPolyEval_cma_x(0) <= prodXY_uid532_pT2_uid471_invPolyEval_cma_w(0);
    prodXY_uid532_pT2_uid471_invPolyEval_cma_y(0) <= prodXY_uid532_pT2_uid471_invPolyEval_cma_x(0);
    prodXY_uid532_pT2_uid471_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid532_pT2_uid471_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid532_pT2_uid471_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid532_pT2_uid471_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid532_pT2_uid471_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT2_uid470_invPolyEval_b),24);
                prodXY_uid532_pT2_uid471_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid469_invPolyEval_q),26);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid532_pT2_uid471_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid532_pT2_uid471_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid532_pT2_uid471_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid532_pT2_uid471_invPolyEval_cma_s(0) <= prodXY_uid532_pT2_uid471_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid532_pT2_uid471_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid532_pT2_uid471_invPolyEval_cma_s(0)(49 downto 0)), xout => prodXY_uid532_pT2_uid471_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid532_pT2_uid471_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid532_pT2_uid471_invPolyEval_cma_qq(49 downto 0));

    -- osig_uid533_pT2_uid471_invPolyEval(BITSELECT,532)@42
    osig_uid533_pT2_uid471_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid532_pT2_uid471_invPolyEval_cma_q(49 downto 24));

    -- highBBits_uid473_invPolyEval(BITSELECT,472)@42
    highBBits_uid473_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid533_pT2_uid471_invPolyEval_b(25 downto 1));

    -- redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5(DELAY,770)
    redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_yAddr_uid145_fpPowrTest_merged_bit_select_b_2_q, xout => redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5_q, clk => clk, aclr => areset );

    -- memoryC1_uid451_sqrtTables_lutmem(DUALMEM,709)@40 + 2
    -- in j@20000000
    memoryC1_uid451_sqrtTables_lutmem_aa <= redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5_q;
    memoryC1_uid451_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid451_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 33,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC1_uid451_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid451_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid451_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid451_sqrtTables_lutmem_ir
    );
    memoryC1_uid451_sqrtTables_lutmem_r <= memoryC1_uid451_sqrtTables_lutmem_ir(32 downto 0);

    -- s2sumAHighB_uid474_invPolyEval(ADD,473)@42 + 1
    s2sumAHighB_uid474_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => memoryC1_uid451_sqrtTables_lutmem_r(32)) & memoryC1_uid451_sqrtTables_lutmem_r));
    s2sumAHighB_uid474_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 25 => highBBits_uid473_invPolyEval_b(24)) & highBBits_uid473_invPolyEval_b));
    s2sumAHighB_uid474_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s2sumAHighB_uid474_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s2sumAHighB_uid474_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid474_invPolyEval_a) + SIGNED(s2sumAHighB_uid474_invPolyEval_b));
        END IF;
    END PROCESS;
    s2sumAHighB_uid474_invPolyEval_q <= s2sumAHighB_uid474_invPolyEval_o(33 downto 0);

    -- lowRangeB_uid472_invPolyEval(BITSELECT,471)@42
    lowRangeB_uid472_invPolyEval_in <= osig_uid533_pT2_uid471_invPolyEval_b(0 downto 0);
    lowRangeB_uid472_invPolyEval_b <= lowRangeB_uid472_invPolyEval_in(0 downto 0);

    -- redist23_lowRangeB_uid472_invPolyEval_b_1(DELAY,783)
    redist23_lowRangeB_uid472_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid472_invPolyEval_b, xout => redist23_lowRangeB_uid472_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s2_uid475_invPolyEval(BITJOIN,474)@43
    s2_uid475_invPolyEval_q <= s2sumAHighB_uid474_invPolyEval_q & redist23_lowRangeB_uid472_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval(BITSELECT,552)@43
    aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_in <= STD_LOGIC_VECTOR(s2_uid475_invPolyEval_q(16 downto 0));
    aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_in(16 downto 0));

    -- aboveLeftY_mergedSignalTM_uid554_pT3_uid477_invPolyEval(BITJOIN,553)@43
    aboveLeftY_mergedSignalTM_uid554_pT3_uid477_invPolyEval_q <= aboveLeftY_bottomRange_uid553_pT3_uid477_invPolyEval_b & GND_q;

    -- topRangeY_uid550_pT3_uid477_invPolyEval(BITSELECT,549)@43
    topRangeY_uid550_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid475_invPolyEval_q(34 downto 17));

    -- rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval(BITSELECT,556)@43
    rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval_q(8 downto 0));
    rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_in(8 downto 0));

    -- rightBottomX_mergedSignalTM_uid558_pT3_uid477_invPolyEval(BITJOIN,557)@43
    rightBottomX_mergedSignalTM_uid558_pT3_uid477_invPolyEval_q <= rightBottomX_bottomRange_uid557_pT3_uid477_invPolyEval_b & cstZeroWEP1_uid106_fpPowrTest_q;

    -- multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma(CHAINMULTADD,744)@43 + 2
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_l(0) * multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_l(1) * multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_u(0) + multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid558_pT3_uid477_invPolyEval_q),18);
                multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid554_pT3_uid477_invPolyEval_q),18);
                multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid550_pT3_uid477_invPolyEval_b),18);
                multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid549_pT3_uid477_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid569_pT3_uid477_invPolyEval(BITSELECT,568)@45
    highBBits_uid569_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_q(36 downto 12));

    -- sm0_uid563_pT3_uid477_invPolyEval_cma(CHAINMULTADD,739)@43 + 2
    sm0_uid563_pT3_uid477_invPolyEval_cma_reset <= areset;
    sm0_uid563_pT3_uid477_invPolyEval_cma_ena0 <= '1';
    sm0_uid563_pT3_uid477_invPolyEval_cma_ena1 <= sm0_uid563_pT3_uid477_invPolyEval_cma_ena0;
    sm0_uid563_pT3_uid477_invPolyEval_cma_p(0) <= sm0_uid563_pT3_uid477_invPolyEval_cma_a0(0) * sm0_uid563_pT3_uid477_invPolyEval_cma_c0(0);
    sm0_uid563_pT3_uid477_invPolyEval_cma_u(0) <= RESIZE(sm0_uid563_pT3_uid477_invPolyEval_cma_p(0),36);
    sm0_uid563_pT3_uid477_invPolyEval_cma_w(0) <= sm0_uid563_pT3_uid477_invPolyEval_cma_u(0);
    sm0_uid563_pT3_uid477_invPolyEval_cma_x(0) <= sm0_uid563_pT3_uid477_invPolyEval_cma_w(0);
    sm0_uid563_pT3_uid477_invPolyEval_cma_y(0) <= sm0_uid563_pT3_uid477_invPolyEval_cma_x(0);
    sm0_uid563_pT3_uid477_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid563_pT3_uid477_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid563_pT3_uid477_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid563_pT3_uid477_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid563_pT3_uid477_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid549_pT3_uid477_invPolyEval_b),18);
                sm0_uid563_pT3_uid477_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid550_pT3_uid477_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid563_pT3_uid477_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid563_pT3_uid477_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid563_pT3_uid477_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid563_pT3_uid477_invPolyEval_cma_s(0) <= sm0_uid563_pT3_uid477_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid563_pT3_uid477_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid563_pT3_uid477_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid563_pT3_uid477_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid563_pT3_uid477_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid563_pT3_uid477_invPolyEval_cma_qq(35 downto 0));

    -- aboveLeftY_uid562_pT3_uid477_invPolyEval(BITSELECT,561)@43
    aboveLeftY_uid562_pT3_uid477_invPolyEval_in <= s2_uid475_invPolyEval_q(16 downto 0);
    aboveLeftY_uid562_pT3_uid477_invPolyEval_b <= aboveLeftY_uid562_pT3_uid477_invPolyEval_in(16 downto 14);

    -- aboveLeftX_uid561_pT3_uid477_invPolyEval(BITSELECT,560)@43
    aboveLeftX_uid561_pT3_uid477_invPolyEval_in <= nx_mergedSignalTM_uid547_pT3_uid477_invPolyEval_q(8 downto 0);
    aboveLeftX_uid561_pT3_uid477_invPolyEval_b <= aboveLeftX_uid561_pT3_uid477_invPolyEval_in(8 downto 6);

    -- sm0_uid566_pT3_uid477_invPolyEval(MULT,565)@43 + 2
    sm0_uid566_pT3_uid477_invPolyEval_pr <= UNSIGNED(sm0_uid566_pT3_uid477_invPolyEval_a0) * UNSIGNED(sm0_uid566_pT3_uid477_invPolyEval_b0);
    sm0_uid566_pT3_uid477_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid566_pT3_uid477_invPolyEval_a0 <= (others => '0');
            sm0_uid566_pT3_uid477_invPolyEval_b0 <= (others => '0');
            sm0_uid566_pT3_uid477_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid566_pT3_uid477_invPolyEval_a0 <= aboveLeftX_uid561_pT3_uid477_invPolyEval_b;
            sm0_uid566_pT3_uid477_invPolyEval_b0 <= aboveLeftY_uid562_pT3_uid477_invPolyEval_b;
            sm0_uid566_pT3_uid477_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid566_pT3_uid477_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid566_pT3_uid477_invPolyEval_q <= sm0_uid566_pT3_uid477_invPolyEval_s1;

    -- sumAb_uid567_pT3_uid477_invPolyEval(BITJOIN,566)@45
    sumAb_uid567_pT3_uid477_invPolyEval_q <= sm0_uid563_pT3_uid477_invPolyEval_cma_q & sm0_uid566_pT3_uid477_invPolyEval_q;

    -- lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval(ADD,569)@45
    lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 42 => sumAb_uid567_pT3_uid477_invPolyEval_q(41)) & sumAb_uid567_pT3_uid477_invPolyEval_q));
    lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 25 => highBBits_uid569_pT3_uid477_invPolyEval_b(24)) & highBBits_uid569_pT3_uid477_invPolyEval_b));
    lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_b));
    lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_q <= lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_o(42 downto 0);

    -- lowRangeB_uid568_pT3_uid477_invPolyEval(BITSELECT,567)@45
    lowRangeB_uid568_pT3_uid477_invPolyEval_in <= multSumOfTwoTS_uid564_pT3_uid477_invPolyEval_cma_q(11 downto 0);
    lowRangeB_uid568_pT3_uid477_invPolyEval_b <= lowRangeB_uid568_pT3_uid477_invPolyEval_in(11 downto 0);

    -- lev1_a0_uid571_pT3_uid477_invPolyEval(BITJOIN,570)@45
    lev1_a0_uid571_pT3_uid477_invPolyEval_q <= lev1_a0sumAHighB_uid570_pT3_uid477_invPolyEval_q & lowRangeB_uid568_pT3_uid477_invPolyEval_b;

    -- os_uid572_pT3_uid477_invPolyEval(BITSELECT,571)@45
    os_uid572_pT3_uid477_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid571_pT3_uid477_invPolyEval_q(52 downto 0));
    os_uid572_pT3_uid477_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid572_pT3_uid477_invPolyEval_in(52 downto 17));

    -- redist21_os_uid572_pT3_uid477_invPolyEval_b_1(DELAY,781)
    redist21_os_uid572_pT3_uid477_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid572_pT3_uid477_invPolyEval_b, xout => redist21_os_uid572_pT3_uid477_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid479_invPolyEval(BITSELECT,478)@46
    highBBits_uid479_invPolyEval_b <= STD_LOGIC_VECTOR(redist21_os_uid572_pT3_uid477_invPolyEval_b_1_q(35 downto 2));

    -- redist11_yAddr_uid145_fpPowrTest_merged_bit_select_b_9(DELAY,771)
    redist11_yAddr_uid145_fpPowrTest_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist10_yAddr_uid145_fpPowrTest_merged_bit_select_b_5_q, xout => redist11_yAddr_uid145_fpPowrTest_merged_bit_select_b_9_q, clk => clk, aclr => areset );

    -- memoryC0_uid447_sqrtTables_lutmem(DUALMEM,708)@44 + 2
    -- in j@20000000
    memoryC0_uid447_sqrtTables_lutmem_aa <= redist11_yAddr_uid145_fpPowrTest_merged_bit_select_b_9_q;
    memoryC0_uid447_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid447_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_pow_0002_memoryC0_uid447_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid447_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid447_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid447_sqrtTables_lutmem_ir
    );
    memoryC0_uid447_sqrtTables_lutmem_r <= memoryC0_uid447_sqrtTables_lutmem_ir(39 downto 0);

    -- os_uid449_sqrtTables(BITJOIN,448)@46
    os_uid449_sqrtTables_q <= GND_q & memoryC0_uid447_sqrtTables_lutmem_r;

    -- s3sumAHighB_uid480_invPolyEval(ADD,479)@46
    s3sumAHighB_uid480_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => os_uid449_sqrtTables_q(40)) & os_uid449_sqrtTables_q));
    s3sumAHighB_uid480_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 34 => highBBits_uid479_invPolyEval_b(33)) & highBBits_uid479_invPolyEval_b));
    s3sumAHighB_uid480_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid480_invPolyEval_a) + SIGNED(s3sumAHighB_uid480_invPolyEval_b));
    s3sumAHighB_uid480_invPolyEval_q <= s3sumAHighB_uid480_invPolyEval_o(41 downto 0);

    -- lowRangeB_uid478_invPolyEval(BITSELECT,477)@46
    lowRangeB_uid478_invPolyEval_in <= redist21_os_uid572_pT3_uid477_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid478_invPolyEval_b <= lowRangeB_uid478_invPolyEval_in(1 downto 0);

    -- s3_uid481_invPolyEval(BITJOIN,480)@46
    s3_uid481_invPolyEval_q <= s3sumAHighB_uid480_invPolyEval_q & lowRangeB_uid478_invPolyEval_b;

    -- peORExpInc_uid149_fpPowrTest(BITSELECT,148)@46
    peORExpInc_uid149_fpPowrTest_in <= STD_LOGIC_VECTOR(s3_uid481_invPolyEval_q(41 downto 0));
    peORExpInc_uid149_fpPowrTest_b <= STD_LOGIC_VECTOR(peORExpInc_uid149_fpPowrTest_in(41 downto 41));

    -- redist44_peORExpInc_uid149_fpPowrTest_b_1(DELAY,804)
    redist44_peORExpInc_uid149_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => peORExpInc_uid149_fpPowrTest_b, xout => redist44_peORExpInc_uid149_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_notEnable(LOGICAL,873)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_nor(LOGICAL,874)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_nor_q <= not (redist46_ePreRndExp_uid124_fpPowrTest_b_14_notEnable_q or redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q);

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_last(CONSTANT,870)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_last_q <= "01001";

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp(LOGICAL,871)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_b <= STD_LOGIC_VECTOR("0" & redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_q);
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_q <= "1" WHEN redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_last_q = redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_b ELSE "0";

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg(REG,872)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg_q <= STD_LOGIC_VECTOR(redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmp_q);
        END IF;
    END PROCESS;

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena(REG,875)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist46_ePreRndExp_uid124_fpPowrTest_b_14_nor_q = "1") THEN
                redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist46_ePreRndExp_uid124_fpPowrTest_b_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_enaAnd(LOGICAL,876)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_enaAnd_q <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_sticky_ena_q and VCC_q;

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt(COUNTER,868)
    -- low=0, high=10, step=1, init=0
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq <= '1';
            ELSE
                redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq <= '0';
            END IF;
            IF (redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_eq = '1') THEN
                redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i + 6;
            ELSE
                redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_i, 4)));

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_inputreg(DELAY,866)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_ePreRndExp_uid124_fpPowrTest_b_1_q, xout => redist46_ePreRndExp_uid124_fpPowrTest_b_14_inputreg_q, clk => clk, aclr => areset );

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr(REG,869)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr_q <= STD_LOGIC_VECTOR(redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem(DUALMEM,867)
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ia <= STD_LOGIC_VECTOR(redist46_ePreRndExp_uid124_fpPowrTest_b_14_inputreg_q);
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_aa <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_wraddr_q;
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ab <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_rdcnt_q;
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_reset0 <= areset;
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 11,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist46_ePreRndExp_uid124_fpPowrTest_b_14_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_reset0,
        clock1 => clk,
        address_a => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_aa,
        data_a => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_ab,
        q_b => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_iq
    );
    redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_q <= redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_iq(10 downto 0);

    -- expRPostBiasPreExc0_uid150_fpPowrTest(ADD,149)@46 + 1
    expRPostBiasPreExc0_uid150_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_q(10)) & redist46_ePreRndExp_uid124_fpPowrTest_b_14_mem_q));
    expRPostBiasPreExc0_uid150_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstBias_uid7_fpPowrTest_q));
    expRPostBiasPreExc0_uid150_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostBiasPreExc0_uid150_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRPostBiasPreExc0_uid150_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid150_fpPowrTest_a) + SIGNED(expRPostBiasPreExc0_uid150_fpPowrTest_b));
        END IF;
    END PROCESS;
    expRPostBiasPreExc0_uid150_fpPowrTest_q <= expRPostBiasPreExc0_uid150_fpPowrTest_o(11 downto 0);

    -- expRPostBiasPreExc_uid151_fpPowrTest(ADD,150)@47
    expRPostBiasPreExc_uid151_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPostBiasPreExc0_uid150_fpPowrTest_q(11)) & expRPostBiasPreExc0_uid150_fpPowrTest_q));
    expRPostBiasPreExc_uid151_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & redist44_peORExpInc_uid149_fpPowrTest_b_1_q));
    expRPostBiasPreExc_uid151_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid151_fpPowrTest_a) + SIGNED(expRPostBiasPreExc_uid151_fpPowrTest_b));
    expRPostBiasPreExc_uid151_fpPowrTest_q <= expRPostBiasPreExc_uid151_fpPowrTest_o(12 downto 0);

    -- expR_uid153_fpPowrTest(BITSELECT,152)@47
    expR_uid153_fpPowrTest_in <= expRPostBiasPreExc_uid151_fpPowrTest_q(7 downto 0);
    expR_uid153_fpPowrTest_b <= expR_uid153_fpPowrTest_in(7 downto 0);

    -- cstOneFPExpFrac_uid45_fpPowrTest(BITJOIN,44)@12
    cstOneFPExpFrac_uid45_fpPowrTest_q <= cstBias_uid7_fpPowrTest_q & cstAllZWF_uid6_fpPowrTest_q;

    -- expFracX_uid46_fpPowrTest(BITJOIN,45)@12
    expFracX_uid46_fpPowrTest_q <= redist93_exp_x_uid14_fpPowrTest_b_12_mem_q & redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q;

    -- xEQOneAbs_uid47_fpPowrTest(LOGICAL,46)@12 + 1
    xEQOneAbs_uid47_fpPowrTest_qi <= "1" WHEN expFracX_uid46_fpPowrTest_q = cstOneFPExpFrac_uid45_fpPowrTest_q ELSE "0";
    xEQOneAbs_uid47_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xEQOneAbs_uid47_fpPowrTest_qi, xout => xEQOneAbs_uid47_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist72_xEQOneAbs_uid47_fpPowrTest_q_35(DELAY,832)
    redist72_xEQOneAbs_uid47_fpPowrTest_q_35 : dspba_delay
    GENERIC MAP ( width => 1, depth => 34, reset_kind => "ASYNC" )
    PORT MAP ( xin => xEQOneAbs_uid47_fpPowrTest_q, xout => redist72_xEQOneAbs_uid47_fpPowrTest_q_35_q, clk => clk, aclr => areset );

    -- excZ_y_uid30_fpPowrTest(LOGICAL,29)@23 + 1
    excZ_y_uid30_fpPowrTest_qi <= "1" WHEN exp_y_uid28_fpPowrTest_b = cstAllZWE_uid13_fpPowrTest_q ELSE "0";
    excZ_y_uid30_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid30_fpPowrTest_qi, xout => excZ_y_uid30_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist80_excZ_y_uid30_fpPowrTest_q_24(DELAY,840)
    redist80_excZ_y_uid30_fpPowrTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid30_fpPowrTest_q, xout => redist80_excZ_y_uid30_fpPowrTest_q_24_q, clk => clk, aclr => areset );

    -- excROne_uid195_fpPowrTest(LOGICAL,194)@47
    excROne_uid195_fpPowrTest_q <= redist80_excZ_y_uid30_fpPowrTest_q_24_q or redist72_xEQOneAbs_uid47_fpPowrTest_q_35_q;

    -- expRPostOne_uid197_fpPowrTest(MUX,196)@47 + 1
    expRPostOne_uid197_fpPowrTest_s <= excROne_uid195_fpPowrTest_q;
    expRPostOne_uid197_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostOne_uid197_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostOne_uid197_fpPowrTest_s) IS
                WHEN "0" => expRPostOne_uid197_fpPowrTest_q <= expR_uid153_fpPowrTest_b;
                WHEN "1" => expRPostOne_uid197_fpPowrTest_q <= cstBias_uid7_fpPowrTest_q;
                WHEN OTHERS => expRPostOne_uid197_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- cstAllZWE_uid13_fpPowrTest(CONSTANT,12)
    cstAllZWE_uid13_fpPowrTest_q <= "00000000";

    -- fracXIsZero_uid32_fpPowrTest(LOGICAL,31)@23 + 1
    fracXIsZero_uid32_fpPowrTest_qi <= "1" WHEN cstAllZWF_uid6_fpPowrTest_q = frac_y_uid29_fpPowrTest_b ELSE "0";
    fracXIsZero_uid32_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid32_fpPowrTest_qi, xout => fracXIsZero_uid32_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist78_fracXIsZero_uid32_fpPowrTest_q_24(DELAY,838)
    redist78_fracXIsZero_uid32_fpPowrTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid32_fpPowrTest_q, xout => redist78_fracXIsZero_uid32_fpPowrTest_q_24_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid33_fpPowrTest(LOGICAL,32)@47
    fracXIsNotZero_uid33_fpPowrTest_q <= not (redist78_fracXIsZero_uid32_fpPowrTest_q_24_q);

    -- expXIsMax_uid31_fpPowrTest(LOGICAL,30)@23 + 1
    expXIsMax_uid31_fpPowrTest_qi <= "1" WHEN exp_y_uid28_fpPowrTest_b = cstAllOWE_uid11_fpPowrTest_q ELSE "0";
    expXIsMax_uid31_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpPowrTest_qi, xout => expXIsMax_uid31_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist79_expXIsMax_uid31_fpPowrTest_q_24(DELAY,839)
    redist79_expXIsMax_uid31_fpPowrTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpPowrTest_q, xout => redist79_expXIsMax_uid31_fpPowrTest_q_24_q, clk => clk, aclr => areset );

    -- excN_y_uid35_fpPowrTest(LOGICAL,34)@47
    excN_y_uid35_fpPowrTest_q <= redist79_expXIsMax_uid31_fpPowrTest_q_24_q and fracXIsNotZero_uid33_fpPowrTest_q;

    -- fracXIsZero_uid18_fpPowrTest(LOGICAL,17)@12 + 1
    fracXIsZero_uid18_fpPowrTest_qi <= "1" WHEN cstAllZWF_uid6_fpPowrTest_q = redist92_frac_x_uid15_fpPowrTest_b_12_outputreg_q ELSE "0";
    fracXIsZero_uid18_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid18_fpPowrTest_qi, xout => fracXIsZero_uid18_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist86_fracXIsZero_uid18_fpPowrTest_q_14(DELAY,846)
    redist86_fracXIsZero_uid18_fpPowrTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid18_fpPowrTest_q, xout => redist86_fracXIsZero_uid18_fpPowrTest_q_14_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid19_fpPowrTest(LOGICAL,18)@26
    fracXIsNotZero_uid19_fpPowrTest_q <= not (redist86_fracXIsZero_uid18_fpPowrTest_q_14_q);

    -- excN_x_uid21_fpPowrTest(LOGICAL,20)@26 + 1
    excN_x_uid21_fpPowrTest_qi <= redist87_expXIsMax_uid17_fpPowrTest_q_13_q and fracXIsNotZero_uid19_fpPowrTest_q;
    excN_x_uid21_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid21_fpPowrTest_qi, xout => excN_x_uid21_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist83_excN_x_uid21_fpPowrTest_q_21(DELAY,843)
    redist83_excN_x_uid21_fpPowrTest_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid21_fpPowrTest_q, xout => redist83_excN_x_uid21_fpPowrTest_q_21_q, clk => clk, aclr => areset );

    -- oneIsNaN_uid188_fpPowrTest(LOGICAL,187)@47
    oneIsNaN_uid188_fpPowrTest_q <= redist83_excN_x_uid21_fpPowrTest_q_21_q or excN_y_uid35_fpPowrTest_q;

    -- signX_uid39_fpPowrTest(BITSELECT,38)@0
    signX_uid39_fpPowrTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist75_signX_uid39_fpPowrTest_b_47(DELAY,835)
    redist75_signX_uid39_fpPowrTest_b_47 : dspba_delay
    GENERIC MAP ( width => 1, depth => 47, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid39_fpPowrTest_b, xout => redist75_signX_uid39_fpPowrTest_b_47_q, clk => clk, aclr => areset );

    -- excI_x_uid20_fpPowrTest(LOGICAL,19)@26 + 1
    excI_x_uid20_fpPowrTest_qi <= redist87_expXIsMax_uid17_fpPowrTest_q_13_q and redist86_fracXIsZero_uid18_fpPowrTest_q_14_q;
    excI_x_uid20_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid20_fpPowrTest_qi, xout => excI_x_uid20_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist84_excI_x_uid20_fpPowrTest_q_21(DELAY,844)
    redist84_excI_x_uid20_fpPowrTest_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid20_fpPowrTest_q, xout => redist84_excI_x_uid20_fpPowrTest_q_21_q, clk => clk, aclr => areset );

    -- redist81_excR_x_uid24_fpPowrTest_q_21(DELAY,841)
    redist81_excR_x_uid24_fpPowrTest_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid24_fpPowrTest_q, xout => redist81_excR_x_uid24_fpPowrTest_q_21_q, clk => clk, aclr => areset );

    -- xRegOrInf_uid189_fpPowrTest(LOGICAL,188)@47
    xRegOrInf_uid189_fpPowrTest_q <= redist81_excR_x_uid24_fpPowrTest_q_21_q or redist84_excI_x_uid20_fpPowrTest_q_21_q;

    -- nanCase4_uid190_fpPowrTest(LOGICAL,189)@47
    nanCase4_uid190_fpPowrTest_q <= xRegOrInf_uid189_fpPowrTest_q and redist75_signX_uid39_fpPowrTest_b_47_q;

    -- invSignX_uid160_fpPowrTest(LOGICAL,159)@47
    invSignX_uid160_fpPowrTest_q <= not (redist75_signX_uid39_fpPowrTest_b_47_q);

    -- nanCase3_uid191_fpPowrTest(LOGICAL,190)@47
    nanCase3_uid191_fpPowrTest_q <= redist84_excI_x_uid20_fpPowrTest_q_21_q and invSignX_uid160_fpPowrTest_q and redist80_excZ_y_uid30_fpPowrTest_q_24_q;

    -- redist89_excZ_x_uid16_fpPowrTest_q_34(DELAY,849)
    redist89_excZ_x_uid16_fpPowrTest_q_34 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist88_excZ_x_uid16_fpPowrTest_q_13_q, xout => redist89_excZ_x_uid16_fpPowrTest_q_34_q, clk => clk, aclr => areset );

    -- nanCase2_uid192_fpPowrTest(LOGICAL,191)@47
    nanCase2_uid192_fpPowrTest_q <= redist89_excZ_x_uid16_fpPowrTest_q_34_q and redist80_excZ_y_uid30_fpPowrTest_q_24_q;

    -- excI_y_uid34_fpPowrTest(LOGICAL,33)@47
    excI_y_uid34_fpPowrTest_q <= redist79_expXIsMax_uid31_fpPowrTest_q_24_q and redist78_fracXIsZero_uid32_fpPowrTest_q_24_q;

    -- nanCase1_uid193_fpPowrTest(LOGICAL,192)@47
    nanCase1_uid193_fpPowrTest_q <= redist81_excR_x_uid24_fpPowrTest_q_21_q and redist72_xEQOneAbs_uid47_fpPowrTest_q_35_q and excI_y_uid34_fpPowrTest_q;

    -- excRNaN_uid194_fpPowrTest(LOGICAL,193)@47 + 1
    excRNaN_uid194_fpPowrTest_qi <= nanCase1_uid193_fpPowrTest_q or nanCase2_uid192_fpPowrTest_q or nanCase3_uid191_fpPowrTest_q or nanCase4_uid190_fpPowrTest_q or oneIsNaN_uid188_fpPowrTest_q;
    excRNaN_uid194_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid194_fpPowrTest_qi, xout => excRNaN_uid194_fpPowrTest_q, clk => clk, aclr => areset );

    -- invXIsOne_uid162_fpPowrTest(LOGICAL,161)@47
    invXIsOne_uid162_fpPowrTest_q <= not (redist72_xEQOneAbs_uid47_fpPowrTest_q_35_q);

    -- redist52_signProd_uid104_fpPowrTest_q_20(DELAY,812)
    redist52_signProd_uid104_fpPowrTest_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist51_signProd_uid104_fpPowrTest_q_6_q, xout => redist52_signProd_uid104_fpPowrTest_q_20_q, clk => clk, aclr => areset );

    -- invSignProd_uid178_fpPowrTest(LOGICAL,177)@47
    invSignProd_uid178_fpPowrTest_q <= not (redist52_signProd_uid104_fpPowrTest_q_20_q);

    -- expOvfInitialExp_uid118_fpPowrTest(BITSELECT,117)@28
    expOvfInitialExp_uid118_fpPowrTest_b <= STD_LOGIC_VECTOR(shiftValuePreSatExp_uid117_fpPowrTest_q(12 downto 12));

    -- redist49_expOvfInitialExp_uid118_fpPowrTest_b_19(DELAY,809)
    redist49_expOvfInitialExp_uid118_fpPowrTest_b_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 19, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOvfInitialExp_uid118_fpPowrTest_b, xout => redist49_expOvfInitialExp_uid118_fpPowrTest_b_19_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid36_fpPowrTest(LOGICAL,35)@47
    invExpXIsMax_uid36_fpPowrTest_q <= not (redist79_expXIsMax_uid31_fpPowrTest_q_24_q);

    -- InvExpXIsZero_uid37_fpPowrTest(LOGICAL,36)@47
    InvExpXIsZero_uid37_fpPowrTest_q <= not (redist80_excZ_y_uid30_fpPowrTest_q_24_q);

    -- excR_y_uid38_fpPowrTest(LOGICAL,37)@47
    excR_y_uid38_fpPowrTest_q <= InvExpXIsZero_uid37_fpPowrTest_q and invExpXIsMax_uid36_fpPowrTest_q;

    -- infCase5_uid179_fpPowrTest(LOGICAL,178)@47 + 1
    infCase5_uid179_fpPowrTest_qi <= redist81_excR_x_uid24_fpPowrTest_q_21_q and invSignX_uid160_fpPowrTest_q and excR_y_uid38_fpPowrTest_q and redist49_expOvfInitialExp_uid118_fpPowrTest_b_19_q and invSignProd_uid178_fpPowrTest_q and invXIsOne_uid162_fpPowrTest_q;
    infCase5_uid179_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => infCase5_uid179_fpPowrTest_qi, xout => infCase5_uid179_fpPowrTest_q, clk => clk, aclr => areset );

    -- expOvf_uid156_fpPowrTest(COMPARE,155)@47 + 1
    expOvf_uid156_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid151_fpPowrTest_q(12)) & expRPostBiasPreExc_uid151_fpPowrTest_q));
    expOvf_uid156_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000" & cstAllOWE_uid11_fpPowrTest_q));
    expOvf_uid156_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid156_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid156_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid156_fpPowrTest_a) - SIGNED(expOvf_uid156_fpPowrTest_b));
        END IF;
    END PROCESS;
    expOvf_uid156_fpPowrTest_n(0) <= not (expOvf_uid156_fpPowrTest_o(14));

    -- redist50_expOvfInitialExp_uid118_fpPowrTest_b_20(DELAY,810)
    redist50_expOvfInitialExp_uid118_fpPowrTest_b_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist49_expOvfInitialExp_uid118_fpPowrTest_b_19_q, xout => redist50_expOvfInitialExp_uid118_fpPowrTest_b_20_q, clk => clk, aclr => areset );

    -- invExpOvfInitialExp_uid180_fpPowrTest(LOGICAL,179)@48
    invExpOvfInitialExp_uid180_fpPowrTest_q <= not (redist50_expOvfInitialExp_uid118_fpPowrTest_b_20_q);

    -- redist76_excR_y_uid38_fpPowrTest_q_1(DELAY,836)
    redist76_excR_y_uid38_fpPowrTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_y_uid38_fpPowrTest_q, xout => redist76_excR_y_uid38_fpPowrTest_q_1_q, clk => clk, aclr => areset );

    -- redist42_invSignX_uid160_fpPowrTest_q_1(DELAY,802)
    redist42_invSignX_uid160_fpPowrTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignX_uid160_fpPowrTest_q, xout => redist42_invSignX_uid160_fpPowrTest_q_1_q, clk => clk, aclr => areset );

    -- redist82_excR_x_uid24_fpPowrTest_q_22(DELAY,842)
    redist82_excR_x_uid24_fpPowrTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist81_excR_x_uid24_fpPowrTest_q_21_q, xout => redist82_excR_x_uid24_fpPowrTest_q_22_q, clk => clk, aclr => areset );

    -- infCase4_uid181_fpPowrTest(LOGICAL,180)@48
    infCase4_uid181_fpPowrTest_q <= redist82_excR_x_uid24_fpPowrTest_q_22_q and redist42_invSignX_uid160_fpPowrTest_q_1_q and redist76_excR_y_uid38_fpPowrTest_q_1_q and invExpOvfInitialExp_uid180_fpPowrTest_q and expOvf_uid156_fpPowrTest_n;

    -- redist74_signY_uid42_fpPowrTest_b_25(DELAY,834)
    redist74_signY_uid42_fpPowrTest_b_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist73_signY_uid42_fpPowrTest_b_4_q, xout => redist74_signY_uid42_fpPowrTest_b_25_q, clk => clk, aclr => areset );

    -- invSignY_uid161_fpPowrTest(LOGICAL,160)@48
    invSignY_uid161_fpPowrTest_q <= not (redist74_signY_uid42_fpPowrTest_b_25_q);

    -- yRegOrInf_uid168_fpPowrTest(LOGICAL,167)@47 + 1
    yRegOrInf_uid168_fpPowrTest_qi <= excR_y_uid38_fpPowrTest_q or excI_y_uid34_fpPowrTest_q;
    yRegOrInf_uid168_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yRegOrInf_uid168_fpPowrTest_qi, xout => yRegOrInf_uid168_fpPowrTest_q, clk => clk, aclr => areset );

    -- redist85_excI_x_uid20_fpPowrTest_q_22(DELAY,845)
    redist85_excI_x_uid20_fpPowrTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist84_excI_x_uid20_fpPowrTest_q_21_q, xout => redist85_excI_x_uid20_fpPowrTest_q_22_q, clk => clk, aclr => areset );

    -- infCase3_uid183_fpPowrTest(LOGICAL,182)@48
    infCase3_uid183_fpPowrTest_q <= redist85_excI_x_uid20_fpPowrTest_q_22_q and redist42_invSignX_uid160_fpPowrTest_q_1_q and yRegOrInf_uid168_fpPowrTest_q and invSignY_uid161_fpPowrTest_q;

    -- redist77_excI_y_uid34_fpPowrTest_q_1(DELAY,837)
    redist77_excI_y_uid34_fpPowrTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid34_fpPowrTest_q, xout => redist77_excI_y_uid34_fpPowrTest_q_1_q, clk => clk, aclr => areset );

    -- redist40_xInZO_uid166_fpPowrTest_c_34_notEnable(LOGICAL,862)
    redist40_xInZO_uid166_fpPowrTest_c_34_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist40_xInZO_uid166_fpPowrTest_c_34_nor(LOGICAL,863)
    redist40_xInZO_uid166_fpPowrTest_c_34_nor_q <= not (redist40_xInZO_uid166_fpPowrTest_c_34_notEnable_q or redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q);

    -- redist40_xInZO_uid166_fpPowrTest_c_34_mem_last(CONSTANT,859)
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_last_q <= "011110";

    -- redist40_xInZO_uid166_fpPowrTest_c_34_cmp(LOGICAL,860)
    redist40_xInZO_uid166_fpPowrTest_c_34_cmp_b <= STD_LOGIC_VECTOR("0" & redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_q);
    redist40_xInZO_uid166_fpPowrTest_c_34_cmp_q <= "1" WHEN redist40_xInZO_uid166_fpPowrTest_c_34_mem_last_q = redist40_xInZO_uid166_fpPowrTest_c_34_cmp_b ELSE "0";

    -- redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg(REG,861)
    redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg_q <= STD_LOGIC_VECTOR(redist40_xInZO_uid166_fpPowrTest_c_34_cmp_q);
        END IF;
    END PROCESS;

    -- redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena(REG,864)
    redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist40_xInZO_uid166_fpPowrTest_c_34_nor_q = "1") THEN
                redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q <= STD_LOGIC_VECTOR(redist40_xInZO_uid166_fpPowrTest_c_34_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_xInZO_uid166_fpPowrTest_c_34_enaAnd(LOGICAL,865)
    redist40_xInZO_uid166_fpPowrTest_c_34_enaAnd_q <= redist40_xInZO_uid166_fpPowrTest_c_34_sticky_ena_q and VCC_q;

    -- redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt(COUNTER,857)
    -- low=0, high=31, step=1, init=0
    redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i <= TO_UNSIGNED(0, 5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i <= redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_i, 5)));

    -- xInZO_uid166_fpPowrTest(COMPARE,165)@13 + 1
    xInZO_uid166_fpPowrTest_a <= STD_LOGIC_VECTOR("00" & redist94_exp_x_uid14_fpPowrTest_b_13_q);
    xInZO_uid166_fpPowrTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid7_fpPowrTest_q);
    xInZO_uid166_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xInZO_uid166_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xInZO_uid166_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xInZO_uid166_fpPowrTest_a) - UNSIGNED(xInZO_uid166_fpPowrTest_b));
        END IF;
    END PROCESS;
    xInZO_uid166_fpPowrTest_c(0) <= xInZO_uid166_fpPowrTest_o(9);

    -- redist40_xInZO_uid166_fpPowrTest_c_34_wraddr(REG,858)
    redist40_xInZO_uid166_fpPowrTest_c_34_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_wraddr_q <= "11111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_xInZO_uid166_fpPowrTest_c_34_wraddr_q <= STD_LOGIC_VECTOR(redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist40_xInZO_uid166_fpPowrTest_c_34_mem(DUALMEM,856)
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_ia <= STD_LOGIC_VECTOR(xInZO_uid166_fpPowrTest_c);
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_aa <= redist40_xInZO_uid166_fpPowrTest_c_34_wraddr_q;
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_ab <= redist40_xInZO_uid166_fpPowrTest_c_34_rdcnt_q;
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_reset0 <= areset;
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 32,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist40_xInZO_uid166_fpPowrTest_c_34_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist40_xInZO_uid166_fpPowrTest_c_34_mem_reset0,
        clock1 => clk,
        address_a => redist40_xInZO_uid166_fpPowrTest_c_34_mem_aa,
        data_a => redist40_xInZO_uid166_fpPowrTest_c_34_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist40_xInZO_uid166_fpPowrTest_c_34_mem_ab,
        q_b => redist40_xInZO_uid166_fpPowrTest_c_34_mem_iq
    );
    redist40_xInZO_uid166_fpPowrTest_c_34_mem_q <= redist40_xInZO_uid166_fpPowrTest_c_34_mem_iq(0 downto 0);

    -- xInZOZPos_uid167_fpPowrTest(LOGICAL,166)@47 + 1
    xInZOZPos_uid167_fpPowrTest_qi <= invSignX_uid160_fpPowrTest_q and redist40_xInZO_uid166_fpPowrTest_c_34_mem_q;
    xInZOZPos_uid167_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZOZPos_uid167_fpPowrTest_qi, xout => xInZOZPos_uid167_fpPowrTest_q, clk => clk, aclr => areset );

    -- infCase2_uid184_fpPowrTest(LOGICAL,183)@48
    infCase2_uid184_fpPowrTest_q <= redist82_excR_x_uid24_fpPowrTest_q_22_q and xInZOZPos_uid167_fpPowrTest_q and redist77_excI_y_uid34_fpPowrTest_q_1_q and redist74_signY_uid42_fpPowrTest_b_25_q;

    -- expFracXGTExpFracOne_uid163_fpPowrTest(COMPARE,162)@12 + 1
    expFracXGTExpFracOne_uid163_fpPowrTest_a <= STD_LOGIC_VECTOR("00" & cstOneFPExpFrac_uid45_fpPowrTest_q);
    expFracXGTExpFracOne_uid163_fpPowrTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid46_fpPowrTest_q);
    expFracXGTExpFracOne_uid163_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracXGTExpFracOne_uid163_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracXGTExpFracOne_uid163_fpPowrTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracXGTExpFracOne_uid163_fpPowrTest_a) - UNSIGNED(expFracXGTExpFracOne_uid163_fpPowrTest_b));
        END IF;
    END PROCESS;
    expFracXGTExpFracOne_uid163_fpPowrTest_c(0) <= expFracXGTExpFracOne_uid163_fpPowrTest_o(32);

    -- redist41_expFracXGTExpFracOne_uid163_fpPowrTest_c_35(DELAY,801)
    redist41_expFracXGTExpFracOne_uid163_fpPowrTest_c_35 : dspba_delay
    GENERIC MAP ( width => 1, depth => 34, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracXGTExpFracOne_uid163_fpPowrTest_c, xout => redist41_expFracXGTExpFracOne_uid163_fpPowrTest_c_35_q, clk => clk, aclr => areset );

    -- xGTOne_uid164_fpPowrTest(LOGICAL,163)@47 + 1
    xGTOne_uid164_fpPowrTest_qi <= invSignX_uid160_fpPowrTest_q and redist41_expFracXGTExpFracOne_uid163_fpPowrTest_c_35_q;
    xGTOne_uid164_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTOne_uid164_fpPowrTest_qi, xout => xGTOne_uid164_fpPowrTest_q, clk => clk, aclr => areset );

    -- infCase1_uid185_fpPowrTest(LOGICAL,184)@48
    infCase1_uid185_fpPowrTest_q <= redist82_excR_x_uid24_fpPowrTest_q_22_q and xGTOne_uid164_fpPowrTest_q and redist77_excI_y_uid34_fpPowrTest_q_1_q and invSignY_uid161_fpPowrTest_q;

    -- redist90_excZ_x_uid16_fpPowrTest_q_35(DELAY,850)
    redist90_excZ_x_uid16_fpPowrTest_q_35 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist89_excZ_x_uid16_fpPowrTest_q_34_q, xout => redist90_excZ_x_uid16_fpPowrTest_q_35_q, clk => clk, aclr => areset );

    -- infCase0_uid186_fpPowrTest(LOGICAL,185)@48
    infCase0_uid186_fpPowrTest_q <= redist90_excZ_x_uid16_fpPowrTest_q_35_q and yRegOrInf_uid168_fpPowrTest_q and redist74_signY_uid42_fpPowrTest_b_25_q;

    -- excRInf_uid187_fpPowrTest(LOGICAL,186)@48
    excRInf_uid187_fpPowrTest_q <= infCase0_uid186_fpPowrTest_q or infCase1_uid185_fpPowrTest_q or infCase2_uid184_fpPowrTest_q or infCase3_uid183_fpPowrTest_q or infCase4_uid181_fpPowrTest_q or infCase5_uid179_fpPowrTest_q;

    -- zeroCase6_uid169_fpPowrTest(LOGICAL,168)@47 + 1
    zeroCase6_uid169_fpPowrTest_qi <= redist81_excR_x_uid24_fpPowrTest_q_21_q and invSignX_uid160_fpPowrTest_q and excR_y_uid38_fpPowrTest_q and redist49_expOvfInitialExp_uid118_fpPowrTest_b_19_q and redist52_signProd_uid104_fpPowrTest_q_20_q and invXIsOne_uid162_fpPowrTest_q;
    zeroCase6_uid169_fpPowrTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => zeroCase6_uid169_fpPowrTest_qi, xout => zeroCase6_uid169_fpPowrTest_q, clk => clk, aclr => areset );

    -- expUdf_uid154_fpPowrTest(COMPARE,153)@47 + 1
    expUdf_uid154_fpPowrTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & GND_q));
    expUdf_uid154_fpPowrTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid151_fpPowrTest_q(12)) & expRPostBiasPreExc_uid151_fpPowrTest_q));
    expUdf_uid154_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid154_fpPowrTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid154_fpPowrTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid154_fpPowrTest_a) - SIGNED(expUdf_uid154_fpPowrTest_b));
        END IF;
    END PROCESS;
    expUdf_uid154_fpPowrTest_n(0) <= not (expUdf_uid154_fpPowrTest_o(14));

    -- zeroCase5_uid170_fpPowrTest(LOGICAL,169)@48
    zeroCase5_uid170_fpPowrTest_q <= redist82_excR_x_uid24_fpPowrTest_q_22_q and redist42_invSignX_uid160_fpPowrTest_q_1_q and redist76_excR_y_uid38_fpPowrTest_q_1_q and expUdf_uid154_fpPowrTest_n;

    -- zeroCase4_uid172_fpPowrTest(LOGICAL,171)@48
    zeroCase4_uid172_fpPowrTest_q <= redist85_excI_x_uid20_fpPowrTest_q_22_q and redist42_invSignX_uid160_fpPowrTest_q_1_q and yRegOrInf_uid168_fpPowrTest_q and redist74_signY_uid42_fpPowrTest_b_25_q;

    -- zeroCase3_uid173_fpPowrTest(LOGICAL,172)@48
    zeroCase3_uid173_fpPowrTest_q <= redist77_excI_y_uid34_fpPowrTest_q_1_q and redist74_signY_uid42_fpPowrTest_b_25_q and redist82_excR_x_uid24_fpPowrTest_q_22_q and xGTOne_uid164_fpPowrTest_q and redist42_invSignX_uid160_fpPowrTest_q_1_q;

    -- zeroCase2_uid174_fpPowrTest(LOGICAL,173)@48
    zeroCase2_uid174_fpPowrTest_q <= redist77_excI_y_uid34_fpPowrTest_q_1_q and invSignY_uid161_fpPowrTest_q and redist82_excR_x_uid24_fpPowrTest_q_22_q and xInZOZPos_uid167_fpPowrTest_q;

    -- zeroCase1_uid175_fpPowrTest(LOGICAL,174)@48
    zeroCase1_uid175_fpPowrTest_q <= redist90_excZ_x_uid16_fpPowrTest_q_35_q and redist42_invSignX_uid160_fpPowrTest_q_1_q and redist77_excI_y_uid34_fpPowrTest_q_1_q and invSignY_uid161_fpPowrTest_q;

    -- zeroCase0_uid176_fpPowrTest(LOGICAL,175)@48
    zeroCase0_uid176_fpPowrTest_q <= redist90_excZ_x_uid16_fpPowrTest_q_35_q and yRegOrInf_uid168_fpPowrTest_q and invSignY_uid161_fpPowrTest_q;

    -- excRZero_uid177_fpPowrTest(LOGICAL,176)@48
    excRZero_uid177_fpPowrTest_q <= zeroCase0_uid176_fpPowrTest_q or zeroCase1_uid175_fpPowrTest_q or zeroCase2_uid174_fpPowrTest_q or zeroCase3_uid173_fpPowrTest_q or zeroCase4_uid172_fpPowrTest_q or zeroCase5_uid170_fpPowrTest_q or zeroCase6_uid169_fpPowrTest_q;

    -- concExc_uid198_fpPowrTest(BITJOIN,197)@48
    concExc_uid198_fpPowrTest_q <= excRNaN_uid194_fpPowrTest_q & excRInf_uid187_fpPowrTest_q & excRZero_uid177_fpPowrTest_q;

    -- excREnc_uid199_fpPowrTest(LOOKUP,198)@48
    excREnc_uid199_fpPowrTest_combproc: PROCESS (concExc_uid198_fpPowrTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid198_fpPowrTest_q) IS
            WHEN "000" => excREnc_uid199_fpPowrTest_q <= "01";
            WHEN "001" => excREnc_uid199_fpPowrTest_q <= "00";
            WHEN "010" => excREnc_uid199_fpPowrTest_q <= "10";
            WHEN "011" => excREnc_uid199_fpPowrTest_q <= "00";
            WHEN "100" => excREnc_uid199_fpPowrTest_q <= "11";
            WHEN "101" => excREnc_uid199_fpPowrTest_q <= "00";
            WHEN "110" => excREnc_uid199_fpPowrTest_q <= "00";
            WHEN "111" => excREnc_uid199_fpPowrTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid199_fpPowrTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expRPostExc_uid207_fpPowrTest(MUX,206)@48
    expRPostExc_uid207_fpPowrTest_s <= excREnc_uid199_fpPowrTest_q;
    expRPostExc_uid207_fpPowrTest_combproc: PROCESS (expRPostExc_uid207_fpPowrTest_s, cstAllZWE_uid13_fpPowrTest_q, expRPostOne_uid197_fpPowrTest_q, cstAllOWE_uid11_fpPowrTest_q)
    BEGIN
        CASE (expRPostExc_uid207_fpPowrTest_s) IS
            WHEN "00" => expRPostExc_uid207_fpPowrTest_q <= cstAllZWE_uid13_fpPowrTest_q;
            WHEN "01" => expRPostExc_uid207_fpPowrTest_q <= expRPostOne_uid197_fpPowrTest_q;
            WHEN "10" => expRPostExc_uid207_fpPowrTest_q <= cstAllOWE_uid11_fpPowrTest_q;
            WHEN "11" => expRPostExc_uid207_fpPowrTest_q <= cstAllOWE_uid11_fpPowrTest_q;
            WHEN OTHERS => expRPostExc_uid207_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid200_fpPowrTest(CONSTANT,199)
    oneFracRPostExc2_uid200_fpPowrTest_q <= "00000000000000000000001";

    -- peORExp_uid148_fpPowrTest(BITSELECT,147)@46
    peORExp_uid148_fpPowrTest_in <= s3_uid481_invPolyEval_q(40 downto 0);
    peORExp_uid148_fpPowrTest_b <= peORExp_uid148_fpPowrTest_in(40 downto 17);

    -- fracR_uid152_fpPowrTest(BITSELECT,151)@46
    fracR_uid152_fpPowrTest_in <= peORExp_uid148_fpPowrTest_b(22 downto 0);
    fracR_uid152_fpPowrTest_b <= fracR_uid152_fpPowrTest_in(22 downto 0);

    -- redist43_fracR_uid152_fpPowrTest_b_1(DELAY,803)
    redist43_fracR_uid152_fpPowrTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracR_uid152_fpPowrTest_b, xout => redist43_fracR_uid152_fpPowrTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPostOne_uid196_fpPowrTest(MUX,195)@47 + 1
    fracRPostOne_uid196_fpPowrTest_s <= excROne_uid195_fpPowrTest_q;
    fracRPostOne_uid196_fpPowrTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostOne_uid196_fpPowrTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostOne_uid196_fpPowrTest_s) IS
                WHEN "0" => fracRPostOne_uid196_fpPowrTest_q <= redist43_fracR_uid152_fpPowrTest_b_1_q;
                WHEN "1" => fracRPostOne_uid196_fpPowrTest_q <= cstAllZWF_uid6_fpPowrTest_q;
                WHEN OTHERS => fracRPostOne_uid196_fpPowrTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid203_fpPowrTest(MUX,202)@48
    fracRPostExc_uid203_fpPowrTest_s <= excREnc_uid199_fpPowrTest_q;
    fracRPostExc_uid203_fpPowrTest_combproc: PROCESS (fracRPostExc_uid203_fpPowrTest_s, cstAllZWF_uid6_fpPowrTest_q, fracRPostOne_uid196_fpPowrTest_q, oneFracRPostExc2_uid200_fpPowrTest_q)
    BEGIN
        CASE (fracRPostExc_uid203_fpPowrTest_s) IS
            WHEN "00" => fracRPostExc_uid203_fpPowrTest_q <= cstAllZWF_uid6_fpPowrTest_q;
            WHEN "01" => fracRPostExc_uid203_fpPowrTest_q <= fracRPostOne_uid196_fpPowrTest_q;
            WHEN "10" => fracRPostExc_uid203_fpPowrTest_q <= cstAllZWF_uid6_fpPowrTest_q;
            WHEN "11" => fracRPostExc_uid203_fpPowrTest_q <= oneFracRPostExc2_uid200_fpPowrTest_q;
            WHEN OTHERS => fracRPostExc_uid203_fpPowrTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RPowr_uid208_fpPowrTest(BITJOIN,207)@48
    RPowr_uid208_fpPowrTest_q <= GND_q & expRPostExc_uid207_fpPowrTest_q & fracRPostExc_uid203_fpPowrTest_q;

    -- xOut(GPOUT,4)@48
    q <= RPowr_uid208_fpPowrTest_q;

END normal;
