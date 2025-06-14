# Kogge-stone-Adder
## Generic Kogge Stone Adder - Overview
This project implements a Kogge-Stone Adder (KSA) in VHDL, a parallel prefix form of a carry-lookahead adder designed for high-performance binary addition. The design is parameterized to support arbitrary widths (as long as the width is a power of 2) and makes use of modular components for pre-processing, carry generation (gray/black cells), and post-processing.

## Features

● Parameterizable input width N (default: 32 bits)

● Logarithmic carry computation using Kogge-Stone prefix tree

● Modular design with dedicated components:

● Pre_Process

● Gray_Cell

● Black_Cell

● Post_Process

Fully synchronous and synthesizable

File Structure
Kogge_Stone_Adder_tb.vhd - Top-level entity for the adder

Kogge_Stone_Adder.vhd - Implements the Kogge Stone Adder

Gray_Cell.vhd - Implements carry computation when propagate is not needed

Black_Cell.vhd - Computes both generate and propagate values

Pre_Process.vhd - Calculates initial generate/propagate signals

Post_Process.vhd - Computes the final sum output

log2_pkg.vhd - Provides log2() function used for determining the number of stages
