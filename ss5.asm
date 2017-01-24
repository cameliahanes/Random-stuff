;a string of bytes is given
;if the length of the string is even, then the byte with i rank will be compared to the byte with rank n-i, where n is the length of the string
;in case they are equal, both bytes will be replaced with 1
;else 1 will be put at the index of the greater byte and 0 at the index where the byte has the smaller value

assume cs:code, ds:data
data segment
	sir db 1, 9, 2, 5, 23, 46, 7, 11, 56, 32, 4, 10
		;0, 1, 0, 0, 1, 1, 0, 0,  1,  1,  0, 1
	len equ $-sir
	doi db 2
data ends
code segment
start:
	push data
	pop ds

	mov si, 0
	mov di, len
	sub di, 1
	;now in si we have 0 and in di we have the index of the last element in the string
	mov ax, len
	div doi
	mov cx, ax
	repeta:
		cmp si, di
		jg tipareste
		mov al, sir[si]
		mov ah, sir[di]
		cmp al, ah
		jl first_less
first_less:
mov sir[si], 0
mov sir[di], 1
inc si
dec di
		jge first_greater
first_greater:
mov sir[si], 1
mov sir[di], 0
inc si
dec di	
		loop repeta

	mov si, 0
	mov cx, len
	tipareste:
		lodsb
		;in al we have the number
		mov ah, 02h
		mov dl, al
		add dl, '0'
		int 21h
		loop tipareste
code ends
end start