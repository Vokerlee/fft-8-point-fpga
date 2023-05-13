// Asynchronous adder of 2 numbers

module adder #(parameter N = 3)
(
    input add_mode,
    input [(2 ** N) - 1 : 0] summand_1, summand_2,
    output reg[(2 ** N) - 1 : 0] res
);
    always @(*)
    begin
        if (add_mode)
        begin
            res = summand_1 + summand_2;
        end
        else
        begin
            res = summand_1 - summand_2;
        end
    end

endmodule
