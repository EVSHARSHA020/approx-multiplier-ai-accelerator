module log_approx (
    input  [7:0] in,
    input  [2:0] pos,       // from your LOD module
    input        valid,     // from your LOD module
    output reg [2:0] characteristic,
    output reg [6:0] mantissa
);

always @(*) begin
    if (!valid) begin
        characteristic = 3'd0;
        mantissa = 7'd0;
    end else begin
        characteristic = pos;
        case (pos)
            3'd7: mantissa = {in[6:0]};
            3'd6: mantissa = {in[5:0], 1'b0};
            3'd5: mantissa = {in[4:0], 2'b00};
            3'd4: mantissa = {in[3:0], 3'b000};
            3'd3: mantissa = {in[2:0], 4'b0000};
            3'd2: mantissa = {in[1:0], 5'b00000};
            3'd1: mantissa = {in[0],   6'b000000};
            3'd0: mantissa = 7'b0000000;
        endcase
    end
end

endmodule