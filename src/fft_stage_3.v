module fft_stage3 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] a0, a1, ar2, ai2, ar3, ai3, a4, a5, ar6, ai6, ar7, ai7,
    input clk, rst,
    output [(2 ** N) - 1 : 0] y0, yr1, yi1, yr2, yi2, yr3, yi3, y4, yr5, yi5, yr6, yi6, yr7, yi7;
);
    butterfly_1 bf1_1(a0, a1, clk, rst, y0, y4);

    butterfly_1 bf1_real(ar2, ar3, clk, rst, yr1, yr5); // Real part y1, y5
    butterfly_1 bf1_imag(ai2, ai3, clk, rst, yi1, yi5); // imag part y1, y5

    butterfly_3 bf2_1(a4, a5, clk, rst, yr2, yr6, yi2, yi6);

    butterfly_1 bf2_real(ar6, ar6, clk, rst, yr3, yr7); // Real part y3, y7
    butterfly_1 bf2_imag(ai6, ai6, clk, rst, yi3, yi7); // imag part y3, y7

endmodule
