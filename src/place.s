.text
.globl place

# 	a0 board address
# 	a1 board length
#	a2 field number to place into
#	a3 number to place
#
#	a0 == 0 iff place succesfull else 1
#


place:

li t0 2
li t3 0
mul t1 t0 a2
add t2 a0 t1

lw t4 0(t2)
beq t4 t3 tile



fruit:
 li a0 1
 jr ra

tile:
 sw a3 0(t2)
tree:
 li a0 0
 jr ra
	

	
