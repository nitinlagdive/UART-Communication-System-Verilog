module uart_rx(
    input clk,
    input reset,
    input rx,
    output reg [7:0] data_out,
    output reg data_valid
);

reg [3:0] bit_index;
reg [7:0] data_reg;
reg [1:0] state;

parameter IDLE  = 2'b00;
parameter DATA  = 2'b01;
parameter STOP  = 2'b10;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= IDLE;
        bit_index <= 0;
        data_reg <= 0;
        data_out <= 0;
        data_valid <= 0;
    end
    else
    begin

        case(state)

        IDLE:
        begin
            data_valid <= 0;

            if(rx == 0)      // Start bit detected
            begin
                bit_index <= 0;
                state <= DATA;
            end
        end

        DATA:
        begin
            data_reg[bit_index] <= rx;

            if(bit_index == 7)
                state <= STOP;
            else
                bit_index <= bit_index + 1;
        end

        STOP:
        begin
            data_out <= data_reg;
            data_valid <= 1;
            state <= IDLE;
        end

        endcase

    end
end

endmodule