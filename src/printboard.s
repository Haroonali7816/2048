.data


.globl printboard

start: .asciiz "-----------------------------"
first: .asciiz "|      |      |      |      |"
second: .asciiz "|"
next_line: .asciiz"\n"
space: .asciiz" "



#
#a0 Address of the first field of the board
#
#	-----------------------------
#	|      |      |      |      |
#	| 2048 |  128 |    8 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	| 1024 |   64 |    4 |    8 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  512 |   32 |  512 |  128 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  256 |   16 | 2048 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#
.text



printboard:
mv t0 a0
li a2 0 # pos counter
li a6 0
li a7 4
start_row:
la a1 start
li a0 4
ecall
la a1 next_line
li a0 4
ecall
la a1 first
li a0 4
ecall
la a1 next_line
li a0 4
ecall
la a1 second
li a0 4
ecall
li a2 0

digit:
slli a3 a2 2
add t2 a3 t0
lh t3 0(t2)
mv a4 t3
beqz t3 sugar

check_digit:
mv s1 t3
li t4 0 #counter to store number of digits
loop:
beqz s1 space_check 
li a5 10
divu s1 s1 a5
addi t4 t4 1
j loop
sugar:
li t4 1
space_check:
li t5 5
sub t6 t5 t4
space_loop:
beqz t6 value_print
la a1 space
li a0 4
ecall
li t3 1
sub t6 t6 t3
j space_loop
value_print:
mv a1 a4
li a0 1
ecall
la a1 space
li a0 4
ecall
la a1 second
li a0 4
ecall
addi a2 a2 1
li a5 4
bne a2 a5 digit
la a1 next_line
li a0 4
ecall
la a1 first
li a0 4
ecall
la a1 next_line
li a0 4
ecall
addi a6 a6 1
li a7 4
bne a6 a7 start_row
la a1 start
li a0 4
ecall
la a1 next_line
li a0 4
ecall
end:
jr ra



