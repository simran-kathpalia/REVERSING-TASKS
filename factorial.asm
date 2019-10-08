extern printf
extern scanf

section .data
        fmt: db "%d", 0
        output: db "factorial is %d",10,0

section .text
        global main

        main:
        push ebp
        mov ebp,esp
        sub esp,0x10

        lea edx, [ebp-0x4]
        push edx
        push fmt
        call scanf

        mov edx, DWORD [ebp-0x4]
        mov eax,1
        mov ecx,edx

        cmp edx,1
        jnz L2
        mov eax,1
        jmp next
        L2:
        imul eax,ecx
        sub ecx,1
        cmp ecx,1
        jne L2
  
        next:

        push eax
        push output
        call printf

        leave
        ret
        
        
