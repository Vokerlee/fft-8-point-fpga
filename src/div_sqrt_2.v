// Divide signed number by sqrt(2) via arithmetic shifts

module div_sqrt_2 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out
);
    wire [(2 ** N) - 1 : 0] r1, r3, r4, r6, r8, // arithmetic shifts
                            s1, s2, s3, s4, s5, s6, s7, s8; // temp values

    sar_n #(.N(N), .SHFT(1)) sar_1(.in(in), .out(r1));
    sar_n #(.N(N), .SHFT(3)) sar_3(.in(in), .out(r3));
    sar_n #(.N(N), .SHFT(4)) sar_4(.in(in), .out(r4));
    sar_n #(.N(N), .SHFT(6)) sar_6(.in(in), .out(r6));
    sar_n #(.N(N), .SHFT(8)) sar_8(.in(in), .out(r8));

    // Now need to add r1 + r2 + r3 + r4 + r5

    adder #(.N(N)) add_1(1'b1, r1, r3, s1); // s1 = sar_1 + sar_3
    adder #(.N(N)) add_2(1'b1, r4, r6, s2); // s2 = sar_4 + sar_6

    // Synchronize the operations
    reg_n #(.N(N)) rr_1(s1, clk, rst, s3); // s1 = sar_1 + sar_3 = s3
    reg_n #(.N(N)) rr_2(s2, clk, rst, s4); // s2 = sar_4 + sar_6 = s4
    reg_n #(.N(N)) rr_3(r8, clk, rst, s5); // s5 = sar_8

    adder #(.N(N)) add_3(1'b1, s3, s4, s6); // s6 = sar_1 + sar_3 + sar_4 + sar_6
    reg_n #(.N(N)) rr_4(s6, clk, rst, s7); // s7 = s6
    reg_n #(.N(N)) rr_5(s5, clk, rst, s8); // s8 = s5

    adder #(.N(N)) add_4(1'b1, s7, s8, out); // out = sar_1 + sar_3 + sar_4 + sar_6 + sar_8

endmodule
