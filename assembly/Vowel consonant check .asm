.model small
.stack 100h
.data
    m1 db "Enter the charecter:$"
    m2 db 0dh,0ah,0dh,0ah,"Its not a charecter(A-Z or a-z).Try again.$"
    m3 db 0dh,0ah,0dh,0ah,"You have entered vowel.$"  
    m4 db 0dh,0ah,0dh,0ah,"You have entered consonant.$"
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9     ;Print output message 
    int 21h 
    
    mov ah,1     ;Get Input
    int 21h  
    
    mov bl,al
    cmp bl,41h       ;Check the charecter is Upper case or not
    jl default
    cmp bl,5ah
    jg nextcheck
    jmp operation
   
    nextcheck:        ;Check the charecter is Lower case or not
        cmp bl,61h
        jl default  
        cmp bl,7ah
        jg default
        jmp operation
   
    ;If charecter is lower case then going to convert it to upper case
    operation:
        cmp bl,61h
        jge sub_         
    jmp condition 
  
    sub_:
        sub bl,20h   ;convert to upper case
  
    condition:          ;Check charecter is vowel or consonant
        cmp bl,'A'
        je vowel
        cmp bl,'E'
        je vowel
        cmp bl,'I'
        je vowel
        cmp bl,'O'
        je vowel
        cmp bl,'U'
        je vowel
    consonant:         ;Output message for consonant
        lea dx,m4
        mov ah,9
        int 21h
        jmp exit
    vowel:             ;Output message for vowel
        lea dx,m3
        mov ah,9
        int 21h
        jmp exit
    default:           ;Error checking 
        lea dx,m2
        mov ah,9     ;Give output for error!! 
        int 21h
    exit:            ;exit program
        mov ah,4ch
        int 21h
        
 main endp
    end main
        
        
    
