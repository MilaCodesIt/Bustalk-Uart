module uart_top (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    input  wire [15:0] baud_div,
    output wire       tx,
    output wire       tx_busy,
    input  wire       rx,
    output wire [7:0] rx_data,
    output wire       rx_valid
);

    uart_tx u_tx (
        .clk(clk),
        .rst_n(rst_n),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .baud_div(baud_div),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    uart_rx u_rx (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .baud_div(baud_div),
        .rx_data(rx_data),
        .rx_valid(rx_valid)
    );
endmodule
