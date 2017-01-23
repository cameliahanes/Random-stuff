;a string of bytes is given
;create a new string of the same length, which will contain just those bytes from the given string which have the number of 1 bits bigger then the number
;of 0 bits, or those bytes which have the value between 1Fh and 60h
;the remaining bytes will be completed with 0

assume cs:code, ds:data
data segment
	s db 11, 32, 18, 60, 35, 100, 12
	len equ $-s
	s2 db len dup (?)
	aux db ?
	ones db ?
	zeros db ?
	doi db 2
data ends
code segment

start:
	mov ax, data
	mov ds, ax

	mov si, 0
	cld
	mov cx, len
	jcxz sfarsit
	repeta:
		lodsb 	;al = the next byte
		mov aux, al
		mov ah, 0
		mov ones, 0
		mov zeros, 0

		imparte:
			cmp al, 0
			je etic
			cbw
			idiv doi
			cmp ah, 1
			je add_ones
			inc zeros
			jmp imparte
	loop repeta
add_ones:
	inc ones
	jmp imparte

etic:
	mov bl, ones
	mov dl, zeros
	cmp bl, dl
	ja adauga
	cmp aux, 1Fh
	ja check_upperbound

check_upperbound:
	cmp aux, 60h
	jb adauga

adauga:
	mov al, aux
	mov byte ptr s2[si], al
	inc si
	jmp repeta

sfarsit:
	cmp si, len
	jb add_zeros
add_zeros:
	inc si
	mov byte ptr s2[si], 0
	cmp si, len
	jb add_zeros
	mov ax, 4c00h
	int 21h
	
code ends
end start