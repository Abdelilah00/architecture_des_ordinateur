.data 
message1: .asciiz "Taper le Nb du Notes : "
message2: .asciiz "la note "
message2_1: .asciiz ":"
message3: .asciiz "\nla Min est : "
message4: .asciiz "\nle Max est : "
message5: .asciiz "\nle nobre du notes super à 12 est  : "

.text
main:
#innitialisation des variable
	addi $t0,$zero,0
	addi $t1,$zero,20
	addi $t2,$zero,0
	addi $t4,$zero,0
	addi $t9,$zero,0
#diplay message Taper le Nb du Notes
	li $v0,4
	la $a0,message1
	syscall
#lire le Nb du notes
	li $v0,5
	syscall
# move for use V0 in other time
	move $t3,$v0
#boucle pour
	while:
		bge $t4,$t3,exit
		#display message La Note iéme
		li $v0,4
		la $a0,message2
		syscall
		li $v0,1
		addu $a0,$t4,1
		syscall
		li $v0,4
		la $a0,message2_1
		syscall
		
		#lire la note
		li $v0,5
		syscall
		# move for use V0 in ther time
		move $t5,$v0
		
		#if(note>max)
		MaxTest:
		 sgt $t7,$t5,$t0
		 beq $t7,1,MAX
		#if(note<min)
		MinTest:
		 sgt $t7,$t1,$t5
		 beq $t7,1,MIN
		#Les Notes Super à 12
		Super12:
		 sge  $t7,$t5,11
		 beq $t7,1,Super
		Incre:
		#incrémntation du compteur
		 addi $t4,$t4,1
		 j while
		 
	exit:
		#display La Min
		li $v0,4
		la $a0,message3
		syscall
		li $v0,1
		move $a0,$t1
		syscall
		
		#display Le Max
		li $v0,4
		la $a0,message4
		syscall
		li $v0,1
		move $a0,$t0
		syscall
		
		#diplay les Notes Super à 12
		li $v0,4
		la $a0,message5
		syscall
		li $v0,1
		move $a0,$t2
		syscall
		
		#the programme is done
		li $v0,10
		syscall
	MAX:
		move $t0,$t5
		j MaxTest
	MIN:
		move $t1,$t5
		j MinTest
	Super:
		addi $t2,$t2,1
		j Incre
