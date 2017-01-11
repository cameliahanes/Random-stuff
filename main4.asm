;4. A string of numbers is given. Print on the screen the values in base 16.

assume cs:code, ds:data
data segment public
	sir dw 20, 125, 330, 27, 19, 570
	final_sir label word
data ends

code segment public
extrn tipar:proc
start:
	mov ax, data
	mov ds, ax

	mov si, offset sir
	cld	;clear the direction flag in order to be able to
		;parse the string of words from left to right
	bucla:
		cmp si, offset final_sir
		je final
		lodsw
		call tipar
	jmp bucla
	final:
	mov ax, 4c00h
	int 21h
code ends
end start