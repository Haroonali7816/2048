**2048 — RISC-V Assembly Implementation**

   This repository contains an implementation of the 2048 puzzle game written fully in RISC-V assembly. The project focuses on building all core mechanics from scratch: tile    shifting, merging, random tile generation, board representation, scoring, and a simple text-based display.

**Overview**

  The program represents the game board as a linear array in memory and performs all operations using low-level memory access and modular subroutines. Movement is handled by   shifting and merging tiles to the left, while rotations allow the same logic to be reused for all four directions. The game supports scoring, victory detection, and          checking whether further moves are possible.

**Features**

4×4 board stored as an array of unsigned halfwords

Tile shifting and merging logic

Random tile placement (2 or 4)

Detection of win/loss states

Scoring with combined merge values and combo multiplier

Text-based board renderer with aligned tile formatting

Modular RISC-V routines for each operation

**Working**

Board Representation: A 1D array in row-major order. A tile value of 0 represents an empty cell.

Movement Logic:

Compress tiles to the left

Merge equal adjacent tiles

Compress again to remove gaps

Scoring: The value of each merged tile contributes to the score; multiple merges apply a combo multiplier.

Rendering: The board is printed with fixed-width cells to create a clear grid.

**Running and Testing**

Run all public tests
```./run_tests.py```

**Run in the simulator**

Open the .s files in VSCode and start the Venus RISC-V debugger to inspect registers, memory, and execution flow.

**Project Structure**

```main.s```
```utils.s```
```printboard.s```
```move_left.s```
```merge.s```
```move_one.s```
```complete_move.s```
```check_victory.s```
```move_check.s```
```place.s```
```tests/```
```run_tests.py```

**Tools Used**

RISC-V (RV32I)

Venus simulator

Python testing framework

Git + VSCode
