// Shift register block

module shift_reg #(parameter N = 3)
(
    input [(2 ** N) - 1 : 0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,
    input clk, rst,
    output reg [(2 ** N) - 1 : 0] q
);
    reg [2 : 0] counter;

    initial begin
        counter = 3'b000;
        q = in_0;
    end

    always @(posedge clk)
    begin
        if (rst)
        begin
            counter <= 3'b000;
            q <= in_0;
        end
        else
        begin
            counter <= counter + 1;
            case (counter)
                3'b000  : q <= in_0;
                3'b001  : q <= in_1;
                3'b010  : q <= in_2;
                3'b011  : q <= in_3;
                3'b100  : q <= in_4;
                3'b101  : q <= in_5;
                3'b110  : q <= in_6;
                3'b111  : q <= in_7;
                default : q <= in_0;
            endcase
        end
    end

endmodule
