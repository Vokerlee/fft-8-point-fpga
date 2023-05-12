// Butterfly_2 is calculator of (in_1 +- in_2) / sqrt(2)

module butterfly_2 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_1, in_2,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_real, out_image
);
    wire [(2 ** N) - 1 : 0] s1, s2, s3, s4, s5, s6;

    adder #(.N(N)) a1(1'b0, in_1, in_2, s1); // s1 = in_1 - in_2
    adder #(.N(N)) a2(1'b1, in_1, in_2, s2); // s2 = in_1 + in_2

    // Synchronize the operations
    reg_n #(.N(N)) rr_1 (s1, clk, rst, s3); // s3 = s1
    reg_n #(.N(N)) rr_2 (s2, clk, rst, s4); // s4 = s2

    div_sqrt_2 #(.N(N)) div_1(s3, clk, rst, s5); // s5 = (in_1 - in_2) * 0.7071
    div_sqrt_2 #(.N(N)) div_2(s4, clk, rst, s6); // s6 = (in_1 + in_2) * 0.7071

    reg_n #(.N(N)) rr_3(s5, clk, rst, out_real);
    reg_n #(.N(N)) rr_4(s6, clk, rst, out_image);

endmodule
