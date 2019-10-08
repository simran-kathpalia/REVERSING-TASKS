extern printf
extern scanf

section .data
        fmt: db "%d",0
        output: db "prime",10,0
        out: db "not prime",10,0

section .text
        global main
 
        main:
        push ebp
        mov ebp,esp
        sub esp,0x10

        lea ebx, [ebp-0x4]
        push ebx
        push fmt
        call scanf

        mov ebx, DWORD [ebp-0x4]
        mov DWORD [ebp-0x8],ebx
        sub DWORD [ebp-0x8],1
        mov ecx,1

        cmp ebx,2
        jnz L1
        mov edx,0
        jmp next
        L1:
        mov edx,0
        inc ecx
        mov eax,ebx
        idiv ecx
        cmp edx,0x00
        je n
        cmp ecx,DWORD [ebp-0x8]
        jl L1
        
        next:
        push output
        call printf
        jmp l
   
        n:
        push out
        call printf
        l:
       
        leave
        ret
        
        
