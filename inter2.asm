;1. A string of bytes is given in the data segment. Print on the standard output (screen) the elements of this string in base 2.

assume cs:code, ds:data
data segment
	sir db 123, 14, 17, 81, 25
	fin db 1
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov cx, offset fin
	mov si, 0
	repeta:
		lodsb
		mov bl, al		

		shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
		shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
	shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
	
shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h
shl bl, 1
		jc one
		mov ah, 02h
		mov dl, '0'
		int 21h	
one:
mov ah, 02h
mov dl, '1'
int 21h

loop repeta
mov ax, 4c00h
int 21h
code ends
end start	