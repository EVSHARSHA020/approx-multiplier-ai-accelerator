module tb_all_compare;
    reg [7:0] a, b;
    wire [15:0] exact_p, trunc_p, mitch_p;
    integer i, j, file;

    exact_multiplier      u1 (.a(a), .b(b), .product(exact_p));
    truncated_multiplier  u2 (.a(a), .b(b), .product(trunc_p));
    mitchell_multiplier   u3 (.a(a), .b(b), .product(mitch_p));

    initial begin
        file = $fopen("results.csv", "w");
        $fwrite(file, "a,b,exact,truncated,mitchell\n");

       for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                a = i; b = j;
                #5;
                $fwrite(file, "%d,%d,%d,%d,%d\n", a, b, exact_p, trunc_p, mitch_p);
            end
        end

        $fclose(file);
        $display("Done. Results written to results.csv");
        $finish;
    end
endmodule