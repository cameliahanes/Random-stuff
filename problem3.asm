[bits 32]

section .text 

extern  _printf
extern _exit

global  _main 

_main: 
		mov edi, 0
		mov ecx, len
		
		compute:
				mov eax, numbers[edi]
				cmp eax, 0
				jnl addToSum
				neg eax
				jmp addToSum
				
				
		addToSum:
			add [sum], eax
			add edi, 4
			loop compute
	
		final:
			push dword [sum]
			push dword text
			call    _printf
			add     esp, 8
			push    0
			call    _exit
			ret 

section .data

numbers dd 1, -10, 5, 2, 5, 0, -9, 17
len equ ($-numbers)/4
sum dd 0
text db  'The sum of numbers is: %d',0 