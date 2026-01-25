module uart_rx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       rx,
    input  wire [15:0] baud_div,
    output reg [7:0]  rx_data,
    output reg        rx_valid
);

    reg [3:0] bit_cnt;
    reg [15:0] baud_cnt;
    reg [7:0] data_reg;
    reg receiving;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_valid <= 0;
            receiving <= 0;
            bit_cnt <= 0;
            baud_cnt <= 0;
        end else begin
            rx_valid <= 0;
            if (!receiving && rx == 0) begin
                receiving <= 1;
                baud_cnt <= baud_div >> 1;
                bit_cnt <= 0;
            end else if (receiving) begin
                if (baud_cnt == baud_div - 1) begin
                    baud_cnt <= 0;
                    data_reg[bit_cnt] <= rx;
                    bit_cnt <= bit_cnt + 1;
                    if (bit_cnt == 7) begin
                        receiving <= 0;
                        rx_data <= data_reg;
                        rx_valid <= 1;
                    end
                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end
endmodule
