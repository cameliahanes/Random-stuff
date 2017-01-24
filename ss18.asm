;a string of double words is given
;build a second string of bytes containing the bytes existing in the structure of the existing doublewords

assume cs:code, ds:data1, es:data2
data1 segment
	s dd 12345678h, 1A3C4Dh, 76h
	len equ $-s
data1 ends

data2 segment
	d db len dup (?)
data2 ends

code segment
start:
	push data1
	pop ds
	push data2
	pop es

	cld
	mov cx, len
	mov di, 0
	repeta:
		cld
		add di, 4
		push di
		lodsw	;extract every byte from the structure (some bytes may have the value 00h but we also take tem because they take part to the structure of each doucleword they are in)
		push ax
		lodsw
		push ax
		std	;set the direction flag
		mov al, ah
		stosb
		pop ax
		stosb
		pop ax
		push ax
		mov al, ah
		stosb
		pop ax
		stosb
		pop di
		;add di, 4
	loop repeta
	
mov si, 0
mov cx, len
tipareste:
	mov ah, 09h
	mov dl, d[si]
	add dl, '0'
	int 21h
	inc si
	loop tipareste
mov ax, 4c00h
int 21h
code ends
end start