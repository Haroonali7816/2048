2048 in RISC-V Assembly

This project implements the full logic of the classic game 2048 in RISC-V assembly, including tile movement, merging, scoring, board rendering, and game-state evaluation. The program runs on the Venus RISC-V simulator and follows a modular, subroutine-based structure.

✨ Features

Full tile-movement system (shift, compress, merge)

Deterministic row operations for all directions via rotation logic

Scoring with merge value accumulation and combo multipliers

Victory and move-availability checks

Random tile placement (2 or 4)

Text-based board renderer formatted for a 4×4 grid

Clean separation of logic into modular assembly subroutines

🧠 Technical Overview

The board is stored as a 1D array of unsigned halfwords in row-major order.

Rows/columns are passed to subroutines as arrays of memory addresses.

Movement consists of:

Shifting tiles left

Merging equal adjacent tiles

Shifting again to remove gaps

Scoring is computed from merged tile values, combined with a combo multiplier.

Rendering prints each tile in a fixed-width cell, aligned using spaces.

▶ Running the Project
Run tests
./run_tests.py

Run in Venus

Open the assembly file in VSCode and start the Venus debugger to step through execution, inspect registers, and view memory.

📂 Structure
src/
  main.s
  utils.s
  printboard.s
  move_left.s
  merge.s
  move_one.s
  complete_move.s
  check_victory.s
  move_check.s
  place.s
tests/
run_tests.py

🛠 Tools Used

RISC-V (RV32I)

Venus Simulator

Python test harness

Git / VSCode
