# 1 Bit Error Detection and Correction using Hamming(7,4)

## Overview

This project implements the Hamming(7,4) code, a linear error correcting code, using Verilog. It consists of an Encoder module that takes 4-bit input data and adds 3-bit parity data, and a Decoder module that utilizes the parity data to detect and automatically correct errors, providing 4-bit output data. The Encoder is designed using data flow modeling, while the Decoder is designed using behavioral modeling in Verilog. Verification is performed using ModelSim.

## Features

- Implements the Hamming(7,4) code for error detection and correction.
- Encoder module adds 3-bit parity data to 4-bit input data.
- Decoder module detects and corrects errors using parity data.
- Encoder designed using data flow modeling.
- Decoder designed using behavioral modeling.
- Verification performed using ModelSim.

## Usage

1. Ensure you have ModelSim installed for verification.
2. Compile and simulate the Verilog modules using ModelSim.
3. Provide 4-bit input data to the Encoder module.
4. Receive 4-bit output data from the Decoder module, which is automatically corrected if errors are detected.


