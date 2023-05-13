module adder_sqrt_2 #(parameter N = 3)
(
    input  [(2 ** N) - 1 : 0] in_1,       in_2,
    output [(2 ** N) - 1 : 0] add_sqrt_2, sub_sqrt_2
);
    wire [(2 ** N) - 1 : 0] sub_res,        add_res,
                            tmp_sub_res,    tmp_add_res,
                            tmp_sub_sqrt_2, tmp_add_sqrt_2;

    adder #(.N(N)) sub(1'b0, in_1, in_2, sub_res);
    adder #(.N(N)) add(1'b1, in_1, in_2, add_res);

    div_sqrt_2 #(.N(N)) div_1(sub_res, sub_sqrt_2);
    div_sqrt_2 #(.N(N)) div_2(add_res, add_sqrt_2);

endmodule
