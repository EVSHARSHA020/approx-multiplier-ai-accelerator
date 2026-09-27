module tb_mitchell;
    reg [7:0] a, b;
    wire [15:0] product;
    wire [15:0] exact;

    mitchell_multiplier uut (.a(a), .b(b), .product(product));
    assign exact = a * b;

    initial begin
        a = 8'd15;  b = 8'd3;   #10 $display("a=%d b=%d exact=%d approx=%d", a, b, exact, product);
        a = 8'd44;  b = 8'd44;  #10 $display("a=%d b=%d exact=%d approx=%d", a, b, exact, product);
        a = 8'd200; b = 8'd1;   #10 $display("a=%d b=%d exact=%d approx=%d", a, b, exact, product);
        a = 8'd0;   b = 8'd50;  #10 $display("a=%d b=%d exact=%d approx=%d", a, b, exact, product);
        a = 8'd100; b = 8'd100; #10 $display("a=%d b=%d exact=%d approx=%d", a, b, exact, product);
        $finish;
    end
endmodule