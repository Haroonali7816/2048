.text
.globl merge

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  0 |  0 |  4 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.

merge:
 addi sp sp -16
 sw ra 12(sp)
 sw s0 8(sp)
 sw s1 4(sp)

 mv s0 a0
 mv s1 a1

 li t0 0

 loop:
 addi t2 s1 -1
 bge t0 t2 done

 slli t1 t0 2
 add s2 s0 t1
 addi s3 s2 4

 lw t3 0(s2)
 lw t4 0(s3)

 lh t5 0(t3)
 lh t6 0(t4)

 # We see if  tiles are zero
 beqz t5 leave
 beqz t6 leave
 # We see if the tiles are not equal
 bne t5 t6 leave

 # Now we merge
 add a4 t6 t5
 sh a4 0(t3)
 sh x0 0(t4)

 leave:
 addi t0 t0 1
 j loop

 done:
 lw s1 4(sp)
 lw s0 8(sp)
 lw ra 12(sp)
 addi sp sp 16
 jr ra
