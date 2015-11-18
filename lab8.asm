	;Andrew Bradley - abradl26
	;Cosc221-1	Fall 2015
	;Lab #8

	;Takes in positive single digit integers and continues
	;until the user enters a zero. It then outputs the largest integer

		.ORIG	x3000		
		
		LD		R0,ZERO		;prime the loop with zero
		ST		R0,NUM1		;store zero as first highest number
		
AGAIN	LEA		R0,MSG1		;display input prompt
		PUTS				;output
		GETC				;Read number from user
		ST		R0,NUM2		;Store user input to num2
		OUT					;echo user input
		LD		R1,TRIP		;load -48 to check for zero
		ADD		R1,R0,R1	;end if zero is entered
		
		BRz		QUIT		;go to end if zero entered
		
		NOT		R0,R0		;flip the bits of entered number
		ADD		R0,R0,#1	;add 1 to entered number
		LD		R1,NUM1		;reload current highest integer
		ADD		R1,R0,R1	;test if current highest integer is larger than the current integer
		BRn		NEWHIGH		;if new integer is higher, go NEWHIGH and store that integer
		
		LD		R0,CRLF		;CRLF sets p flag
		OUT
		BRp		AGAIN		;do process over
		
QUIT	LD		R0,CRLF		;CRLF sets p flag
		OUT					;output
		LEA		R0,MSG2		;display highest number prompt
		PUTS				;output the highest integer message
		LD		R0,NUM1		;the highest number
		OUT					;output highest number

		HALT
			
NEWHIGH	LD		R0,NUM2		;reload new high number		
		ST		R0,NUM1		;put new high number NUM1
		LD		R0,CRLF		;CRLF
		OUT					;output
		BRp		AGAIN		;do process over		
		
		;Data area
MSG1	.STRINGZ	"Please enter a single-digit integer "
MSG2	.STRINGZ	"Your largest number is: "
CRLF	.FILL	#10			;carriage return line feed

NUM1	.BLKW	1			;current high number
NUM2	.BLKW	1			;current user entered number

ZERO	.FILL	#48			;zero 0
POS1	.FIll	#49			;positive 1

TRIP	.FILL	#-48		;-48 checks if sentinal is entered

		.END