;two strings of bytes are given
;parse the two strings until you get to the length of the shortest string from the two given
;and build the third string containing the greatest value existing at the same index in the two given strings
;and then until reaching the length of the longest string fulfill alternately the string with 0s and 1s

assume cs:code, ds:data
data segment
	s db 10, 3, 5, 12, 8, 19, 35, 20, 45, 11
	len equ $-s
	p db 9, 14, 3, 15, 99, 1
	len2 db ?
	r db len dup (?)
	minlen db ?
data ends
code segment
start:
	push data
	pop ds

	mov si, 0		;for parsing the strings from left to right
	cld 	;clear direction flag
	mov cx, offset len2
	sub cx, len
	;so we obtained the length of second string
	mov len2, cl	;it is enough
	mov bl, len
	mov bh, len2
	cmp bl, bh
	jle set_len_1
	mov al, len2
	mov minlen, al
set_len_1:
mov al, len
mov minlen, al

	;now the minimum length is set 
	mov cl, minlen	;put it in reg cx for being able to execute a loop instruction
	mov ch, 0
	cld
	repeta:
		mov bl, byte ptr s[si]
		mov bh, byte ptr p[si]
		cmp bl, bh
		jle set_first
		mov r[si], bl
		inc si
set_first:
mov r[si], bh
		loop repeta
mov cl, len
sub cl, minlen
seteaza:
	cmp si, len
	je final
	mov r[si], 1
	inc si
	cmp si, len
	je final
	mov r[si], 0
	dec cx
	loop seteaza
final:
	mov ax, 4c00h
	int 21h
code ends
end start