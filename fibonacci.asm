extern printf
extern scanf

section .data
        fmt: db "%d",0
        output: db "fibonnaci is %d",10,0

section .text
        global main
 
        main:
        push ebp
        mov ebp,esp
        sub esp,0x10
 
        lea eax,[ebp-0x4]
        push eax
        push fmt
        call scanf

        mov DWORD [ebp-0x8],0
        mov eax, DWORD [ebp-0x4]
        mov ebx,0
        mov ecx,1

        cmp eax,1
        jnz n
        mov ecx,0
        jmp next
        n:
        sub eax,2
        L1:
        add DWORD [ebp-0x8],1
        mov edx,ecx
        add ecx,ebx
        mov ebx,edx
        cmp DWORD [ebp-0x8],eax
        jl L1
        next:

        push ecx
        push output
        call printf

        leave
        ret
        
        
        
