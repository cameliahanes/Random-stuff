;a string of bytes is given
;obtain the reversed string

assume cs:code, ds:data
data segment
	s db 17, 20, 42h, 1, 10, 2Ah
	len_s equ $-s
	t db len_s dup (?)
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	;we prepare for performing string instructions
	;in the register ds:si we store the FAR address (segment:offset) of the source string s and in es:di we store the FAR address of the 
	;destination string (the reversed string) so that the strings will be parsed from left to right
	;we will change alternatively the value stored in DF flag

	mov es, ax	;the instr mov ax, data makes so that in ax is stored the address of the data segment
	;es and ds contain the offset of the data segment

	lea si, s	;offset of the first element from the source string
			;it will be parsed from left to right
	lea di, t
	add di, len_s-1
			;end of the second string
		;lea (as a difference from offset) allows indexation of parameters because it computes the offset at the execution time
	mov cx, len_s	;both strings (s and t) are parsed in a loop with len_s iterations
	jcxz sfarsit	;if cx = 0 we jump to the end of the program
repeat:
	cld	;the first string is parsed from left to right, DF is set to 0
	lodsb 	;equivalent with mov al, byte ptr ds:[si]	inc si
	std	;the second string is parsed from right to left - DF = 1
	stosb 	
	loop repeat
sfarsit:
	mov ax, 4c00h
	int 21h	;end the program wth return code 0
code ends
end start
	