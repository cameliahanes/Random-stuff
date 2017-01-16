assume cs:code, ds:data
data segment
	handle dw ?
	buffer db 6 dup (?)
	file db 'C:\HH\number.txt'
	number dw ?
	tabela db '0123456789ABCDEF'
	aux dw 153
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	;open file
	mov ah, 3dh
	mov al, 0
	mov dx, offset file
	int 21h
	mov handle, ax	

	mov ah, 3fh
	mov bx, handle
	mov cx, 4
	mov dx, offset number
	int 21h

	
mov cx, 4
	repeat16:
		mov dx, 0
		push cx
		mov cx, 4
		repeat4:
			rol ax, 1
			rcl dx, 1
			loop repeat4
		push ax
		mov al, dl	
		mov bx, offset tabela
		xlat tabela
		mov ah, 02h
		mov dl, al
		int 21h
		
		pop ax	
		pop cx
	loop repeat16

	mov ax, 4c00h
	int 21h
code ends
end start