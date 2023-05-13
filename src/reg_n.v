// Simple register made of D-Flip-Flops

module reg_n #(parameter N = 3)
(
    input [(2 ** N) - 1 : 0] d,
    input clk, rst,
    output [(2 ** N) - 1 : 0] q
);

    dff dff_reg[(2 ** N) - 1 : 0] (d, clk, rst, q);

endmodule
