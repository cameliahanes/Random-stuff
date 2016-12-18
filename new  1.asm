[bits 32]

section .text 

extern  _printf
extern _exit

global  _main 

_main: 
        ;push    DWORD text 
		mov eax, [n1]
		add eax, [n2]
		mov [sum], eax
		push dword sum
        call    _printf
        add     esp, 8
        push    0
        call    _exit
        ret 

section .data

text:   db      'hello world?',0 
n1: dd 35
n2: dd 47
sum dd 0