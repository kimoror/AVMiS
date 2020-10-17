%include "io64.inc"
section .data
vec: Times 75 dd 10000, 10000, 10000, 10000000
section .text
global CMAIN
CMAIN:
    mov rbp, rsp;

    xor rax, rax
    xor rdx, rdx
    xor rcx, rcx
    xor rbx, rbx
    
    mov ecx, 300
    l1:
    mov eax, [vec + ecx*4]
    add ebx, eax; cуммируем каждый эелемент
    
    ;stc
    ;jb no_adc
    ;adc ebx, 1
    
    mul eax
    
    
    ;no_adc:
    loop l1
    
    PRINT_DEC 4, ebx
    
    ret