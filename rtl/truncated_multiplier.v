module truncated_multiplier (
    input  [7:0] a,
    input  [7:0] b,
    output [15:0] product
);

wire [15:0] full_product;
assign full_product = a * b;

// Truncate the lowest 4 bits of the result (force them to 0)
assign product = {full_product[15:4], 4'b0000};

endmodule