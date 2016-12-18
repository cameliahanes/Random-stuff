[bits 32]

section .text 

extern  _printf
extern _exit
extern __time32
extern _getchar 

global  _main 

_main: 
        push    DWORD format 
        call    _printf
        add     esp, 4
		
        push    dword 0
		call __time32
		add esp, 4
		mov [seed], eax
		
		genNumbers:
			call _getchar
			cmp eax, '0'
			je enddd
			
			;here we print the seed
			push dword [seed]
			push dword f
			call _printf
			add esp, 4*2
			
			mov eax, [seed]
			and eax, 01111111111111111000000001111000b
			mov cl, 8
			shr eax, cl
			
			mul ax
		
			mov bx, ax
			mov ax, dx
			mov cl, 16
			shl eax, cl
			mov ax, bx
			add eax, [n]
			
			cmp eax, 0
			mov [seed], eax
			jg genNumbers
			neg eax
			mov [seed], eax
			jmp genNumbers
	enddd:
		push 0
		call    _exit
		ret 

section .data

format db 'Press enter to generate number or 0 to exit ', 0
f db '%d', 0
seed dd 0 
n dd 20103070