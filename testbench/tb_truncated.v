module tb_truncated;
    reg [7:0] a, b;
    wire [15:0] product;

    truncated_multiplier uut (.a(a), .b(b), .product(product));

    initial begin
        a = 8'd15;  b = 8'd3;   #10 $display("a=%d b=%d product=%d", a, b, product);
        a = 8'd44;  b = 8'd44;  #10 $display("a=%d b=%d product=%d", a, b, product);
        a = 8'd200; b = 8'd1;   #10 $display("a=%d b=%d product=%d", a, b, product);
        a = 8'd0;   b = 8'd50;  #10 $display("a=%d b=%d product=%d", a, b, product);
        a = 8'd100; b = 8'd100; #10 $display("a=%d b=%d product=%d", a, b, product);
        $finish;
    end
endmodule