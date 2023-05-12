`timescale 1 ns / 100 ps

module test_reg_n  #(parameter N = 4);

    reg [15 : 0] d = 16'b1011011000011100;

    reg clk = 1'b0;
    reg rst = 1'b0;

    always begin
        #1.32 d = d >> 2;
    end

    always begin
        #2 clk = ~clk; // clk
    end

    wire [15 : 0] q;

    reg_n #(.N(N)) reg_n_test(.d(d), .clk(clk), .rst(rst), .q(q));

    initial begin
        $dumpfile("reg_n_tb.vcd");
        $dumpvars;
        #100 $finish;
    end

endmodule
