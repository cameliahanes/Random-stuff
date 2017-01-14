; 1. A number represented on 16 bits is given. Print on the screen a in base 16, as well as the result of all circular permutations of the digits. 

assume cs:code, ds:data
data segment
	tabela db '0123456789ABCDEF'
	zece db 10
	number dw 357
	saispe db 16
data ends
code segment

display_hexa proc	

to_hexa:
push cx
mov cx, 4
mov dx, 0

rotate:
rol ax, 1
rcl dx, 1
loop rotate

pop cx
push ax

mov al, dl
mov bx, offset tabela
xlat tabela
mov dl, al
mov ah, 02h
int 21h
pop ax
loop to_hexa

display_hexa endp

start:
	mov ax, data
	mov ds, ax

	mov ax, number
	call display_hexa
	rol ax, 4
	call display_hexa
	rol ax, 4
	call display_hexa
	rol ax, 4
	call display_hexa


mov ax, 4c00h
int 21h
code ends
end start

