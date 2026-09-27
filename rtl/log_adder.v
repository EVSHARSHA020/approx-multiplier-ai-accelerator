module log_adder (
    input  [2:0] char_a,
    input  [6:0] mantissa_a,
    input  [2:0] char_b,
    input  [6:0] mantissa_b,
    output [3:0] sum_char,      // 4 bits: max possible is 7+7+1(carry) = 15
    output [6:0] sum_mantissa
);

wire [7:0] mantissa_sum;        // 8 bits: two 7-bit numbers can sum up to 8 bits
wire       carry;

assign mantissa_sum = mantissa_a + mantissa_b;
assign carry = mantissa_sum[7];          // did the mantissa addition overflow?
assign sum_mantissa = mantissa_sum[6:0]; // keep only the lower 7 bits
assign sum_char = char_a + char_b + carry;

endmodule