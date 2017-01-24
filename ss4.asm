;two strings of bytes are given
;build the third string of bytes as follows: for each byte from the second string, the third string will contain the position of the current element
;in the first string i it exists and 0 otherwise

assume cs:code, ds:data1, es:data2
data1 segment
	s1 db 17, 23, 56, 20, 45
	len1 equ $-s1
	s2 db 23, 54, 20, 23, 12, 17, 19, 45
	len2 equ $-s2
data1 ends
data2 segment
	s3 db len2 dup (?)
data2 ends
code segment
start:
	mov ax, data1
	mov ds, ax
	mov ax, data2
	mov es, ax

	mov si, 0	;with si the second string will be parsed
	mov di, 0	;for the second string to be able to use stosb
	mov cx, len2	;perform a main loop len2 times for checking each element from the second string
	cld	;parse from left to right
	
	jcxz sfarsit
	mov bx, 0	;to parse the first string in another loop instruction
		
	repeta:
		push cx
		;save the value of cx for the main loop and reinitialize it with the length of the first string to parse each time
		mov cx, len1
		cld
		verifica:
			mov al, byte ptr s1[bx]
			mov ah, byte ptr s2[si]
			cmp al, ah
			je adauga_index
			inc bx
			loop verifica	
mov al, 0
stosb
		pop cx
		inc si
adauga_index:
mov ax, bx
stosb 
		loop repeta
sfarsit:
	mov ax, 4c00h
	int 21h
code ends
end start