module adder #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] a, b,
    input add_mode,
    output reg[(2 ** N) - 1 : 0] result
);
    always @(*)
    begin
        if (add_mode)
        begin
            result = a + b;
        end
        else
        begin
            result = a - b;
        end
    end

endmodule
