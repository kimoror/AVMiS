%include "io64.inc"

section .data 
Vec1: Times 60 dd 999999, 999999, 999999, 999999, 999999
Vec2: Times 60 dd 999999, 999999,999999, 999999, 999999 
sum1 dd 0; sum1 хранит сумму младших битов
sum2 dd 0; sum2 хранит сумму старших битов

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    xor rax, rax
    xor rbx, rbx 
    xor rcx, rcx 
    xor rdx, rdx 
    
    mov ecx, 300
    
    for1:
    mov eax, [Vec1 + (ecx - 1)*4]
    mov edx, [Vec2 + (ecx - 1)*4]
    mul edx
    
    mov ebx, [sum1]
    add ebx, eax;так как eax хранит младшие биты
    mov [sum1], ebx
    
    mov ebx, [sum2]
    adc ebx, edx;так как edx хранит старшие биты
    mov [sum2], ebx
    
    no_adc:
    loop for1
    
    
    PRINT_DEC 4, [sum1]
    NEWLINE
    PRINT_DEC 4, [sum2]
    
    
    ;(2^21 - 1) * (2^21 - 1) * 2^9 = 51 bit 
   
    
    ret
