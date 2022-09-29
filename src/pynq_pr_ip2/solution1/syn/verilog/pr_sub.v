// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pr_sub_pr_sub,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z100-ffg900-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.896000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=35,HLS_SYN_LUT=69,HLS_VERSION=2020_2}" *)

module pr_sub (
        ap_clk,
        ap_rst_n,
        stream_in_TDATA,
        stream_in_TVALID,
        stream_in_TREADY,
        stream_in_TKEEP,
        stream_in_TLAST,
        stream_out_TDATA,
        stream_out_TVALID,
        stream_out_TREADY,
        stream_out_TKEEP,
        stream_out_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input  [31:0] stream_in_TDATA;
input   stream_in_TVALID;
output   stream_in_TREADY;
input  [3:0] stream_in_TKEEP;
input  [0:0] stream_in_TLAST;
output  [31:0] stream_out_TDATA;
output   stream_out_TVALID;
input   stream_out_TREADY;
output  [3:0] stream_out_TKEEP;
output  [0:0] stream_out_TLAST;

 reg    ap_rst_n_inv;
reg    stream_in_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
reg    stream_out_TDATA_blk_n;
wire    ap_CS_fsm_state3;
reg   [31:0] empty_reg_79_0;
reg    ap_block_state2;
reg   [2:0] ap_NS_fsm;
wire    regslice_both_stream_out_V_data_V_U_apdone_blk;
reg    ap_block_state3;
wire    regslice_both_stream_in_V_data_V_U_apdone_blk;
wire   [31:0] stream_in_TDATA_int_regslice;
wire    stream_in_TVALID_int_regslice;
reg    stream_in_TREADY_int_regslice;
wire    regslice_both_stream_in_V_data_V_U_ack_in;
wire    regslice_both_stream_in_V_keep_V_U_apdone_blk;
wire   [3:0] stream_in_TKEEP_int_regslice;
wire    regslice_both_stream_in_V_keep_V_U_vld_out;
wire    regslice_both_stream_in_V_keep_V_U_ack_in;
wire    regslice_both_stream_in_V_last_V_U_apdone_blk;
wire   [0:0] stream_in_TLAST_int_regslice;
wire    regslice_both_stream_in_V_last_V_U_vld_out;
wire    regslice_both_stream_in_V_last_V_U_ack_in;
wire   [31:0] stream_out_TDATA_int_regslice;
reg    stream_out_TVALID_int_regslice;
wire    stream_out_TREADY_int_regslice;
wire    regslice_both_stream_out_V_data_V_U_vld_out;
wire    regslice_both_stream_out_V_keep_V_U_apdone_blk;
wire    regslice_both_stream_out_V_keep_V_U_ack_in_dummy;
wire    regslice_both_stream_out_V_keep_V_U_vld_out;
wire    regslice_both_stream_out_V_last_V_U_apdone_blk;
wire    regslice_both_stream_out_V_last_V_U_ack_in_dummy;
wire    regslice_both_stream_out_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
end

pr_sub_regslice_both #(
    .DataWidth( 32 ))
regslice_both_stream_in_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(stream_in_TDATA),
    .vld_in(stream_in_TVALID),
    .ack_in(regslice_both_stream_in_V_data_V_U_ack_in),
    .data_out(stream_in_TDATA_int_regslice),
    .vld_out(stream_in_TVALID_int_regslice),
    .ack_out(stream_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_stream_in_V_data_V_U_apdone_blk)
);

pr_sub_regslice_both #(
    .DataWidth( 4 ))
regslice_both_stream_in_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(stream_in_TKEEP),
    .vld_in(stream_in_TVALID),
    .ack_in(regslice_both_stream_in_V_keep_V_U_ack_in),
    .data_out(stream_in_TKEEP_int_regslice),
    .vld_out(regslice_both_stream_in_V_keep_V_U_vld_out),
    .ack_out(stream_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_stream_in_V_keep_V_U_apdone_blk)
);

pr_sub_regslice_both #(
    .DataWidth( 1 ))
regslice_both_stream_in_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(stream_in_TLAST),
    .vld_in(stream_in_TVALID),
    .ack_in(regslice_both_stream_in_V_last_V_U_ack_in),
    .data_out(stream_in_TLAST_int_regslice),
    .vld_out(regslice_both_stream_in_V_last_V_U_vld_out),
    .ack_out(stream_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_stream_in_V_last_V_U_apdone_blk)
);

pr_sub_regslice_both #(
    .DataWidth( 32 ))
regslice_both_stream_out_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(stream_out_TDATA_int_regslice),
    .vld_in(stream_out_TVALID_int_regslice),
    .ack_in(stream_out_TREADY_int_regslice),
    .data_out(stream_out_TDATA),
    .vld_out(regslice_both_stream_out_V_data_V_U_vld_out),
    .ack_out(stream_out_TREADY),
    .apdone_blk(regslice_both_stream_out_V_data_V_U_apdone_blk)
);

pr_sub_regslice_both #(
    .DataWidth( 4 ))
regslice_both_stream_out_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(4'd15),
    .vld_in(stream_out_TVALID_int_regslice),
    .ack_in(regslice_both_stream_out_V_keep_V_U_ack_in_dummy),
    .data_out(stream_out_TKEEP),
    .vld_out(regslice_both_stream_out_V_keep_V_U_vld_out),
    .ack_out(stream_out_TREADY),
    .apdone_blk(regslice_both_stream_out_V_keep_V_U_apdone_blk)
);

pr_sub_regslice_both #(
    .DataWidth( 1 ))
regslice_both_stream_out_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(1'd1),
    .vld_in(stream_out_TVALID_int_regslice),
    .ack_in(regslice_both_stream_out_V_last_V_U_ack_in_dummy),
    .data_out(stream_out_TLAST),
    .vld_out(regslice_both_stream_out_V_last_V_U_vld_out),
    .ack_out(stream_out_TREADY),
    .apdone_blk(regslice_both_stream_out_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_79_0 <= stream_in_TDATA_int_regslice;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state1))) begin
        stream_in_TDATA_blk_n = stream_in_TVALID_int_regslice;
    end else begin
        stream_in_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((stream_in_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | (~((stream_in_TVALID_int_regslice == 1'b0) | (stream_out_TREADY_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        stream_in_TREADY_int_regslice = 1'b1;
    end else begin
        stream_in_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        stream_out_TDATA_blk_n = stream_out_TREADY_int_regslice;
    end else begin
        stream_out_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((stream_in_TVALID_int_regslice == 1'b0) | (stream_out_TREADY_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        stream_out_TVALID_int_regslice = 1'b1;
    end else begin
        stream_out_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((stream_in_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((stream_in_TVALID_int_regslice == 1'b0) | (stream_out_TREADY_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((regslice_both_stream_out_V_data_V_U_apdone_blk == 1'b1) | (stream_out_TREADY_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2 = ((stream_in_TVALID_int_regslice == 1'b0) | (stream_out_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3 = ((regslice_both_stream_out_V_data_V_U_apdone_blk == 1'b1) | (stream_out_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign stream_in_TREADY = regslice_both_stream_in_V_data_V_U_ack_in;

assign stream_out_TDATA_int_regslice = (empty_reg_79_0 - stream_in_TDATA_int_regslice);

assign stream_out_TVALID = regslice_both_stream_out_V_data_V_U_vld_out;

endmodule //pr_sub
