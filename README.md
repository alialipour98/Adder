# Creating an integrated Readme.md file based on the provided structure and contents from the extracted folder

readme_content = """
# LadnerFischerAdder_16Bit and SignedDigitAdder_16Bit Project

This project contains implementations of two types of adders:
1. **Ladner-Fischer Adder (16-bit)** in VHDL.
2. **Signed Digit Adder (16-bit)** in VHDL.
Additionally, it includes Python code for Carry Lookahead Adder (CLA) and Carry Skip Adder (CSK).

## Project Structure
- **LadnerFischerAdder_16Bit.vhd**: Contains the VHDL code for the 16-bit Ladner-Fischer Adder.
- **SignedDigitAdder_16Bit.vhd**: Contains the VHDL code for the 16-bit Signed Digit Adder.
- **Carry_Lookahead_Adder.py**: Python code for implementing Carry Lookahead Adder (CLA).
- **Carry_Skip_Adder.py**: Python code for implementing Carry Skip Adder (CSK).
- **Visio Diagram (LadnerFischerAdder_16Bit.vsdx)**: A visual representation of the Ladner-Fischer adder’s structure and flow, created using Microsoft Visio.
- **Report**: This folder contains the full documentation of the project.

## Features
- Implements a 16-bit Ladner-Fischer Adder in VHDL.
- Implements a 16-bit Signed Digit Adder in VHDL.
- Provides Python code for CLA and CSK implementations.
- Includes a visual diagram to explain the structure and operation of the Ladner-Fischer adder.
- Supports testbench generation for validating the functionality of the adders.

## Requirements
- **VHDL Compiler**: Required for compiling and testing the VHDL code.
- **Python 3**: Required for running the CLA and CSK Python code.
- **Microsoft Visio** (optional): To view and edit the graphical diagram.

## How to Run
1. Compile the `LadnerFischerAdder_16Bit.vhd` or `SignedDigitAdder_16Bit.vhd` in a compatible VHDL environment.
2. Generate testbench files to simulate the adders’ performance.
3. Run the Python script (`Carry_Lookahead_Adder.py` or `Carry_Skip_Adder.py`) to simulate the CLA and CSK adders.
4. Review the graphical diagram for a visual understanding of the adder’s operation using the Visio file.

## Visualization
The Visio diagram (`LadnerFischerAdder_16Bit.vsdx`) provides a step-by-step process of binary addition in a Ladner-Fischer adder, which helps in understanding how it computes sums by propagating carry bits efficiently in parallel stages.

## Authors
- **Ali Alipour Fraydani** and **Hosein Taati**
- Student IDs: 810101233, 81010127

## License
This project is licensed under the University of Tehran License.
"""

# Confirm the creation of the integrated Readme.md file
final_readme_path
