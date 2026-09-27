module mitchell_multiplier (
    input  [7:0] a,
    input  [7:0] b,
    output [15:0] product
);

wire [2:0] pos_a, pos_b;
wire valid_a, valid_b;
wire [2:0] char_a, char_b;
wire [6:0] mantissa_a, mantissa_b;
wire [3:0] sum_char;
wire [6:0] sum_mantissa;
wire [15:0] product_raw;

leading_one_detector lod_a (.in(a), .pos(pos_a), .valid(valid_a));
leading_one_detector lod_b (.in(b), .pos(pos_b), .valid(valid_b));
log_approx la_a (.in(a), .pos(pos_a), .valid(valid_a), .characteristic(char_a), .mantissa(mantissa_a));
log_approx la_b (.in(b), .pos(pos_b), .valid(valid_b), .characteristic(char_b), .mantissa(mantissa_b));
log_adder adder (.char_a(char_a), .mantissa_a(mantissa_a), .char_b(char_b), .mantissa_b(mantissa_b), .sum_char(sum_char), .sum_mantissa(sum_mantissa));
log_decoder dec (.sum_char(sum_char), .sum_mantissa(sum_mantissa), .product(product_raw));

assign product = (!valid_a || !valid_b) ? 16'd0 : product_raw;

endmodule