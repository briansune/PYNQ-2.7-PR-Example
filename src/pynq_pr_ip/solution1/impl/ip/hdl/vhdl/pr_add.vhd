-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pr_add is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    stream_in_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    stream_in_TVALID : IN STD_LOGIC;
    stream_in_TREADY : OUT STD_LOGIC;
    stream_in_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    stream_in_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    stream_out_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    stream_out_TVALID : OUT STD_LOGIC;
    stream_out_TREADY : IN STD_LOGIC;
    stream_out_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    stream_out_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of pr_add is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "pr_add_pr_add,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z100-ffg900-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.896000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=35,HLS_SYN_LUT=69,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal stream_in_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal stream_out_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal empty_reg_79_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state2 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal regslice_both_stream_out_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3 : BOOLEAN;
    signal regslice_both_stream_in_V_data_V_U_apdone_blk : STD_LOGIC;
    signal stream_in_TDATA_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal stream_in_TVALID_int_regslice : STD_LOGIC;
    signal stream_in_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_stream_in_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_stream_in_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal stream_in_TKEEP_int_regslice : STD_LOGIC_VECTOR (3 downto 0);
    signal regslice_both_stream_in_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_stream_in_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_stream_in_V_last_V_U_apdone_blk : STD_LOGIC;
    signal stream_in_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_stream_in_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_stream_in_V_last_V_U_ack_in : STD_LOGIC;
    signal stream_out_TDATA_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal stream_out_TVALID_int_regslice : STD_LOGIC;
    signal stream_out_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_stream_out_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_stream_out_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_stream_out_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_stream_out_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_stream_out_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_stream_out_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_stream_out_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pr_add_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_stream_in_V_data_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => stream_in_TDATA,
        vld_in => stream_in_TVALID,
        ack_in => regslice_both_stream_in_V_data_V_U_ack_in,
        data_out => stream_in_TDATA_int_regslice,
        vld_out => stream_in_TVALID_int_regslice,
        ack_out => stream_in_TREADY_int_regslice,
        apdone_blk => regslice_both_stream_in_V_data_V_U_apdone_blk);

    regslice_both_stream_in_V_keep_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => stream_in_TKEEP,
        vld_in => stream_in_TVALID,
        ack_in => regslice_both_stream_in_V_keep_V_U_ack_in,
        data_out => stream_in_TKEEP_int_regslice,
        vld_out => regslice_both_stream_in_V_keep_V_U_vld_out,
        ack_out => stream_in_TREADY_int_regslice,
        apdone_blk => regslice_both_stream_in_V_keep_V_U_apdone_blk);

    regslice_both_stream_in_V_last_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => stream_in_TLAST,
        vld_in => stream_in_TVALID,
        ack_in => regslice_both_stream_in_V_last_V_U_ack_in,
        data_out => stream_in_TLAST_int_regslice,
        vld_out => regslice_both_stream_in_V_last_V_U_vld_out,
        ack_out => stream_in_TREADY_int_regslice,
        apdone_blk => regslice_both_stream_in_V_last_V_U_apdone_blk);

    regslice_both_stream_out_V_data_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => stream_out_TDATA_int_regslice,
        vld_in => stream_out_TVALID_int_regslice,
        ack_in => stream_out_TREADY_int_regslice,
        data_out => stream_out_TDATA,
        vld_out => regslice_both_stream_out_V_data_V_U_vld_out,
        ack_out => stream_out_TREADY,
        apdone_blk => regslice_both_stream_out_V_data_V_U_apdone_blk);

    regslice_both_stream_out_V_keep_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => ap_const_lv4_F,
        vld_in => stream_out_TVALID_int_regslice,
        ack_in => regslice_both_stream_out_V_keep_V_U_ack_in_dummy,
        data_out => stream_out_TKEEP,
        vld_out => regslice_both_stream_out_V_keep_V_U_vld_out,
        ack_out => stream_out_TREADY,
        apdone_blk => regslice_both_stream_out_V_keep_V_U_apdone_blk);

    regslice_both_stream_out_V_last_V_U : component pr_add_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => ap_const_lv1_1,
        vld_in => stream_out_TVALID_int_regslice,
        ack_in => regslice_both_stream_out_V_last_V_U_ack_in_dummy,
        data_out => stream_out_TLAST,
        vld_out => regslice_both_stream_out_V_last_V_U_vld_out,
        ack_out => stream_out_TREADY,
        apdone_blk => regslice_both_stream_out_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                empty_reg_79_0 <= stream_in_TDATA_int_regslice;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, regslice_both_stream_out_V_data_V_U_apdone_blk, stream_in_TVALID_int_regslice, stream_out_TREADY_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((stream_in_TVALID_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((stream_in_TVALID_int_regslice = ap_const_logic_0) or (stream_out_TREADY_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((regslice_both_stream_out_V_data_V_U_apdone_blk = ap_const_logic_1) or (stream_out_TREADY_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state2_assign_proc : process(stream_in_TVALID_int_regslice, stream_out_TREADY_int_regslice)
    begin
                ap_block_state2 <= ((stream_in_TVALID_int_regslice = ap_const_logic_0) or (stream_out_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_assign_proc : process(regslice_both_stream_out_V_data_V_U_apdone_blk, stream_out_TREADY_int_regslice)
    begin
                ap_block_state3 <= ((regslice_both_stream_out_V_data_V_U_apdone_blk = ap_const_logic_1) or (stream_out_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    stream_in_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, stream_in_TVALID_int_regslice)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            stream_in_TDATA_blk_n <= stream_in_TVALID_int_regslice;
        else 
            stream_in_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    stream_in_TREADY <= regslice_both_stream_in_V_data_V_U_ack_in;

    stream_in_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, stream_in_TVALID_int_regslice, stream_out_TREADY_int_regslice)
    begin
        if ((((stream_in_TVALID_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not(((stream_in_TVALID_int_regslice = ap_const_logic_0) or (stream_out_TREADY_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            stream_in_TREADY_int_regslice <= ap_const_logic_1;
        else 
            stream_in_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    stream_out_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, stream_out_TREADY_int_regslice)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            stream_out_TDATA_blk_n <= stream_out_TREADY_int_regslice;
        else 
            stream_out_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    stream_out_TDATA_int_regslice <= std_logic_vector(unsigned(stream_in_TDATA_int_regslice) + unsigned(empty_reg_79_0));
    stream_out_TVALID <= regslice_both_stream_out_V_data_V_U_vld_out;

    stream_out_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_state2, stream_in_TVALID_int_regslice, stream_out_TREADY_int_regslice)
    begin
        if ((not(((stream_in_TVALID_int_regslice = ap_const_logic_0) or (stream_out_TREADY_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            stream_out_TVALID_int_regslice <= ap_const_logic_1;
        else 
            stream_out_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

end behav;
