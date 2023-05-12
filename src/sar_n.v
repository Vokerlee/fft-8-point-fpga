// Shift arithmetic register (SAR)

module sar_n #(parameter N = 4, parameter SHFT = 1)
(
    input [(2 ** N) - 1 : 0] in,
    output reg[(2 ** N) - 1 : 0] out
);
    always @(*)
    begin
        if (in[(2 ** N) - 1] == 0)
        begin
            out[(2 ** N) - 1 : ((2 ** N) - 1 - SHFT)] <= 0;
        end
        else
        begin
            out[(2 ** N) - 1 : ((2 ** N) - 1 - SHFT)] <=~ (in[(2 ** N) - 1 : ((2 ** N) - 1 - SHFT)] & 0);
        end

        out[(2 ** N) - 1 - 1 - SHFT : 0] <= in[(2 ** N) - 1 : SHFT];
    end

endmodule
