[bits 32]

; gcd (a, b){
;	while (a != b and a != 1 and b != 1){
;		if (a > b):
;			a = a - b
;		else:
;			b = b-a
;	return a
;}


section .text 

extern  _printf
extern _exit

global  _main 

_main: 
        ;push    DWORD text 
        ;call    _printf
		
		divisor:
			mov eax, [n1]
			cmp eax, [n2]
			je final
			jl subtractFromSecond
			jg subtractFromFirst
			
		subtractFromSecond:
			mov ebx, [n2]
			sub ebx, [n1]
			mov [n2], ebx
			jmp divisor
			
		subtractFromFirst:
			mov ebx, [n1]
			sub ebx, [n2]
			mov [n1], ebx
			jmp divisor
			
		final:
			push    DWORD text 
			call    _printf
			mov ebx, n2
			push dword [n2]
			push char
			call _printf
			
			add     esp, 8
			push    0
			call    _exit
			ret 

section .data

text:   db      'The greatest common divisor of the numbers given is: ',0 
n1: dd 12
n2: dd 12
char: db "%d", 0
gcd: dd 1