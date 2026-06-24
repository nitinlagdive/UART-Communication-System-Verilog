`timescale 1ns/1ps

module uart_loopback_tb;

reg clk;
reg reset;
reg tx_start;
reg [7:0] data_in;

wire tx;
wire busy;

wire [7:0] data_out;
wire data_valid;

uart_tx TX(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .busy(busy)
);

uart_rx RX(
    .clk(clk),
    .reset(reset),
    .rx(tx),
    .data_out(data_out),
    .data_valid(data_valid)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("uart_loopback.vcd");
    $dumpvars(0,uart_loopback_tb);

    clk = 0;
    reset = 1;
    tx_start = 0;
    data_in = 0;

    #20;
    reset = 0;

    #20;

    data_in = 8'b10101010;

    tx_start = 1;

    #10;
    tx_start = 0;

    #500;

    $finish;

end

endmodule