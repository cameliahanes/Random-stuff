[bits 32]
%include "msdn_defs.inc"
section .text 

extern  _printf
extern _exit
extern CreateFileA
global  _main 
extern GetLastError
extern ReadFile
extern WriteFile
extern CloseHandle

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

		mov [handle], eax
		push dword NULL
		push dword numberBytesRead
		push dword [numberBytesToRead]
		push dword buffer
		;push dword handle
		push dword [handle]
		call ReadFile
		push dword buffer
		call _printf
		add esp, 4
		
		
		push dword NULL
		push dword numberOfBytesWritten
		push dword [numberOfBytesToWrite]
		;push dword buffer
		push dword handle
		call WriteFile
		push dword buffer
		call _printf
		add esp, 4
		
		push dword handle
		call CloseHandle
		
		eroare:
		call GetLastError
		push eax
		push dword format
		call _printf
		
		push    DWORD text 
        call    _printf
        add     esp, 8
        push    0
        call    _exit
        ret 
		
section .data

text:   db      'hello?',0 
;FileName db "fisier.txt",0
FileName db "C:\\Users\\Camelia\\Documents\\test\\fisier.txt.txt", 0
format: db "Error: %d", 0 
handle dd 0
numberBytesToRead dd 100
numberBytesRead dd 0
buffer times 100 db 0, 0
hFile dd 0
numberOfBytesToWrite dd 100
numberOfBytesWritten dd 0
