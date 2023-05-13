// Divide signed number by sqrt(2) via arithmetic shifts

module div_sqrt_2 #(parameter N = 3)
(
    input  [(2 ** N) - 1 : 0] in,
    output [(2 ** N) - 1 : 0] out
);
    wire [(2 ** N) - 1 : 0] r1, r3, r4, r6, r8, // arithmetic shifts
                            s1, s2; // temp values

    sar_n #(.N(N), .SHFT(1)) sar_1(.in(in), .out(r1));
    sar_n #(.N(N), .SHFT(3)) sar_3(.in(in), .out(r3));
    sar_n #(.N(N), .SHFT(4)) sar_4(.in(in), .out(r4));
    sar_n #(.N(N), .SHFT(6)) sar_6(.in(in), .out(r6));
    // sar_n #(.N(N), .SHFT(8)) sar_8(.in(in), .out(r8)); // for N = 4

    adder #(.N(N)) add_1(1'b1, r1, r3, s1); // s1 = sar_1 + sar_3
    adder #(.N(N)) add_2(1'b1, r4, r6, s2); // s2 = sar_4 + sar_6
    adder #(.N(N)) add_3(1'b1, s1, s2, out);

endmodule
