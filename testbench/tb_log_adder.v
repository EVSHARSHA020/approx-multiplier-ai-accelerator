module tb_log_adder;
    reg [7:0] a, b;
    wire [2:0] pos_a, pos_b;
    wire valid_a, valid_b;
    wire [2:0] char_a, char_b;
    wire [6:0] mantissa_a, mantissa_b;
    wire [3:0] sum_char;
    wire [6:0] sum_mantissa;

    leading_one_detector lod_a (.in(a), .pos(pos_a), .valid(valid_a));
    leading_one_detector lod_b (.in(b), .pos(pos_b), .valid(valid_b));
    log_approx la_a (.in(a), .pos(pos_a), .valid(valid_a), .characteristic(char_a), .mantissa(mantissa_a));
    log_approx la_b (.in(b), .pos(pos_b), .valid(valid_b), .characteristic(char_b), .mantissa(mantissa_b));
    log_adder adder (.char_a(char_a), .mantissa_a(mantissa_a), .char_b(char_b), .mantissa_b(mantissa_b), .sum_char(sum_char), .sum_mantissa(sum_mantissa));

    initial begin
        a = 8'd15; b = 8'd3;  #10 $display("a=%d b=%d sum_char=%d sum_mantissa=%b", a, b, sum_char, sum_mantissa);
        a = 8'd44; b = 8'd44; #10 $display("a=%d b=%d sum_char=%d sum_mantissa=%b", a, b, sum_char, sum_mantissa);
        a = 8'd200; b = 8'd1; #10 $display("a=%d b=%d sum_char=%d sum_mantissa=%b", a, b, sum_char, sum_mantissa);
        $finish;
    end
endmodule