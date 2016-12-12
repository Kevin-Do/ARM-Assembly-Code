	@ inputTest
	@ Kevin Do


	.data
	.balign 4
prompt:	.asciz "Give me input friend: "
format:	.asciz "%d"
num:	.int 0
output:	.asciz "You gave me: %d \n"

	.text
	.global main
	.extern printf
	.extern scanf

main:	push	{ip, lr}

	ldr	r0, =prompt
	bl	printf

	ldr	r0, =format
	ldr	r1, =num
	bl	scanf

	ldr	r1, =num
	ldr	r1,[r1]
	ldr	r0, =output
	bl	printf
	pop	{ip, pc}
