module leading_one_detector (
    input  [7:0] in,        // the 8-bit number
    output reg [2:0] pos,   // leading-1 position, 0 to 7
    output reg valid        // 1 if at least one bit is 1, 0 if input is all zero
);

always @(*) begin
    if (in[7]) begin
        pos = 3'd7; valid = 1;
    end else if (in[6]) begin
        pos = 3'd6; valid = 1;
    end else if (in[5]) begin
        pos = 3'd5; valid = 1;
    end else if (in[4]) begin
        pos = 3'd4; valid = 1;
    end else if (in[3]) begin
        pos = 3'd3; valid = 1;
    end else if (in[2]) begin
        pos = 3'd2; valid = 1;
    end else if (in[1]) begin
        pos = 3'd1; valid = 1;
    end else if (in[0]) begin
        pos = 3'd0; valid = 1;
    end else begin
        pos = 3'd0; valid = 0;
    end
end

endmodule