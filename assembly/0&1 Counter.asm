.model small
.stack 100h
.data
        string db ? 
        input_m db 'Enter the line:$'
        output_m0 db 0dh,0ah,0dh,0ah,'Number of zero(s):$'
        output_m1 db 0dh,0ah,0dh,0ah,'Number of one(s):$'
        one dw 0
        zero dw 0
        
.code
main proc
        mov ax,@data
        mov ds,ax
        
        
       lea dx,input_m ;Move output message to dx register
        mov ah,09
        int 21h

        
        mov bx,0

inp:       ;Start loop
         mov ah,01   ;Get input 
        int 21h

        mov string[bx],al ;Move input charecter to string variable
        inc bx
        cmp al,0dh
        jne inp
  ;end loop      
        dec bx
        mov string[bx],'$';Add terminate charecter '$' with input string
        mov bx,0
       
        
opt:   ;start test loop for 0 & 1
        cmp string[bx],'$'
        je  display  
        cmp string[bx],'0'
        je  count0
        cmp string[bx],'1'
        je  count1
        inc bx
        jmp opt  
     ;end loop
count0:  ;start counting loop for Zero(0)
        add zero,1
        inc bx         
        jmp opt 
     ;end loop
count1:  ;start counting loop for One(1)
        add one,1 
        inc bx
        jmp opt 
     ;end loop
display: 
     ;Display output result for Zero(0)
        lea dx,output_m0 
        mov ah,9
        int 21h
        mov ax,zero
        call outdec
      ;Display output result for One(1)
        lea dx,output_m1
        mov ah,9
        int 21h
        mov ax,one
        call outdec
     
      ;d   
        mov ah,4ch
        int 21h
        
        
        
   main endp
        include outdec.asm
       end main
