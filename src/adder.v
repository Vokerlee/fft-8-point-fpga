// Asynchronous adder of 2 numbers

module adder #(parameter N = 3)
(
    input add_mode,
    input [(2 ** N) - 1 : 0] in_1, in_2,
    output reg[(2 ** N) - 1 : 0] res
);
    always @(*)
    begin
        if (add_mode)
        begin
            res = in_1 + in_2;
        end
        else
        begin
            res = in_1 - in_2;
        end
    end

endmodule
