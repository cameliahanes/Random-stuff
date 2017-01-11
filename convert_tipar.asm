assume cs:code, ds:data
data segment public
	tmp db 5 dup(?), 13, 10, '$'
	tableV db '0123456789ABCDEF'
data ends
public convert_tipar	;this subprogram is visible in other modules too

code segment public
displayBase16 proc
	mov cx, 4	;the number of bits in a 16 based digit
	repeat16:
		mov dx, 0	;the register used in order to isolate a group of 4 bits
		push cx
		mov cx, 4
		repeat4:		
			rol ax, 1
			rcl dx, 1
		loop repeat4
		pop cx
		push ax		;we save the value of ax because we will need the register ax in order to
				;use the xlat instruction
		mov al, dl	;the hexadecimal digit obtained in dx is a number which is less than 16, so it
				;can be covered by the number of bits of representation available in dl
		mov bx, offset tableV
		xlat tableV
;the xlat instruction determines the program to put in al the value from the index ds:[bx+al]
		mov dl, al
		mov ax, 02h
		int 21h
		pop ax
	loop repeat16
	ret
displayBase16 endp

convert_tipar:

;input ax: the number that has to be converted and printed on screen
;the subprogram converts and prints the number in base 16 on the screen
;we save register so we can use them inside the program

	call displayBase16
	ret
code ends
end