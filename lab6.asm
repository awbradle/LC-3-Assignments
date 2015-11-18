	;Andrew Bradley - abradl26
	;Cosc221-1	Fall 2015
	;Lab #6

	;This programs converts three initials
	;from lower case to upper case and display
	;along the left margin	

		.ORIG	x3000

		LEA		R0,MSG1		;display input prompt
		PUTS		

		GETC				;Read the 1st character
		OUT					;echo character
		ST		R0,CHAR1	;safekeep character

		GETC				;Read the 2nd character
		OUT					;echo character
		ST		R0,CHAR2	;safekeep character

		GETC				;Read the 3rd character
		OUT					;echo character
		ST		R0,CHAR3	;safekeep character
		
		LD		R0,CRLF		;load CRLF
		OUT					;display new line

		LEA		R0,MSG2		;display output prompt
		PUTS

		LD		R0,CRLF		;load CRLF
		OUT					;display new line
		
		LD		R0,CHAR1	;reload 1st character
		LD		R1,NEG32	;load -32
		ADD		R0,R0,R1	;add -32 to character, convert to uppercase
		OUT					;output now uppercase character

		LD		R0,CRLF		;load CRLF
		OUT					;display new line

		LD		R0,CHAR2	;reload 2nd character
		LD		R1,NEG32	;load -32
		ADD		R0,R0,R1	;add -32 to character, convert to uppercase
		OUT					;output now uppercase character

		LD		R0,CRLF		;load CRLF
		OUT					;display new line

		LD		R0,CHAR3	;reload 3nd character
		LD		R1,NEG32	;load -32
		ADD		R0,R0,R1	;add -32 to character, convert to uppercase
		OUT					;output now uppercase character

		LD		R0,CRLF		;load CRLF
		OUT					;display new line

		HALT			;stop execution

		;Data area
MSG1	.STRINGZ	"Please enter three initials in lower case>"
MSG2	.STRINGZ	"Here are the initials in upper case: "
CRLF	.FILL	#10		;carriage return line feed
CHAR1	.BLKW	1		;first initial
CHAR2	.BLKW	1		;second initial
CHAR3	.BLKW	1		;third initial
NEG32	.FILL	#-32	;changes lower to upper case

		.END