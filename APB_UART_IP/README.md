# APB-Controlled UART IP

A memory-mapped UART peripheral designed using Verilog and controlled via AMBA APB bus.

## Features
- APB register interface
- UART TX/RX (8N1)
- Programmable baud rate
- Simulation verified using GTKWave

## Register Map
| Address | Name     | Description |
|--------|----------|-------------|
| 0x00   | CTRL     | Enable UART |
| 0x04   | BAUD_DIV | Baud divider |
| 0x08   | TXDATA   | Write data |
| 0x0C   | RXDATA   | Read data |
| 0x10   | STATUS   | TX busy / RX valid |

## How to Run

cd sim
run.bat


## Tools
- Icarus Verilog
- GTKWave
- VS Code