;1. A number a represented on 16 bits is given. Print on the screen a in base 16, as well as the result of all circular permutations of the digits.

assume cs:code, ds:data
data segment
	a dw ?, 0
	zece db 10
	saispe db 16
	message db "Give the number: ","$" 
	tabela db "0123456789ABCDEF"
data ends
code segment
start:
mov ax, data
mov ds, ax

;we read the number from the keyboard
mov ah, 09h
mov dx, offset message
int 21h

mov ah, 0Ah
mov dx, offset a
int 21h

;now we have the number , all we have to do is to convert in into hexadecimal value
;and then make 4 circular permutations in order to obtain the required values


mov ax, a	;we put the number into ax
mov bx, ax	;we save the value of ax in bx to be able to use it later

mov dx, 0	;we put  in dx register

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
int 21h

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

mov ah, 02h
mov dl, 13
int 21h

mov ah, 02h
mov al, 13
int 21h

rol bx, 4
mov ax, bx

mov dx, 0	;we put  in dx register

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

mov ah, 02h
mov dl, 13
int 21h

mov ah, 02h
mov al, 13
int 21h

rol bx, 4
mov ax, bx

mov dx, 0	;we put  in dx register

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

mov ah, 02h
mov dl, 13
int 21h

mov ah, 02h
mov al, 13
int 21h

rol bx, 4
mov ax, bx

mov dx, 0	;we put  in dx register

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1

rol ax, 1
rcl dx, 1
mov al, dl
mov cx, bx
mov bx, offset tabela
xlat tabela
;we have obtained in dx the value of the first digit from a, we can print it on the screen
mov ah, 02h
;in dl we already have the value required
mov dl, al
int 21h
mov bx, cx

mov ah, 02h
mov dl, 13
int 21h

mov ah, 02h
mov al, 13
int 21h


mov ax, 4c00h
int 21h

code ends
end start