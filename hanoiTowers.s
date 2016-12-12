	@ HanoiTowers Puzzle
	@ Kevin Do
	@ COMPE 271 Assembly Final Project
	@ 818381662
	@ Professor Ken Arnold

	.data
	.balign	4
	
prompt:	.asciz	"\n Welcome to the Hanoi Towers! \n How many discs would you like to play with? \n"
format:	.asciz	"%d"
string:	.asciz	"Go ahead and move disc %c to %c\n\0"
peg1:	.int	'A'
peg2:	.int	'B'
peg3:	.int	'C'
n:	.int	4

	.text
	.global main
	.extern printf
	.extern scanf

retrieveNumberOfDisks:
	push	{ip, lr}
	ldr	r0, =prompt	@ print the introduction and question
	bl	printf

	ldr	r0, =format	@ get user input
	ldr	r1, =n
	bl	scanf

	pop	{ip, pc}

moveDisks:
	push	{r4 - r8, lr}
	cmp	r4, #1
	bgt	moveNMinus1Disks

moveOneDisk:
	ldr	r0, =string	@ printf move statement
	mov	r1, r5	@ 40
	mov	r2, r6
	bl	printf
	b	endRecurse

moveNMinus1Disks:
	mov	r8, r7		@ move( n-1, A, B, C)
	mov	r7, r6
	mov	r6, r8
	sub	r4, #1
	bl	moveDisks

	mov	r8, r7
	mov	r7, r6
	mov	r6, r8

	ldr	r0, =string	@ move( 1, A, B, C)
	mov	r1, r5
	mov	r2, r6
	bl	printf

	mov	r8, r5		@ move( n-1, B, C, A)
	mov	r5, r7
	mov	r7, r8
	bl	moveDisks

endRecurse:
	pop	{r4 - r8, pc}

main:
	push	{ip, lr}

	bl	retrieveNumberOfDisks

	ldr	r4, =n		@ get number of disks from user
	ldr	r4, [r4]
	ldr	r5, =peg1	@ load the pegs for the puzzle
	ldr	r5, [r5]
	ldr	r6, =peg2
	ldr	r6, [r6]
	ldr	r7, =peg3
	ldr	r7, [r7]

	bl	moveDisks	@ start recursive function

	pop	{ip, pc}
	
