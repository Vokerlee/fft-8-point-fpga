module dff
(
    input d, rst, clk,
    output reg q
);
    initial begin
        q = 0;
    end

    always @(posedge clk)
    begin
        if (rst)
        begin
            q <= 1'b0;
        end
        else
        begin
            q <= d;
        end
    end

endmodule
