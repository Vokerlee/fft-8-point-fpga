module sar_n_tb #(parameter N = 3, parameter SHFT = 1);

    reg  [(2 ** N) - 1 : 0] a;
    wire [(2 ** N) - 1 : 0] b;

    sar_n #(.N(N), .SHFT(SHFT)) sar_n_test(.in(a), .out(b));

    integer i;
    initial begin
        $dumpfile("sar_n_tb.vcd");
        $dumpvars;

        a = 0;

        for (i = 0; i < 6; i = i + 1)
        begin
            a = $random % 30;
            #10;
            $display("a is %b, and then the result of %d bit right shift is %b", a, SHFT, b);
        end
    end

endmodule
