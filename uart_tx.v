module uart_tx(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

reg [3:0] bit_index;
reg [7:0] data_reg;
reg [1:0] state;

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= IDLE;
        tx <= 1'b1;
        busy <= 1'b0;
        bit_index <= 0;
        data_reg <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            tx <= 1'b1;
            busy <= 1'b0;

            if(tx_start)
            begin
                data_reg <= data_in;
                bit_index <= 0;
                busy <= 1'b1;
                state <= START;
            end
        end

        START:
        begin
            tx <= 1'b0;
            state <= DATA;
        end

        DATA:
        begin
            tx <= data_reg[bit_index];

            if(bit_index == 7)
                state <= STOP;
            else
                bit_index <= bit_index + 1;
        end

        STOP:
        begin
            tx <= 1'b1;
            busy <= 1'b0;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule