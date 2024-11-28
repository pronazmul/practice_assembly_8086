.model small      ; Specifies the memory model.
.stack 100h       ; Allocates 256 bytes for the stack.

.data
msg db "Print English Letters: $"    ; Message to display (terminated with $).

.code
main proc         ; Start of the main procedure.

    ; Step 1: Initialize the data segment
    mov ax, @data     ; Load the address of the data segment into AX.
    mov ds, ax        ; Set the data segment register (DS).

    ; Step 2: Display the message
    mov ah,9          ; Set up DOS function to display a string.
    lea dx,msg        ; Load the address of the `msg` string into DX.
    int 21h           ; Display the string.

    ; Step 3: Add a newline
    mov ah,2          ; Set up DOS function to display a single character.
    mov dl,10         ; ASCII code for newline.
    int 21h           ; Output newline.
    mov dl,13         ; ASCII code for carriage return.
    int 21h           ; Output carriage return.

    ; Step 4: Print uppercase alphabet (A-Z)
    mov cx,26         ; Set loop counter to 26 (number of letters in the alphabet).
    mov ah,2          ; Set up DOS function to display a single character.
    mov dl,"A"        ; Load ASCII value of 'A' into DL.
level1:
    int 21h           ; Display the character in DL.
    inc dl            ; Increment DL to the next character.
    loop level1       ; Decrement CX and repeat if CX is not zero.

    ; Step 5: Exit the program
    exit:
    mov ah,4ch        ; Set up DOS function to terminate the program.
    int 21h           ; Exit the program.

main endp          ; End of the main procedure.
end main           ; Specify the entry point for the program.
