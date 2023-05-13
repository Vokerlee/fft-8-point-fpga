module butterfly_1 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_1, in_2,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_1, out_2 // output numbers are real
);
    adder #(.N(N)) add(1'b1, in_1, in_2, out_1); // out_1 = in_1 + in_2
    adder #(.N(N)) sub(1'b0, in_1, in_2, out_2); // out_2 = in_1 - in_2

endmodule
