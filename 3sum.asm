assume cs:Code, ds:Data
Data segment
buffer db 6 dup (?)
handle dw ?
file db 'numbers.txt',0
no db ?
sum dw 0
sasesprezece db 16
zece db 10
string db 10 dup(?)
stringok db 10 dup(?)
Data ends

Code segment
start:
push data 
pop ds
mov ah, 3dh
mov al, 0
mov dx, offset file
int 21h

mov handle, ax

mov ah, 3fh
mov bx, handle
mov cx, 6
mov dx, offset buffer
int 21h

mov SI, 0

label1:
	cmp si, 6
	je down
	mov ah, buffer[si]
	mov al, buffer[si]+1
	add si, 2
	cmp ah, '9'
	ja hexa
	sub ah, '0'
	jmp jump	
		hexa:
		sub ah, 87
	jump:
	cmp al, '9'
	ja hexa2
	sub al, '0'
	jmp jump2	
		hexa2:
		sub al, 87
	jump2:
	mov bl, al
	mov bh, 0
	mov al, ah
	mul sasesprezece
	add ax, bx
	add sum, ax
	jmp label1
	
down:
mov ax,sum
mov si,0
mov di,0

MakeString:
	div zece
	mov string[si],ah
	inc si
	mov ah,0
	cmp al,0
	jne MakeString
dec si
reverseString:
	mov dl,string[si]
	add dl,'0'
	mov stringok[di],dl
	dec si
	inc di
	cmp si,-1
	jne reverseString
mov stringok[di],'$'
lea dx, stringok
mov ah,09h
int 21h
mov ax, 4c00h
int 21h
Code ends
end start

