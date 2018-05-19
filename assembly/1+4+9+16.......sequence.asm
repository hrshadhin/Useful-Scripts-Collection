.model small
.stack 100h
.data 
    m1 db "How many terms?:$"
    m2 db 0dh,0ah,0dh,0ah,"The sum is:$"
    sum dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9 ;Print output message
    int 21h
    call indec   ;Get input
    mov cx,ax    ;Move input value to cx register
    
    mov bx,1
    mov dx,3
    top:      ;start loop & below  lines are calulating
        add sum,bx ;adding the current term to sum
        add bx,dx
        add dx,2
        dec cx
        jnz top
    ;end loop
    lea dx,m2
    mov ah,9   ;Print output message 
    int 21h
    mov ax,sum   ;Move sum to ax registor 
    call outdec   ;Give output of sum
    
    mov ah,4ch    ;exit program
    int 21h
    
    
main endp
    include indec.asm
    include outdec.asm
    end main
