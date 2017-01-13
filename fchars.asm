;read from the standard input the name of a file, print it's contents on the screen

assume cs:code, ds:data
data segment
	message db "Give the name of the file: $"
	maxfilename db 12
	lfilename db ?
	filename db 12 dup (?)
	buffer db 100 dup (?), "$"
	openerrormsg db "File doesn't exist! $"
	readerrormsg db "Can't read file! $"
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	;print the string message on the screen 
	mov ah, 09h
	mov dx, offset message
	int 21h

	;read from the keyboard the name of the file
	mov ah, 0Ah
	mov dx, offset maxfilename
	int 21h

	;after the interrupt handling routine is executed, the name of the file will be
	;stored at the address maxfilename + 2 = filename
	;the byte from the offset maxfilename + 1 = lfilename will store the length
	;of the filename

	;we transform the filename into an asciiz string (put zero at the end)
	mov al, lfilename
	xor ah, ah
	mov si, ax
	mov filename[si], 0

	;open the file using the 3dh function of interrupt 21h
	mov ah, 3dh
	mov al, 0	;open file for reading
	mov dx, offset filename
	int 21h

	jc openerror	;cf is set by the cpu when an error occurs
	mov bx, ax	;save the filehandle

	;while we have not reached the end of the file we keep reading 100 bytes

	goon:
		mov ah, 3fh
		mov dx, offset buffer
		mov cx, 100	;read max 100 chars
		int 21h
		jc readerror
	;upon success, in ax are stored the number of bytes read from the file
	;we save this number in si and prepare the string for being displayed
	; add "$" at end
	mov si, ax
	mov buffer[si], "$"

	;print on the screen the text read with function 09h of int21
	mov ah, 09h
	int 21h
	cmp si, 100
	je goon	;if we had successfully read 100 bytes it means that we have not reached the end of the file
jmp endprogram

openerror:
	mov ah, 09h
	mov dx, offset openerrormsg
	int 21h
	jmp endprogram

readerror:
	mov ah, 09h
	mov dx, offset readerrormsg
	int 21h

endprogram:
	mov ax, 4c00h
	int 21h

code ends
end start