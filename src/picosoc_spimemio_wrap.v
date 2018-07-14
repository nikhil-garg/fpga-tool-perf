/*
 * Generated by harness_gen.py
 * From: picosoc_spimemio_def.v
 */
module top(input wire clk, input wire stb, input wire di, output wire do);
    localparam integer DIN_N = 66;
    localparam integer DOUT_N = 75;

    reg [DIN_N-1:0] din;
    wire [DOUT_N-1:0] dout;

    reg [DIN_N-1:0] din_shr;
    reg [DOUT_N-1:0] dout_shr;

    always @(posedge clk) begin
        din_shr <= {din_shr, di};
        dout_shr <= {dout_shr, din_shr[DIN_N-1]};
        if (stb) begin
            din <= din_shr;
            dout_shr <= dout;
        end
    end

    assign do = dout_shr[DOUT_N-1];
    spimemio dut(
            .clk(clk),
            .resetn(din[0]),
            .valid(din[1]),
            .ready(dout[0]),
            .addr(din[25:2]),
            .rdata(dout[32:1]),
            .flash_csb(dout[33]),
            .flash_clk(dout[34]),
            .flash_io0_oe(dout[35]),
            .flash_io1_oe(dout[36]),
            .flash_io2_oe(dout[37]),
            .flash_io3_oe(dout[38]),
            .flash_io0_do(dout[39]),
            .flash_io1_do(dout[40]),
            .flash_io2_do(dout[41]),
            .flash_io3_do(dout[42]),
            .flash_io0_di(din[26]),
            .flash_io1_di(din[27]),
            .flash_io2_di(din[28]),
            .flash_io3_di(din[29]),
            .cfgreg_we(din[33:30]),
            .cfgreg_di(din[65:34]),
            .cfgreg_do(dout[74:43])
            );
endmodule
