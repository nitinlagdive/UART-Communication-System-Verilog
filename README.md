# UART Communication System using Verilog HDL

## Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) communication system using Verilog HDL.

The design includes UART Transmitter (TX), UART Receiver (RX), and a loopback testbench for verification.

## Features

- UART Transmitter (TX)
- UART Receiver (RX)
- UART Loopback Verification
- FSM-Based Design
- Functional Simulation

## Files Included

- uart_tx.v → UART Transmitter module
- uart_rx.v → UART Receiver module
- uart_loopback_tb.v → Testbench for verification
- uart_waveform.png → Simulation waveform

## Working

The UART transmitter converts parallel data into serial data.

The UART receiver receives serial data and converts it back into parallel data.

In loopback testing:

UART TX  -------->  UART RX

       Serial Data


## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave

## Verification Result

Input Data:

0xAA (10101010)

Output Data:

0xAA (10101010)

Loopback communication verified successfully.

## Simulation Waveform

![UART Waveform](uart_waveform.png)

## Author

Nitin Lagdive  
Electronics & Telecommunication Engineering Student
