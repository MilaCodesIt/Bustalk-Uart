`timescale 1ns/1ps

module tb_apb_uart;

    reg PCLK = 0;
    always #5 PCLK = ~PCLK;

    reg PRESETn;
    reg PSEL, PENABLE, PWRITE;
    reg [7:0] PADDR;
    reg [31:0] PWDATA;
    wire [31:0] PRDATA;
    wire uart_tx;
    reg uart_rx = 1;

    apb_uart dut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(),
        .uart_tx(uart_tx),
        .uart_rx(uart_rx)
    );

    task apb_write(input [7:0] addr, input [31:0] data);
        begin
            PSEL=1; PWRITE=1; PENABLE=0;
            PADDR=addr; PWDATA=data;
            #10 PENABLE=1;
            #10 PSEL=0; PENABLE=0;
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_apb_uart);

        PRESETn=0;
        #20 PRESETn=1;

        apb_write(8'h00, 1);
        apb_write(8'h04, 16);
        apb_write(8'h08, 8'h55);

        #2000;
        $finish;
    end
endmodule
