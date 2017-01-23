;two strings of bytes are given
;if s1 is included in s2 then the variable rez will contain the postion in s2 where s1 is encountered
;else rez will be equal to ffh

assume cs:code, ds:data
data segment
	s db '123456abcdefgh15'
	len equ $-s
	s2 db '56abc'
	lens2 equ $-s2
	rez dw ?
	doi db 2
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	;we need to parse the first string and then we increment each position once with the second string as fllows
	;checking the matching between elements
	mov si, 0	;we begin at index 0 in the first string
	mov cx, len
	mov dx, lens2
	sub dx, len
	sub cx, dx	;we only parse a number of bytes in the first string until a position which makes it possible for s2 to be encountered
			;and the condition is for the index of parsing the first string to be always at a distance from the end of the string
			;that has the diff less or equal than the second length
	cld
	
	repeta:
		cmp si, dx
		je infi
		mov di, 0	;index to parse the second string
		push si
		mov bl, s2[di]
		mov bh, s[si]
		cmp bl, bh
		je continuare
		pop si
		inc si
		
continuare:
	inc si
	inc di
	cmp di, lens2
	je etic
	mov bl, s2[di]
		mov bh, s[si]
		cmp bl, bh
	je continuare
		loop repeta
etic:
mov rez, si
mov ax, 4c00h
int 21h	
infi:
mov rez, 0ffh
mov ax, 4c00h
int 21h
code ends 
end start