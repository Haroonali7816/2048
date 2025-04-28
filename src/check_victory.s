.text
.globl check_victory


#
#	a0 board address
#	a1 board length
#
#	a0 == 1 iff 2048 found
check_victory:

li t1 2048 # t1 stores the value 2048
mv t0 a0  # t0 stores the address/value of a0
li t2 1 # t2 which is a counter is initiated with value 1.
 


loop:
 lw t3 0(t0)
 beq t3 t1 target  # if t0  == t1 then target
 addi t0 t0 2
 addi t2 t2 1
 
check_loop:
bne t2 a1 loop
li a0 0
jr ra

target:
li a0 1 
jr ra
 
