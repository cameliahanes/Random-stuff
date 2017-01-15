;write in a file the numbers existing between two given numbers
assume cs:code, ds:data
data segment
	nom1 dw 12
	nom2 dw 50
	filename db 20, ?, 10 dup(?)
	buffer dw ?
	message db "Give the name of the file: ", "$"
	number dw ?
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	
	;display the message - interface to obtain the name of the file
	mov ah, 09h
	mov dx, offset message
	int 21h

	

	;read the name of the file
	mov ah, 0Ah
	mov dx, offset filename
	int 21h

	mov ah, 02h
	mov dl, 13
	int 21h
	mov ah, 02h
	mov dl, 10
	int 21h

	;open file to read
	mov ah, 3dh
	mov al, 2	;read and write
	mov dx, offset filename
	int 21h
	
	mov ah, 3Fh
	mov bx, offset filename
	mov cx, 4
	mov dx, offset buffer
	int 21h

	mov si, 0
	mov ax, buffer[si+1]
	mov bx, buffer[si]
	sub ax, bx
	mov cx, ax	;the number of numbers to be written

mov number, bx
	bucla:
		push cx
		mov ah, 40h
		mov bx, offset filename
		mov cx, 4
		mov dx, number
		int 21h
		mov dx, number
		add dx, 1
		mov number, dx
		pop cx
		loop bucla

mov ah, 3eh
mov bx, offset filename
int 21h
;closed the file

mov ax, 4c00h
int 21h

code ends
end start