module uart_tx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    input  wire [15:0] baud_div,
    output reg        tx,
    output reg        tx_busy
);

    reg [3:0] bit_cnt;
    reg [15:0] baud_cnt;
    reg [9:0] shift_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx <= 1'b1;
            tx_busy <= 0;
            bit_cnt <= 0;
            baud_cnt <= 0;
            shift_reg <= 10'h3FF;
        end else begin
            if (tx_start && !tx_busy) begin
                shift_reg <= {1'b1, tx_data, 1'b0}; // stop, data, start
                tx_busy <= 1;
                bit_cnt <= 0;
                baud_cnt <= 0;
            end else if (tx_busy) begin
                if (baud_cnt == baud_div - 1) begin
                    baud_cnt <= 0;
                    tx <= shift_reg[0];
                    shift_reg <= {1'b1, shift_reg[9:1]};
                    bit_cnt <= bit_cnt + 1;
                    if (bit_cnt == 9) begin
                        tx_busy <= 0;
                        tx <= 1'b1;
                    end
                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end
endmodule
