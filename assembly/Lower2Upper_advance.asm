.MODEL SMALL
.STACK 100H
.DATA 
    t db 0dh,0ah,"1+4+9+16+......................$"
    td1    db "===========================$"
    td2    db 0dh,0ah,"===========================$"
    m1 db 0dh,0ah,"How many terms:$"
    m2 db 0dh,0ah,"The Sum is:$"
    sum dw 0
    dif dw 3 
    newline db 0dh,0ah,"$"
    plus db "+$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ;Title codes start
    lea dx,td1
    mov ah,9
    int 21h  
    lea dx,t
    mov ah,9
    int 21h
    lea dx,td2
    mov ah,9
    int 21h 
     ;Title codes end
    
    lea dx,m1
    mov ah,9
    int 21h
    call indec
    mov cx,ax
    
    mov bx,1 
    lea dx,newline
    mov ah,9
    int 21h
    Top:
        mov ax,bx
        call outdec 
        add sum,bx
        add bx,dif
        add dif,2 
        dec cx
        cmp cx,0
        je p
        lea dx,plus
        mov ah,9
        int 21h 
        
         
      
        
        jnz TOP
    p:
        nop
    lea dx,m2
    mov ah,9
    int 21h
    mov ax,sum
    call outdec
    
    mov ah,4ch
    int 21h
    
    
MAIN ENDP
    include indec.asm
    include outdec.asm
    END MAIN