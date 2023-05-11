`timescale 1 ns / 100 ps

module test_dff();

    reg d = 1'b1;
    reg e = 1'b0;
    reg rst = 1'b0;

    always begin
        #1.32 d = ~d;
    end

    always begin
        #2 e = ~e; // clk
    end

    wire q;

    dff dff_test(.d(d), .clk(e), .rst(rst), .q(q));

    initial begin
        $dumpvars;
        $display("Test started...");
        #100 $finish;
    end

endmodule