assume cs:code, ds:data
data segment
	maxfilename db 15
	lfile db ?
	filename db 15 dup(?)
	nonemessage db "File not found!$"
	buffer db 200 dup(?)
	pos dw ?, '$'
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	;read the name of the file
	mov ah, 0Ah
	mov dx, offset maxfilename
	int 21h

	;we read the character
	mov ah, 01h
	int 21h

	;now in al we have the result
	mov bl, al
	mov bh, 0
	
	push bx

	;asciiz
	mov al, lfile
	mov ah, 0
	mov si, ax
	mov filename[si], 0

	;open file
	mov ah, 3dh
	mov al, 0
	mov dx, offset filename
	int 21h
	mov bx, ax	;file handle
	
	;read from file
	mov ah, 3fh
	mov cx, 200	;number of bytes to read	
	mov dx, offset buffer
	int 21h

	mov si, 0
	mov cx, ax	;the number of read bytes
	pop bx
	bucla:
		mov al, buffer[si]
		mov ah, 0
		cmp ax, bx
		je enddd
		add si, 1
		loop bucla
	enddd:		
		mov ah, 09h
		add si, 1
		mov pos, si
		mov dx, offset pos
		int 21h
		mov ax, 4c00h
		int 21h
	
	endnotfound:
		mov ah, 09h
		mov dx, offset nonemessage
		int 21h
		mov ax, 4c00h
		int 21h
		
code ends
end start