assume cs:code, ds:data
data segment
	newLine db 10, 13, '$'
	message db "Choose the base for the content to be displayed in: (a, b, c)", 10, 13, 9, 'a. Base 2; ',10,13,9, 'b. Base 10; ', 10,13,9, 'c. Base 16; ', 10,13,'$'
	ten dw 10
	tableV db '0123456789ABCDEF'
data ends

code segment
; here is the procedure to display the number from AX register in base 2
;we use bit instructions in order to shift to left the entire configuration
;after each operation, the bit contained by the CF flag (the bit which exits the configuration) will be displayed

displayBase2 proc
	mov bx, ax
	mov cx, 16	;we want the binary configuration, so we will need to shift the configuration 16 times to left
			;in order to obtain every digit
	repeat2:
		shl bx, 1
		jc one	;we jump to the label where "1" is displayed if the carry flag is set to 1 and "0" is displaed otherwise
		mov ah, 02h	;we use the function 02h of the interrupt 21h in order to display the character
		mov dl, '0'	;in dl we store the ascii code of the character to be displayed
		int 21h		;int 21h => the call of this interrupt displays the character with the ascii code from dl
	loop repeat2
		;the loop will be repeated cx times (16)
	jmp endDisplay2

	one:
		mov ah, 02h
		mov dl, '1'
		int 21h
	loop repeat2
	endDisplay2:
		ret	;the ret instruction pops from the stack the returning address and makes the jump to that 
			;address
displayBase2 endp

;the following instructions will be for the number in base 10
;here we must pay attention to the form of the number which can be positove ir negative

displayBase10 proc
	cmp ax, 0
	jge positive

	negative:
		neg ax
	;if the number if negative we must display the - sign in front of the absolute value of the number
	mov dl, '-'
	mov ah, 02h
	int 21h
	
	positive:
		mov cx, 0	;here we count the number of digits
		repeat10:
			mov dx, 0	;we extend ax to double word in order to avoid 0 interrupt generated
					;by a possible "unfit" in memory of the result obtained by dividing
					;the number by 10
			div ten	
			push dx		;we put the result on the stack, dl would be incorrect because the stack is organized on words
			inc cx		;we increment the number of digits found
			cmp ax, 0	
			jne repeat10

;the digits found are on the stack so now it only remains for the programmer to pop them and display each of them
;we will have them in the correct order due to the principle last in first out

	repeatDisplay:
		pop dx		;we extract the value of the number at the current state in the stack to the dx register
		add dl, '0'	;the ascii code of the charscter we want to display is stored in dl
		mov ah, 02h
		int 21h
	loop repeatDisplay
	ret
displayBase10 endp

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

start:
	push data
	pop ds
	push ax		;we save ax on the stack because every insteuction will work with this register
	mov ah, 09h	;the function to display a message until we reach the $ symbol
	mov dx, offset message	
	int 21h
	
	mov ah, 08h
	int 21h
	;the 08h function reads an input character without echo; in al will this character be stored
	cmp al, 'a'
	jne checkB
	pop ax
	call displayBase2
	jmp enddd
	checkB:	
		cmp al, 'b'
		jne checkC
		pop ax
		call displayBase10
		jmp enddd
	checkC:	
		cmp al, 'c'
		jne enddd
		pop ax
		call displayBase16
	enddd:
		mov ah, 09h
		mov dx, offset newLine
		mov ax, 4c00h
		int 21h
code ends
end start