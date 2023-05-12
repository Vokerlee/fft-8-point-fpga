`include "dff.v" #(parameter N = 4)

module reg
(
    input [(2 ** N) - 1 : 0] d,
    input rst, clk,
    output [(2 ** N) - 1 : 0] q
);
    genvar i;
    generate
        for (i = 0; i < 2 ** N; i = i + 1)
        begin : dff
            custom i_custom(
                .rst(rst),
                .clk(clk),
                .input(d[i]),
                .output(q[i])
                );
        end
    endgenerate

endmodule
