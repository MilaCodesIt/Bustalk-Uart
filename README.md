# BusTalk UART

## APB-Controlled UART Communication IP

## Overview

This project implements a memory-mapped UART (Universal Asynchronous Receiver Transmitter) peripheral with an AMBA APB (Advanced Peripheral Bus) slave interface, designed entirely in Verilog RTL and verified using simulation-based waveform analysis.

The UART peripheral allows a processor or SoC to control serial communication through standard APB register reads and writes. The design follows a clean, modular IP-style structure and demonstrates practical understanding of bus protocols, serial communication, and digital verification.

This project is fully simulation-based and does not require any physical hardware.

---

## Key Features

- AMBA APB-compliant slave interface
- Memory-mapped control and status registers
- Configurable UART baud rate
- UART transmit (TX) and receive (RX) logic
- TX busy and RX valid status reporting
- Modular RTL design with clear separation of concerns
- Verified using GTKWave waveform analysis

---

## Project Structure

<img width="303" height="460" alt="Screenshot 2026-01-25 215205" src="https://github.com/user-attachments/assets/df2043b9-0eab-4999-a0f9-75762d53adc0" />


---

## Register Map

| Address | Register  | Access | Description                      |
|--------:|----------|--------|----------------------------------|
| 0x00    | CTRL     | R/W    | UART enable control              |
| 0x04    | BAUD_DIV | R/W    | Baud rate divider                |
| 0x08    | TXDATA   | W      | Write data to start transmission |
| 0x0C    | RXDATA   | R      | Received UART data               |
| 0x10    | STATUS   | R      | UART status flags                |

### STATUS Register Bits

| Bit | Name     | Description                   |
|----:|----------|-------------------------------|
| 0   | tx_busy  | UART transmitter busy         |
| 1   | rx_valid | Valid received data available |

---

## Design Description

### APB Interface

<img width="1920" height="1020" alt="apb_write_txdata" src="https://github.com/user-attachments/assets/0094afd6-d701-4046-96d1-cca3ee5344c8" />


- Acts as an APB slave peripheral
- Transactions valid when PSEL and PENABLE are asserted
- Write operations update registers
- Read operations return PRDATA
- PREADY permanently asserted

### UART Transmitter

<img width="1920" height="1020" alt="uart_tx_waveform" src="https://github.com/user-attachments/assets/bacd646a-326c-4852-9383-7acc7b82498e" />

- TX line idle high
- Transmission starts on TXDATA write
- Frame: 1 start bit, 8 data bits, 1 stop bit
- tx_busy asserted during transmission



### UART Receiver

- Detects start bit on RX
- Samples data using baud divider
- Stores received byte in RXDATA
- rx_valid asserted when data available

---

## Simulation and Verification

<img width="1216" height="482" alt="Screenshot 2026-01-25 215424" src="https://github.com/user-attachments/assets/4e6c7aa2-4f95-418e-9884-5acd18e0681a" />

Tools:
- Icarus Verilog
- GTKWave

Simulation confirms correct APB timing and UART framing at bit level.

---

## How to Run the Simulation (Windows)

1. Install Icarus Verilog and GTKWave
2. Navigate to:
```
APB_UART_IP/sim
```
3. Run:
```
run.bat
```

---

