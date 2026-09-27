module tb_lod;
    reg [7:0] in;
    wire [2:0] pos;
    wire valid;

    leading_one_detector uut (.in(in), .pos(pos), .valid(valid));

    initial begin
        in = 8'd200; #10 $display("in=%d pos=%d valid=%b", in, pos, valid);
        in = 8'd44;  #10 $display("in=%d pos=%d valid=%b", in, pos, valid);
        in = 8'd3;   #10 $display("in=%d pos=%d valid=%b", in, pos, valid);
        in = 8'd1;   #10 $display("in=%d pos=%d valid=%b", in, pos, valid);
        in = 8'd0;   #10 $display("in=%d pos=%d valid=%b", in, pos, valid);
        $finish;
    end
endmodule