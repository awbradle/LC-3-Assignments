	;Andrew Bradley - abradl26
	;Cosc221-1	Fall 2015
	;Lab #7

	;This programs takes in two digits and adds
	;them together. it outputs the sum on the next line

		.ORIG	x3000

		LEA		R0,MSG1		;display input prompt
		PUTS		

		GETC				;Read the 1st number
		OUT					;echo character
		ST		R0,NUM1		;safekeep character

		GETC				;Read the 2nd number
		OUT					;echo character
		ST		R0,NUM2		;safekeep character
		
		LD		R0,CRLF		;load CRLF
		OUT					;display new line
		LEA		R0,MSG2		;display output prompt
		PUTS

		LD		R0,NEG48	;load -48 into R0
		LD		R1,NUM1		;reload 1st character
		LD		R2,NUM2		;reload 2nd character
		ADD		R1,R1,R2	;add two numbers, store in R1
		ADD		R0,R0,R1	;subtract 48 from sum to get back to numbers in ascii
		ST 		R0,SUM		;store R0 sum in SUM
		
		LD		R1,NEG58	;load -58 to check if number < 10
		ADD		R1,R0,R1	; subtracting 58 to check if number < 10
		BRzp	TEN			;If sum greater than or equals 10, go to TEN
		OUT					;output sum	if < 10		

		HALT				;stop execution

TEN		LD 		R0,POS49	;print a "1" to represent 10 digit
		OUT					;output the 1 digit
		LD		R0,SUM		;Reload SUM into R0
		ADD		R0,R0,#-10	;Subtract 10 from sum to just get one's digit in ascii
		OUT					;output sum -10
		
		HALT				;stop execution
		
		;Data area
MSG1	.STRINGZ	"Please enter two numbers "
MSG2	.STRINGZ	"Your sum is: "
CRLF	.FILL	#10			;carriage return line feed
NUM1	.BLKW	1			;first number
NUM2	.BLKW	1			;second number
SUM		.BLKW	1			;sum
POS49	.FILL	#49			;positive 1
NEG48	.FILL	#-48		;negative 48
NEG58	.FILL	#-58		;negative 58



		.END