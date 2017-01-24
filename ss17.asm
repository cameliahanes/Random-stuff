;a string of doublewords is given
;obtained the string of bytes built with the high bytes from the low words of each doubleword given, which are multiples of 10

assume cs:code, ds:data1, es:data2
data1 segment
	s dd 12345678h, 1A2B3C4Dh, 0FE98DC76h
	len equ ($-s)/4
	zece db 10
	saispe db 16
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

	;store at each address register the data segment corresponding to it
	mov cx, len
	cld		;parse the string from left to right
	repeta:
		lodsw
		lodsw	;the low word
		;we work with the high byte
		mov al, ah
		mov ah, 0
		;in al we have the high byte from the low word of the doubleword
		;we need the digits
		;we first convert al to ax and then divide it by 10
		;in this way in ah will be stored the remainder of the division and in al the quotient
;next we perform the multiplication by 16 in base 10 and we obtain the numbr represented in base 10
;then we check for divisibility by 10
;in favorable case, we add it to the new string
		cbw	;signed conversion
		push ax		;store the hexadecimal value to be able to put it into the string
		idiv zece	;ah = ax%10 al = ax/10
		mov bh, ah
		mov ah, 0
		imul saispe	;ax = al * 16
		mov dx, ax
		mov al, bh
		mov ah, 0
		add dx, ax	;in dx we have the number in base 10
		mov ax, dx	;put it in ax in base 10
		idiv zece		;if in ah remains 0 then it means that the division can be performed successfully and the number is divisible by 10
		cmp ah, 0
		je adauga_in_sir
adauga_in_sir:
pop ax	;the number is actually stored in al so we can perform a stosb instruction without any problem
stosb
		loop repeta
;print the string

	mov cx, len
	mov di, 0
	tipareste:
		mov ah, 02h
		mov dl, d[di]
		add dl, '0'
		int 21h
		inc di
		loop tipareste
mov ax, 4c00h
int 21h
code ends
end start