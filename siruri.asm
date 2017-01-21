;a string of bytes is given
;the cntent of each byte will be interpreted as a signed number
;copy the from the string to another string those bytes whose nmber of 1 bits is even
;calculate the number of copied bytes to the second string and calculate also their sum


assume cs:code, ds:data
data segment
	sirS db 10, -100, 31, 55, -10
	lung equ $-sir
	sirD db lung dup (?)
	nr db ?
	sum dw ?
data ends
code segment

numara proc
	;proc procedure has as input the "parametru" parameter, from the stack
	;in AL will be calculated the number of 1 bits from the bit configuration of the byte given as input
	;the next two instructions represent the so-called isolationg oeration of the stack
	;we put on the stack the value of BP register (we save it to be albe to restore it before exiting the procedure)
	;and we copy the value of the register SP in BP (now BP will indicate the top of the stack, becoming a new base of the stack for the
	;operations performed in the procedure
	
	push bp	
	mov bp, sp
	
	;in this moment the top of the stack has the following structure:
	;at the offset [BP] is the value of the register BP from the moment of entrance in the procedure
	;at the offset [BP+2] is the return address 
	;at [BP+4] is the value of the parameter transmitted to the procedure
	
	mov bl, byte ptr [bp+4]
	mov al, 0
	
	;in order to count the bits we will need to rotate 8 times the value of the bl register and add the carry flag to al
	
	mov cx, 8
	
	rotire:
		rol bl, 1
		adc al, 0
		loop rotire
	mov sp, bp	;the remake of the top of the stack	
	pop bp
	retn 2		;we indicate the exit from the current routine with the pop of two bytes from the stack
			;which represent the parameter of the procedure 
numara endp

start:	
	mov ax, data
	mov ds, ax
	mov es, ax
	mov sum, 0
	mov nr, 0
	;we will use lodsb, stosb to parse the string 
	;lodsb will put in al the byte from DS:SI, increments SI if DF = 0 or decrements it if DF = 1
	;stosb copies from AL the byte from ES:DI, increments the value from DI if DF = 0 or decrements it otherwise
	
	lea si, sirS 		;offset of the first string
	lea di, sirD		;offset of destination string
	mov cx, lung
	cld			;df is set to 0 => the direction in the parse of the two strings is from left to right
	
	repeta:	
		lodsb
		cbw		;while the bytes will be interpreted as signed numbers, we will convert AL into AX
		mov dx, ax	;in the count proc the content of AX will be changed so we need to save it on other register
		push cx		;we save cx on the stack because it will be modified in the procedure numara
		push ax		;we put ax on the stack
		call numara	;after the return, in AL will be stored the number of 1 bits from the representation of the current number
		pop cx		;restore the initial value of cx, before the call
		shr al, 1	;we shift al with 1 position and if the CF is 1, then we know that the number had an off number of 1 bits
		jc end_repeat	;we jump to the instruction end_repeat if the number of 1 bits is odd because the byte won't be taken into account
		inc nr
		add sum, dx	;we add the content of the byte (it is known that at this point the content of dx has an even number of 1 bits)
		mov al, dl	;we copy in al the content which will be stored in sirD
		stosb		;we put at the address ES:DI (sirD) the content of AL
		

		end_repeat:
			loop repeta	;decrements cx, if cx != 0, a jump to the address of "repeta"
	mov ax, 4c00h
	int 21h
code dnds

stiva segment STACK		;we define an stack segment for which we allocate 64h = 100 bytes
	org 64h
stiva ends

end start	;end of the program