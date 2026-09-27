module log_decoder (
    input  [3:0] sum_char,
    input  [6:0] sum_mantissa,
    output reg [15:0] product
);

wire [7:0] significand = {1'b1, sum_mantissa};

always @(*) begin
    if (sum_char >= 7)
        product = significand << (sum_char - 7);
    else
        product = significand >> (7 - sum_char);
end

endmodule