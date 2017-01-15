;min si max intre 4 numere de 2 cifre citite de la tastatura, puse in fisiere diferite

assume cs:code, ds:data
data segment
	maxlength db 12
	len db ?
	numbers db 11 dup (?)
	min dw ?
	max dw ?
	minimum db ?, ?
	maximum db ?,  ?
	minfile db 'min.txt', 0
	maxfile db 'max.txt', 0
data ends
code segment
start:
	mov ax, data
	mov ds, ax

	mov ah, 0ah
	lea dx, maxlength
	int 21h

	mov ah, numbers[0]
	mov al, numbers[1]
	mov min, ax
	mov max, ax
	mov si, 3
	mov cx, 3

	repeat:
		push cx
		mov ax, min
		mov bx, max
		mov ch, numbers[si]
		mov cl, numbers[si+1]

	cmp ch, bh
	jg et1
	je et2
	jmp calcmin

	et1:
		mov max, cx
		jmp done
	et2:
		cmp cl, bl
		jmp et1

	calcmin:
		cmp ch, ah
		jl et3
		je et4

	et3:
		mov min, cx
		jmp done
	et4:
		cmp cl, al
		jl et1

	done:
		add si, 3
		pop cx
	loop repeat

mov bx, min
mov ax, max
mov minimum[0], bh
mov minimum[1], bl
mov maximum[0], ah
mov maximum[1], al

mov ah, 3dh
mov al, 1
lea dx, minfile
int 21h

mov bx, ax
mov ah, 40h
mov cx, 2
lea dx, minimum
int 21h

mov ah, 3dh
mov al, 1
lea dx, maxfile
int 21h

mov bx, ax
mov ah, 40h
mov cx, 2
lea dx, maximum
int 21h

	mov ax, 4c00h
	int 21h
code ends
end start 