;a string of lowercase letters is given
;obtain a new string containing all the letters from the previous string in upper-case form

assume cs:code, ds:data
data segment
	s db 'a', 'v', 'x', 'a', 'c'
	;equivalent with 'avxac'
	l equ $-s
	;$ - location counter - has the value of the counted bytes until a certain point
	;l db $-s
	d db l dup (?)
	;we allocate space for the resulted string d, which will have the same length as the initial string
	;dup operand is used to reserve a memory block of length l;
	;the presence of '?' character in this declaration has as effect the reserving of that memory block in that memory area
	;without initialising it with any values
	;if we wated to initialize with 0 that memory area we would have used: d db l dup (0)
	;if we had used for declaration l db $-s, then the value of l wouldn't have been determined at assembly time, which means that
	;it couldn't be used for reserving memory space in instruction such as l db dup (?) because l wouldn't have been known yet
	;which would have resuled in an assembly error displaying the message "Expecting scalar type"
	;another difference is that using EQU wouldn't request bytes generating bt using db provides the generating of a byte
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov cx, l	;put in cx the length of the string because we will use the loop instruction  for the repeating of a set of instructions
	mov si, 0	;index for the two strings
	jcxz Sfarsit
		;we will use the loop instruction which executes CX times, reason for which we make sure that the value from CX is different from
		;0 befre we enter the loop; if it is 0 when we enter the loop then the instruction would be executed 65535 times

	Repeta:
		mov al, byte ptr s[si]
		;in al we copy the byte found in the data segment at offset of s + si bytes
		;we obtain the byte of range SI from s, where the first bytes has the 0 range
		; in this moment we will hav the ascii code of a lower-case character from s
	;because of the BYTE type of the data, we are able to write this instruction:
	mov al, s[si]
	sub al, 'a'-'A'
	;in order to obtain the upper-case letter corresponding to the lower-case already existing letter from the given string, 
	;we subtract from every lower-case letter the number which represents the difference between every pair of such characters (lower, upper)
	;the difference between ascii codes is the same between each pair of this form
	mov byte ptr d[si], al		;the character obtained is put into the  destination string d, on the same position as the 
					;lower-case character in the source string
	;also mov s[di], al is correct
	inc si		;we go to the next byte from the string
		loop Repeta
Sfarsit:
	mov ax, 4c00h
	int 21h
code ends
end start 