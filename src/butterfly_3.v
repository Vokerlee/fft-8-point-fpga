module butterfly_3 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_1, in_2,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_real, out_image
);
    wire [(2 ** N) - 1 : 0] in_2_neg;

    parameter zero_real = 16'b0000000000000000;

    reg_n rr_1 (in_1, clk, rst, out_real); // out_real = in_1
    adder sub1(1'b0, zero_real, in_2, in_2_neg); // in_2_neg = -in_2
    reg_n rr_3 (in_2_neg, clk, rst, out_image); // out_image = in_2_neg = -in_2

endmodule
