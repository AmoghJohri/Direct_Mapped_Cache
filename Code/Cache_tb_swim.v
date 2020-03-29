module Cache_tb;

    reg[31:0] Data_in;
    reg clk;
    integer f;

    wire Data_output;
    wire[20:0] hits;



    Cache uut(
        .Data_in(Data_in),
        .clk(clk),
        .hits(hits),
        .Data_output(Data_output)
    );

    reg [31:0]instructions[303192:0];
    initial begin
        $readmemb("swim.txt",instructions);
    end

    initial begin
    f = $fopen("output_swim.txt","w");
    end

    always
        begin
        $display(hits);

            clk = 0; #1;
            clk = 1; #1;
        end
    integer k = 0;
    always @ ( posedge clk ) begin
    k = k + 1;
        if(k == 1000)
        begin
        $fwrite(f," %d", hits);
        k = 0;
        end
    end

    integer i;

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, Cache_tb);

        for (i = 0; i < 303193; i = i + 1)
            begin
                Data_in = instructions[i]; #2;
            end


        $fclose(f);
        $finish;

    end


endmodule
