;convert string of bytes from lw to upper case

assume cs:code, ds:data
data segment
	s db 'a', 'v', 'x', 'a', 'c'
	l equ $-s
data ends

data2 segment
	d db l dup (?)
data2 ends

code segment
start:
	push data1
	pop ds
	push data2
	pop es
	mov cx, l
	mov si, offset s	;what is diferent from the approach from low.asm is that in low.asm the SI register represents
				;an index in string s. in this program SI represents the offset of the string s in the data segment data1
				;which has the address in DS segment
	mov di, offset d	;in DI is retained the offset of string d in the data segment data2 (the segment in which the d string is declared)
				;which has the address in the ES segment
	jcxz Sfarsit
	Repeta:
		mov al, byte ptr ds:[si]	;in al is retained the byte from index SI from the string s
		inc si
		sub al, 'a'-'A'
		mov byte ptr es:[di], al	;the upper-case corresponding character
`		inc di
		loop Repeta
Sfarsit:
	mov ax, 4c00h
	int 21h
code ends
end start