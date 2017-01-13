assume cs:code, ds:data
data segment
	filename db 10, ?, 10 dup (?)
	extension db 5, ?, 5 dup (?)
	message1 db "Give the name of the file: ", "$"
	message2 db "Give the extension: ", "$"
	aux db ?
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	mov ah, 09h
	mov dx, offset message1
	int 21h

	;now we read the name of the file
	mov ah, 0Ah
	mov dx, offset filename
	int 21h

	mov ah, 02h
	mov dl, 10
	int 21h
	mov ah, 02h
	mov dl, 13
	int 21h

	
	;now we read the extension
	mov ah, 09h
	mov dx, offset message2
	int 21h

	mov ah, 0Ah
	mov dx, offset extension
	int 21h

	mov ah, 02h
	mov dl, 10
	int 21h
	mov ah, 02h
	mov dl, 13
	int 21h

	mov cl, byte ptr filename[1]
	mov ch, 0
	mov si, cx	
	mov bp, 2
	mov filename[si], "."
	inc si		

	mov cx, 3
	bucla:
		mov al, extension[bp]
		mov filename[si], al
		inc bp
		inc si
	loop bucla

	;create file

	mov cx, 00h
	mov ah, 3ch
	mov dx, offset filename[2]
	
	int 21h
	mov ax, 4c00h
	int 21h
code ends
end start

	