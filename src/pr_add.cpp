#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>

typedef ap_int<32> AXI_CAL;

typedef qdma_axis<32,0,0,0> AXI_DMA_IF;

void pr_add(
		hls::stream<AXI_DMA_IF> &stream_in,
		hls::stream<AXI_DMA_IF> &stream_out
)
{

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=stream_in
#pragma HLS INTERFACE axis port=stream_out

	AXI_CAL add_a, add_b;
	AXI_DMA_IF Inbuf;
	AXI_DMA_IF Outbuf;

	Inbuf = stream_in.read();
	add_a = Inbuf.data;
	Inbuf = stream_in.read();
	add_b = Inbuf.data;

	Outbuf.data = add_a + add_b;
	Outbuf.last = 1;
	Outbuf.keep = -1;
	stream_out.write(Outbuf);
}
