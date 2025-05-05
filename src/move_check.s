.text
.globl move_check


#
#	a0 buffer address
#	a1 buffer length
#
#   a0 == 1 iff left move possible and would change something
#            else 0
#



move_check:
li s1 1
bge a1 s1 start_move
j not_move
jr ra
start_move:
addi t0 x0 1 # we start by the second tile since we want to check if we can move left
slli t1 t0 2 # shift t0 to left by 2
add t2 a0 t1

loop:
  lw t3 0(t2) # Tile n
  lw t4 -4(t2) # Tile n-1
  
  lh t5 0(t3)
  lh t6 0 (t4)

  beqz t6  end # if the adjacent tile is empty
  beq t5 t6 end # if the adjacent tiles have same number

 addi t0 t0 1
 addi t2 t2 4
 blt t0 a1 loop # continue loop until t0 (current index) is less than total elements in the array

# If the loop is over then we move here to no move possible.


not_move:
li a0 0
jr ra

end:
 li a0 1
 jr ra





