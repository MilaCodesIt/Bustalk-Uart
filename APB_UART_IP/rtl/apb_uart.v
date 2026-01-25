module apb_uart (
    input  wire        PCLK,
    input  wire        PRESETn,
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,
    input  wire [7:0]  PADDR,
    input  wire [31:0] PWDATA,
    output reg  [31:0] PRDATA,
    output wire        PREADY,
    output wire        uart_tx,
    input  wire        uart_rx
);

    assign PREADY = 1'b1;

    reg        ctrl_en;
    reg [15:0] baud_div;
    reg [7:0]  rx_reg;
    reg        rx_valid_reg;
    reg        tx_start;

    wire tx_busy;
    wire [7:0] rx_data;
    wire rx_valid;

    uart_top uart (
        .clk(PCLK),
        .rst_n(PRESETn),
        .tx_start(tx_start),
        .tx_data(PWDATA[7:0]),
        .baud_div(baud_div),
        .tx(uart_tx),
        .tx_busy(tx_busy),
        .rx(uart_rx),
        .rx_data(rx_data),
        .rx_valid(rx_valid)
    );

    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            ctrl_en <= 0;
            baud_div <= 16'd16;
            tx_start <= 0;
            rx_valid_reg <= 0;
        end else begin
            tx_start <= 0;
            if (PSEL && PENABLE && PWRITE) begin
                case (PADDR)
                    8'h00: ctrl_en <= PWDATA[0];
                    8'h04: baud_div <= PWDATA[15:0];
                    8'h08: if (ctrl_en && !tx_busy) tx_start <= 1;
                endcase
            end
            if (rx_valid) begin
                rx_reg <= rx_data;
                rx_valid_reg <= 1;
            end
            if (PSEL && PENABLE && !PWRITE && PADDR == 8'h0C)
                rx_valid_reg <= 0;
        end
    end

    always @(*) begin
        PRDATA = 32'h0;
        if (PSEL && !PWRITE) begin
            case (PADDR)
                8'h0C: PRDATA = {24'h0, rx_reg};
                8'h10: PRDATA = {30'h0, rx_valid_reg, tx_busy};
            endcase
        end
    end
endmodule
