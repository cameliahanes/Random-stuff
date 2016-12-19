[bits 32]
%include "msdn_defs.inc"
section .text 

extern  _printf
extern _exit
extern CreateFileA
global  _main 
extern GetLastError


_main: 
		push dword NULL
		push dword FILE_ATTRIBUTE_NORMAL
		push dword OPEN_EXISTING
		push dword NULL
		push dword 0
		push dword GENERIC_READ|GENERIC_WRITE
		PUSH DWORD FileName
		call CreateFileA
		
		cmp eax, INVALID_HANDLE_VALUE
		je eroare

        push    DWORD text 
        call    _printf
        add     esp, 8
        push    0
        call    _exit
        ret 

		eroare:
		call GetLastError
		push eax
		push dword format
		call _printf
		
section .data

text:   db      'hello?',0 
;FileName db "fisier.txt",0
FileName db "C:\\Users\\Camelia\\Documents\\test\\fisier.txt.txt", 0
format: db "Error: %d", 0 