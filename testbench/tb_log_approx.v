module tb_log_approx;
    reg [7:0] in;
    wire [2:0] pos;
    wire valid;
    wire [2:0] characteristic;
    wire [6:0] mantissa;

    leading_one_detector lod (.in(in), .pos(pos), .valid(valid));
    log_approx la (.in(in), .pos(pos), .valid(valid), .characteristic(characteristic), .mantissa(mantissa));

    initial begin
        in = 8'd200; #10 $display("in=%d char=%d mantissa=%b", in, characteristic, mantissa);
        in = 8'd44;  #10 $display("in=%d char=%d mantissa=%b", in, characteristic, mantissa);
        in = 8'd3;   #10 $display("in=%d char=%d mantissa=%b", in, characteristic, mantissa);
        in = 8'd1;   #10 $display("in=%d char=%d mantissa=%b", in, characteristic, mantissa);
        in = 8'd0;   #10 $display("in=%d char=%d mantissa=%b", in, characteristic, mantissa);
        $finish;
    end
endmodule