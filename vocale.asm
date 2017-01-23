;obtain the number of vocals from a string of characters
;we will use an auxiliary string which will contain all vocals
;the source string will be parsed and we will check each character from the string if it is found in the string of variables
;if yes, a variable will be incremented (it is initially set to 0) and at the end it will contain the number of vocals in the initial string


assume cs:code, ds:data
data segment
	s db 'Acesta este sirul sursa'
	l EQU $-s	;the number of characters from the source string
	vocale db 'aeiouAEIOU'
	lvoc EQU $-vocale	;number of chars in the vocale string
	nr db ?
data ends
code segment
start:
	mov ax, data
	mov ds, ax
		;in ds we have the starting address of the data segment which contains the source string s
	mov es, ax
		; in es we have the strting address of the data segment in which vocale string is found', as well as the source string
	mov cx, l	;the length of the source string is stored in cx in order to be able to eventually perform a loop intruction
	lea si, s	;we put in si the offset of the source string
	cld	;parse the initial string from left to right
	mov nr, 0	;we start from 0 vocals in the string and increment nr each time a vocal is encountered
	jcxz sfarsit
repeta:	
	lodsb	;we put in al the byte from address ds:si and si increases with 1 because direction flag is set to 0
		;this means that at the next call of lodsb in al will be stored the next read byte from the source string
	lea di, vocale	;indexed with DI
			;for each character from the source string 'vocale' will be parsed and we check the equality of the two compared chars
	push cx	;store the value of cx for the source string n order to be able to come back to it after performing a loop instruction on the vocale string
	mov cx, lvoc	;store in cx the length of vocale, to be parsed for comparisons
	repne scasb
		;scasb instruction compares the value resident in AL register with the byte from the address es:di and it sets the flags accordingly 
		;t the results of the comparisons (like cmp instructions), DI being incremented after that because the direction flag is set to 0
		;repne (repeat while not equal) determines the repeated execution of scasb instruction until cx becomes 0 or a matching occurs
		;-in this case ZF is 1
	jnz nu_e_vocala
	pop cx		;restaurate th value of cx and we continue with parsing the initial string
loop repeta
sfarsit:
mov ax, 4c00h
int 21h
code ends
end start 