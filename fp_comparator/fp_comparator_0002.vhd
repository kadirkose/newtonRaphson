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

-- VHDL created from fp_comparator_0002
-- VHDL created on Sun Mar  6 20:43:12 2022


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

entity fp_comparator_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end fp_comparator_0002;

architecture normal of fp_comparator_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid8_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid9_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid10_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid11_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid23_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid24_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid25_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid30_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid34_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid34_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid39_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid40_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXPS_uid41_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXPS_uid41_fpCompareTest_qi : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXPS_uid41_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_qi : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expFracX_uid43_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid45_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTEefy_uid49_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTEefy_uid49_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTEefy_uid49_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTEefy_uid49_fpCompareTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTEefy_uid50_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTEefy_uid50_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTEefy_uid50_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTEefy_uid50_fpCompareTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroInputs_uid51_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroInputs_uid51_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid52_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid53_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid54_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid55_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid56_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sxLTsy_uid56_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid57_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid58_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid59_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid59_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid60_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid60_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid61_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid62_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid62_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_signY_uid53_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_signX_uid52_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_zeroInputs_uid51_fpCompareTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_oneIsNaN_uid34_fpCompareTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_exp_y_uid23_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_exp_x_uid9_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllZWE_uid8_fpCompareTest(CONSTANT,7)
    cstAllZWE_uid8_fpCompareTest_q <= "00000000";

    -- exp_y_uid23_fpCompareTest(BITSELECT,22)@0
    exp_y_uid23_fpCompareTest_b <= b(30 downto 23);

    -- excZ_y_uid25_fpCompareTest(LOGICAL,24)@0
    excZ_y_uid25_fpCompareTest_q <= "1" WHEN exp_y_uid23_fpCompareTest_b = cstAllZWE_uid8_fpCompareTest_q ELSE "0";

    -- exp_x_uid9_fpCompareTest(BITSELECT,8)@0
    exp_x_uid9_fpCompareTest_b <= a(30 downto 23);

    -- excZ_x_uid11_fpCompareTest(LOGICAL,10)@0
    excZ_x_uid11_fpCompareTest_q <= "1" WHEN exp_x_uid9_fpCompareTest_b = cstAllZWE_uid8_fpCompareTest_q ELSE "0";

    -- zeroInputs_uid51_fpCompareTest(LOGICAL,50)@0 + 1
    zeroInputs_uid51_fpCompareTest_qi <= excZ_x_uid11_fpCompareTest_q and excZ_y_uid25_fpCompareTest_q;
    zeroInputs_uid51_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => zeroInputs_uid51_fpCompareTest_qi, xout => zeroInputs_uid51_fpCompareTest_q, clk => clk, aclr => areset );

    -- redist2_zeroInputs_uid51_fpCompareTest_q_2(DELAY,65)
    redist2_zeroInputs_uid51_fpCompareTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => zeroInputs_uid51_fpCompareTest_q, xout => redist2_zeroInputs_uid51_fpCompareTest_q_2_q, clk => clk, aclr => areset );

    -- two_uid54_fpCompareTest(CONSTANT,53)
    two_uid54_fpCompareTest_q <= "10";

    -- signX_uid52_fpCompareTest(BITSELECT,51)@0
    signX_uid52_fpCompareTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist1_signX_uid52_fpCompareTest_b_1(DELAY,64)
    redist1_signX_uid52_fpCompareTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid52_fpCompareTest_b, xout => redist1_signX_uid52_fpCompareTest_b_1_q, clk => clk, aclr => areset );

    -- signY_uid53_fpCompareTest(BITSELECT,52)@0
    signY_uid53_fpCompareTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- redist0_signY_uid53_fpCompareTest_b_1(DELAY,63)
    redist0_signY_uid53_fpCompareTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid53_fpCompareTest_b, xout => redist0_signY_uid53_fpCompareTest_b_1_q, clk => clk, aclr => areset );

    -- concSXSY_uid55_fpCompareTest(BITJOIN,54)@1
    concSXSY_uid55_fpCompareTest_q <= redist1_signX_uid52_fpCompareTest_b_1_q & redist0_signY_uid53_fpCompareTest_b_1_q;

    -- sxLTsy_uid56_fpCompareTest(LOGICAL,55)@1 + 1
    sxLTsy_uid56_fpCompareTest_qi <= "1" WHEN concSXSY_uid55_fpCompareTest_q = two_uid54_fpCompareTest_q ELSE "0";
    sxLTsy_uid56_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sxLTsy_uid56_fpCompareTest_qi, xout => sxLTsy_uid56_fpCompareTest_q, clk => clk, aclr => areset );

    -- redist4_exp_y_uid23_fpCompareTest_b_1(DELAY,67)
    redist4_exp_y_uid23_fpCompareTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_y_uid23_fpCompareTest_b, xout => redist4_exp_y_uid23_fpCompareTest_b_1_q, clk => clk, aclr => areset );

    -- yNotZero_uid40_fpCompareTest(LOGICAL,39)@0
    yNotZero_uid40_fpCompareTest_q <= not (excZ_y_uid25_fpCompareTest_q);

    -- frac_y_uid24_fpCompareTest(BITSELECT,23)@0
    frac_y_uid24_fpCompareTest_b <= b(22 downto 0);

    -- fracYPS_uid42_fpCompareTest(LOGICAL,41)@0 + 1
    fracYPS_uid42_fpCompareTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => yNotZero_uid40_fpCompareTest_q(0)) & yNotZero_uid40_fpCompareTest_q));
    fracYPS_uid42_fpCompareTest_qi <= frac_y_uid24_fpCompareTest_b and fracYPS_uid42_fpCompareTest_b;
    fracYPS_uid42_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYPS_uid42_fpCompareTest_qi, xout => fracYPS_uid42_fpCompareTest_q, clk => clk, aclr => areset );

    -- expFracY_uid45_fpCompareTest(BITJOIN,44)@1
    expFracY_uid45_fpCompareTest_q <= redist4_exp_y_uid23_fpCompareTest_b_1_q & fracYPS_uid42_fpCompareTest_q;

    -- redist5_exp_x_uid9_fpCompareTest_b_1(DELAY,68)
    redist5_exp_x_uid9_fpCompareTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_x_uid9_fpCompareTest_b, xout => redist5_exp_x_uid9_fpCompareTest_b_1_q, clk => clk, aclr => areset );

    -- xNotZero_uid39_fpCompareTest(LOGICAL,38)@0
    xNotZero_uid39_fpCompareTest_q <= not (excZ_x_uid11_fpCompareTest_q);

    -- frac_x_uid10_fpCompareTest(BITSELECT,9)@0
    frac_x_uid10_fpCompareTest_b <= a(22 downto 0);

    -- fracXPS_uid41_fpCompareTest(LOGICAL,40)@0 + 1
    fracXPS_uid41_fpCompareTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => xNotZero_uid39_fpCompareTest_q(0)) & xNotZero_uid39_fpCompareTest_q));
    fracXPS_uid41_fpCompareTest_qi <= frac_x_uid10_fpCompareTest_b and fracXPS_uid41_fpCompareTest_b;
    fracXPS_uid41_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXPS_uid41_fpCompareTest_qi, xout => fracXPS_uid41_fpCompareTest_q, clk => clk, aclr => areset );

    -- expFracX_uid43_fpCompareTest(BITJOIN,42)@1
    expFracX_uid43_fpCompareTest_q <= redist5_exp_x_uid9_fpCompareTest_b_1_q & fracXPS_uid41_fpCompareTest_q;

    -- efxGTEefy_uid49_fpCompareTest(COMPARE,48)@1
    efxGTEefy_uid49_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxGTEefy_uid49_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareTest_q);
    efxGTEefy_uid49_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTEefy_uid49_fpCompareTest_a) - UNSIGNED(efxGTEefy_uid49_fpCompareTest_b));
    efxGTEefy_uid49_fpCompareTest_n(0) <= not (efxGTEefy_uid49_fpCompareTest_o(32));

    -- efxLTEefy_uid50_fpCompareTest(COMPARE,49)@1
    efxLTEefy_uid50_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareTest_q);
    efxLTEefy_uid50_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxLTEefy_uid50_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTEefy_uid50_fpCompareTest_a) - UNSIGNED(efxLTEefy_uid50_fpCompareTest_b));
    efxLTEefy_uid50_fpCompareTest_n(0) <= not (efxLTEefy_uid50_fpCompareTest_o(32));

    -- expFracCompMux_uid59_fpCompareTest(MUX,58)@1
    expFracCompMux_uid59_fpCompareTest_s <= redist1_signX_uid52_fpCompareTest_b_1_q;
    expFracCompMux_uid59_fpCompareTest_combproc: PROCESS (expFracCompMux_uid59_fpCompareTest_s, efxLTEefy_uid50_fpCompareTest_n, efxGTEefy_uid49_fpCompareTest_n)
    BEGIN
        CASE (expFracCompMux_uid59_fpCompareTest_s) IS
            WHEN "0" => expFracCompMux_uid59_fpCompareTest_q <= efxLTEefy_uid50_fpCompareTest_n;
            WHEN "1" => expFracCompMux_uid59_fpCompareTest_q <= efxGTEefy_uid49_fpCompareTest_n;
            WHEN OTHERS => expFracCompMux_uid59_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid57_fpCompareTest(LOGICAL,56)@1
    xorSigns_uid57_fpCompareTest_q <= redist1_signX_uid52_fpCompareTest_b_1_q xor redist0_signY_uid53_fpCompareTest_b_1_q;

    -- sxEQsy_uid58_fpCompareTest(LOGICAL,57)@1
    sxEQsy_uid58_fpCompareTest_q <= not (xorSigns_uid57_fpCompareTest_q);

    -- sxEQsyExpFracCompMux_uid60_fpCompareTest(LOGICAL,59)@1 + 1
    sxEQsyExpFracCompMux_uid60_fpCompareTest_qi <= sxEQsy_uid58_fpCompareTest_q and expFracCompMux_uid59_fpCompareTest_q;
    sxEQsyExpFracCompMux_uid60_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sxEQsyExpFracCompMux_uid60_fpCompareTest_qi, xout => sxEQsyExpFracCompMux_uid60_fpCompareTest_q, clk => clk, aclr => areset );

    -- r_uid61_fpCompareTest(LOGICAL,60)@2
    r_uid61_fpCompareTest_q <= sxEQsyExpFracCompMux_uid60_fpCompareTest_q or sxLTsy_uid56_fpCompareTest_q or redist2_zeroInputs_uid51_fpCompareTest_q_2_q;

    -- cstZeroWF_uid7_fpCompareTest(CONSTANT,6)
    cstZeroWF_uid7_fpCompareTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid27_fpCompareTest(LOGICAL,26)@0
    fracXIsZero_uid27_fpCompareTest_q <= "1" WHEN cstZeroWF_uid7_fpCompareTest_q = frac_y_uid24_fpCompareTest_b ELSE "0";

    -- fracXIsNotZero_uid28_fpCompareTest(LOGICAL,27)@0
    fracXIsNotZero_uid28_fpCompareTest_q <= not (fracXIsZero_uid27_fpCompareTest_q);

    -- cstAllOWE_uid6_fpCompareTest(CONSTANT,5)
    cstAllOWE_uid6_fpCompareTest_q <= "11111111";

    -- expXIsMax_uid26_fpCompareTest(LOGICAL,25)@0
    expXIsMax_uid26_fpCompareTest_q <= "1" WHEN exp_y_uid23_fpCompareTest_b = cstAllOWE_uid6_fpCompareTest_q ELSE "0";

    -- excN_y_uid30_fpCompareTest(LOGICAL,29)@0
    excN_y_uid30_fpCompareTest_q <= expXIsMax_uid26_fpCompareTest_q and fracXIsNotZero_uid28_fpCompareTest_q;

    -- fracXIsZero_uid13_fpCompareTest(LOGICAL,12)@0
    fracXIsZero_uid13_fpCompareTest_q <= "1" WHEN cstZeroWF_uid7_fpCompareTest_q = frac_x_uid10_fpCompareTest_b ELSE "0";

    -- fracXIsNotZero_uid14_fpCompareTest(LOGICAL,13)@0
    fracXIsNotZero_uid14_fpCompareTest_q <= not (fracXIsZero_uid13_fpCompareTest_q);

    -- expXIsMax_uid12_fpCompareTest(LOGICAL,11)@0
    expXIsMax_uid12_fpCompareTest_q <= "1" WHEN exp_x_uid9_fpCompareTest_b = cstAllOWE_uid6_fpCompareTest_q ELSE "0";

    -- excN_x_uid16_fpCompareTest(LOGICAL,15)@0
    excN_x_uid16_fpCompareTest_q <= expXIsMax_uid12_fpCompareTest_q and fracXIsNotZero_uid14_fpCompareTest_q;

    -- oneIsNaN_uid34_fpCompareTest(LOGICAL,33)@0 + 1
    oneIsNaN_uid34_fpCompareTest_qi <= excN_x_uid16_fpCompareTest_q or excN_y_uid30_fpCompareTest_q;
    oneIsNaN_uid34_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsNaN_uid34_fpCompareTest_qi, xout => oneIsNaN_uid34_fpCompareTest_q, clk => clk, aclr => areset );

    -- redist3_oneIsNaN_uid34_fpCompareTest_q_2(DELAY,66)
    redist3_oneIsNaN_uid34_fpCompareTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsNaN_uid34_fpCompareTest_q, xout => redist3_oneIsNaN_uid34_fpCompareTest_q_2_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostExc_uid62_fpCompareTest(MUX,61)@2
    rPostExc_uid62_fpCompareTest_s <= redist3_oneIsNaN_uid34_fpCompareTest_q_2_q;
    rPostExc_uid62_fpCompareTest_combproc: PROCESS (rPostExc_uid62_fpCompareTest_s, r_uid61_fpCompareTest_q, GND_q)
    BEGIN
        CASE (rPostExc_uid62_fpCompareTest_s) IS
            WHEN "0" => rPostExc_uid62_fpCompareTest_q <= r_uid61_fpCompareTest_q;
            WHEN "1" => rPostExc_uid62_fpCompareTest_q <= GND_q;
            WHEN OTHERS => rPostExc_uid62_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@2
    q <= rPostExc_uid62_fpCompareTest_q;

END normal;
