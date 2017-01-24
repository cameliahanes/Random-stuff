;a string of words is given
;find the index of the first negative number

assume cs:code, ds:data
data segment
	s dw 11, 13, 45, 67, 89, 150, 2356, -1900, 25, 678, 345
	len equ ($-s)/2
	index dw ?
data ends
code segment
start:
	push data
	pop ds
	
	cld	;parse rom left to right
	mov cx, len
	repeta:
		lodsw
		cmp ax, 0
		jl index_found	
index_found:
mov index, si
jmp sfarsit
	loop repeta


sfarsit:
	mov ax, 4c00h
	int 21h
code ends
end start