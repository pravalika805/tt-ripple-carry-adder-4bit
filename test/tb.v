`timescale 1ns/1ps

module tb_tt_um_rca4;

    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    reg clk = 0;

    integer file;

    tt_um_rca4 dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(0),
        .uio_out(),
        .uio_oe(),
        .clk(clk),
        .rst_n(1)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("test/tb.vcd");
        $dumpvars(0, tb_tt_um_rca4);

        file = $fopen("test/results.xml", "w");
        $fdisplay(file, "<testsuite>");

        // Test 1
        ui_in = 8'b00100011;
        #10;
        if (uo_out[3:0] == 4'b0101)
            $fdisplay(file, "<testcase name='test1'/>");
        else
            $fdisplay(file, "<failure/>");

        // Test 2
        ui_in = 8'b10000111;
        #10;
        if (uo_out[3:0] == 4'b1111)
            $fdisplay(file, "<testcase name='test2'/>");
        else
            $fdisplay(file, "<failure/>");

        $fdisplay(file, "</testsuite>");
        $fclose(file);

        $finish;
    end

endmodule
