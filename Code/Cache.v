module Cache(Data_in, Data_output,hits, clk);

    input[31:0] Data_in; //Here, we are taking a 32 bit memory address as the input;
    input clk;
    output reg Data_output; //This gives 1 for a hit and a 0 for a miss;
    output reg[20:0] hits;

    reg [15:0][31:0]cache_memory[255:0]; //This is the Cache which holds 256 blocks, with 16 words per block where every word is of 32 bits;


    reg[5:0] block_offset;
    reg[9:0] line_number;
    reg[15:0] tag[1023:0];
    reg valid_bit[1023:0];

    integer hit_count = 0;
    integer i=0;
    integer j;
    wire [31:0] temp = {Data_in[31:4],4'b0000};
    always @(posedge clk)
        begin

            if(i==0)
            begin
            for(j=0;j<1023;j=j+1)
                begin
                valid_bit[i]=0;
                end
            i=1;
            end

            line_number = Data_in[15:6];
            if(valid_bit[line_number] !=1)
                begin
                    Data_output = 0;
                    for (j=0;j<16;j=j+1)
                    begin
                        cache_memory[line_number][j] = temp + j;
                    end
                    tag[line_number] = Data_in[31:16];
                    valid_bit[line_number] = 1;
                end
            else
                begin
                    if(tag[line_number] == Data_in[31:16])
                        begin
                            Data_output = 1;
                            hit_count = hit_count + 1;
                            valid_bit[line_number] = 1;
                        end
                    else
                        begin
                            Data_output = 0;
                            for (j=0;j<16;j=j+1)
                            begin
                                cache_memory[line_number][j] = temp + j;
                            end
                            tag[line_number] = Data_in[31:16];
                            valid_bit[line_number] = 1;
                        end
                end

                hits <= hit_count;

        end



endmodule
