// Signal generator for different regimes

module signal_gen #(parameter N = 3)
(
    input [2 : 0] regime,
    input clk,
    output reg [(2 ** N) - 1 : 0] out_0_r, out_1_r, out_2_r, out_3_r, out_4_r, out_5_r, out_6_r, out_7_r,
                                  out_0_i, out_1_i, out_2_i, out_3_i, out_4_i, out_5_i, out_6_i, out_7_i
);
    always @(posedge clk)
    begin
        case (regime)
            3'b000: begin
                out_0_r <= 8'h3f; out_1_r <= 8'h3f; out_2_r <= -8'h3f; out_3_r <= -8'h3f;
                out_4_r <= 8'h3f; out_5_r <= 8'h3f; out_6_r <= -8'h3f; out_7_r <= -8'h3f;
                out_0_i <= 8'h00; out_1_i <= 8'h00; out_2_i <=  8'h00; out_3_i <=  8'h00;
                out_4_i <= 8'h00; out_5_i <= 8'h00; out_6_i <=  8'h00; out_7_i <=  8'h00;
            end
            3'b001: begin
                out_0_r <= 8'h00; out_1_r <= 8'h00; out_2_r <=  8'h00; out_3_r <=  8'h00;
                out_4_r <= 8'h00; out_5_r <= 8'h00; out_6_r <=  8'h00; out_7_r <=  8'h00;
                out_0_i <= 8'h3f; out_1_i <= 8'h3f; out_2_i <= -8'h3f; out_3_i <= -8'h3f;
                out_4_i <= 8'h3f; out_5_i <= 8'h3f; out_6_i <= -8'h3f; out_7_i <= -8'h3f;
            end
            3'b010: begin
                out_0_r <= -8'h3f; out_1_r <= 8'h3f; out_2_r <= -8'h3f; out_3_r <= 8'h3f;
                out_4_r <= -8'h3f; out_5_r <= 8'h3f; out_6_r <= -8'h3f; out_7_r <= 8'h3f;
                out_0_i <=  8'h00; out_1_i <= 8'h00; out_2_i <=  8'h00; out_3_i <= 8'h00;
                out_4_i <=  8'h00; out_5_i <= 8'h00; out_6_i <=  8'h00; out_7_i <= 8'h00;
            end
            3'b011: begin
                out_0_r <=  8'h00; out_1_r <= 8'h00; out_2_r <=  8'h00; out_3_r <= 8'h00;
                out_4_r <=  8'h00; out_5_r <= 8'h00; out_6_r <=  8'h00; out_7_r <= 8'h00;
                out_0_i <= -8'h3f; out_1_i <= 8'h3f; out_2_i <= -8'h3f; out_3_i <= 8'h3f;
                out_4_i <= -8'h3f; out_5_i <= 8'h3f; out_6_i <= -8'h3f; out_7_i <= 8'h3f;
            end
            3'b100: begin
                out_0_r <= 8'h3f; out_1_r <= 8'h00; out_2_r <= -8'h3f; out_3_r <= 8'h00;
                out_4_r <= 8'h3f; out_5_r <= 8'h00; out_6_r <= -8'h3f; out_7_r <= 8'h00;
                out_0_i <= 8'h00; out_1_i <= 8'h00; out_2_i <=  8'h00; out_3_i <= 8'h00;
                out_4_i <= 8'h00; out_5_i <= 8'h00; out_6_i <=  8'h00; out_7_i <= 8'h00;
            end
            3'b101: begin
                out_0_r <= 8'h00; out_1_r <= 8'h00; out_2_r <=  8'h00; out_3_r <= 8'h00;
                out_4_r <= 8'h00; out_5_r <= 8'h00; out_6_r <=  8'h00; out_7_r <= 8'h00;
                out_0_i <= 8'h3f; out_1_i <= 8'h00; out_2_i <= -8'h3f; out_3_i <= 8'h00;
                out_4_i <= 8'h3f; out_5_i <= 8'h00; out_6_i <= -8'h3f; out_7_i <= 8'h00;
            end
            3'b110: begin
                out_0_r <= -8'h3f; out_1_r <= -8'h1f; out_2_r <=  8'h1f; out_3_r <=  8'h3f;
                out_4_r <=  8'h3f; out_5_r <=  8'h1f; out_6_r <= -8'h1f; out_7_r <= -8'h3f;
                out_0_i <=  8'h00; out_1_i <=  8'h00; out_2_i <=  8'h00; out_3_i <=  8'h00;
                out_4_i <=  8'h00; out_5_i <=  8'h00; out_6_i <=  8'h00; out_7_i <=  8'h00;
            end
            3'b111: begin
                out_0_r <=  8'h00; out_1_r <=  8'h00; out_2_r <=  8'h00; out_3_r <=  8'h00;
                out_4_r <=  8'h00; out_5_r <=  8'h00; out_6_r <=  8'h00; out_7_r <=  8'h00;
                out_0_i <= -8'h3f; out_1_i <= -8'h1f; out_2_i <=  8'h1f; out_3_i <=  8'h3f;
                out_4_i <=  8'h3f; out_5_i <=  8'h1f; out_6_i <= -8'h1f; out_7_i <= -8'h3f;
            end
        endcase
    end

endmodule
