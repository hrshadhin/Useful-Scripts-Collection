.model small
.stack 100h
.data     
    m1 db "How many term?:$"
    m2 db 0dh,0ah,0dh,0ah,"The sum is:$"
    sum dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1   ;Print output message 
    mov ah,9
    int 21h
    call indec  ;Get input 
    mov cx,ax   ;Move input value to cx register
    mov ax,0
    mov bx,0
    mov dx,1
    top:        ;start loop & below 3 lines are calulating series
        add bx,dx  
        mov ax,bx
        mov bx,dx
        add sum,dx ;adding the current term to sum
        mov dx,ax
        
        dec cx
        jnz top
  ;end loop
    lea dx,m2  ;Print output message 
    mov ah,9
    int 21h
    mov ax,sum    ;Move sum to ax registor 
    call outdec   ;Give output of sum
    
    mov ah,4ch
    int 21h
    
    
main endp
    include indec.asm
    include outdec.asm
    end main
