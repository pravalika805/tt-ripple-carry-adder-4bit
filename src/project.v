module tt_um_rca4 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire clk,
    input  wire rst_n
);

    wire [3:0] A = ui_in[3:0];
    wire [3:0] B = ui_in[7:4];

    wire c1, c2, c3, c4;

    assign uo_out[0] = A[0] ^ B[0];
    assign c1 = A[0] & B[0];

    assign uo_out[1] = A[1] ^ B[1] ^ c1;
    assign c2 = (A[1] & B[1]) | (B[1] & c1) | (A[1] & c1);

    assign uo_out[2] = A[2] ^ B[2] ^ c2;
    assign c3 = (A[2] & B[2]) | (B[2] & c2) | (A[2] & c2);

    assign uo_out[3] = A[3] ^ B[3] ^ c3;
    assign c4 = (A[3] & B[3]) | (B[3] & c3) | (A[3] & c3);

    assign uo_out[4] = c4;
    assign uo_out[7:5] = 3'b000;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
