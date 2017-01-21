ASSUME cs: code, ds:data
   ; we tell to the assembler which segments we will use in the program
data SEGMENT 
   ;data - place holder for start of data segment
data ENDS
code SEGMENT
   ;code - place holder for start of code segment
start:
   mov ax,data    ; the data segment address will be copied in ax
   mov ds,ax    ; ax's content will be copied into ds
   ; .......
   ; here will be our instructions
   ;........
   mov ax,4C00h
   int 21h   ; the end of the execution
code ENDS
END start