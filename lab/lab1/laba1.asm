%include "io64.inc"

section .data
vec dd 5, 5, 4, 3, 2, 1
iter dd 0
iterTop dd 0; индекс текущего элемента
iterEax dd 0; индекс последнего элемента
elem dd 0; текущий элем

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging

    ;write your code here
    xor rax, rax
    xor rdx, rdx
    xor rcx, rcx

    ;сумма
    mov ecx, [vec] ;сохраняем адрес нулевого элемента

    mov edx, vec + 4 ; передаем первый элемент
    l1:add eax, [edx], edx;суммируем каждый эелемент
    add edx, 4, edx; получаем адрес следующего элемента
    loop l1

    ;сортировка
    xor rax, rax
    xor rdx, rdx
    xor rcx, rcx
    xor ebx, ebx
    xor esi, esi

    ;mov ebx, [vec +4]; хранит первый элемент
    mov ecx, [vec]; хранит нулевой элемент (количество элементов массива)

    ;mov esi, [vec]
for_i:
       mov edx, 1 ; индекс начинаем с единицы
for_j:
    mov eax, 4; eax выступает в роли текущего элемента
    mov [iter], edx; Помещаем в iter количество пройденных элементов
    mul edx; перемножаем eax на edx и тем самым получаем индекс текщего элемента, при этом edx обнуляется
    mov edx, [iter];Возвращаем значение  edx
    mov [iterTop], eax;Запоминаем значение eax чтобы потом узнать индекс первого числа
    mov eax, 4
    mul ecx; умножаем eax на количество элементов, тем самым узнаём индекс последнего
    mov [iterEax], eax; сохраняем инд последнего элемента
    mov ebx, [iterTop]; помещаем индекс текущего элемента
    mov eax, [vec + ebx]; помещаем текущий элемент
   ; mov [elem], eax ; запомнили текущий элемент
    test eax, 1; проверили на четность
    jz no_change; если четное, то не меняем

    mov edx, [iterEax]; поместили инд последнего
    mov ebx, [vec + edx]; поместили последний
    xchg eax, ebx; поменяли местами значения
    mov edx, [iterTop]; поместили инд текущего
    mov [vec + edx], eax; записали в место текущего элемента последний
    mov edx, [iterEax]; поместили индекс последнего
    ;mov [vec + 20], ebx
no_change:
    mov edx, [iter]
    cmp edx, ecx
    jae exit_for_j
    ;jbe no_swap
    mov eax, edx
;no_swap:
    inc edx
    jmp for_j
exit_for_j:
    loop    for_i

    ret
