.stack 100h       ; Allocates 256 bytes for the stack.

.data
a db "Jump Tryout $"                       ; First string to display.
b db "Assembly Language $"                ; Second string to display (after jump).
c db "Law Level Programnming Language $"  ; Third string to display.

.code
main proc         ; Start of the main procedure.

    ; Step 1: Initialize the data segment
    mov ax, @data      ; Load the address of the data segment into AX.
    mov ds, ax         ; Set the data segment register (DS).

    ; Step 2: Display the first string
    mov ah,9           ; Set DOS function to display a string.
    lea dx,a           ; Load the address of `a` into DX.
    int 21h            ; Display the string.

    ; Step 3: Add a newline
    mov ah,2           ; Set DOS function to display a single character.
    mov dl,10          ; ASCII code for newline.
    int 21h            ; Outputs newline.
    mov dl,13          ; ASCII code for carriage return.
    int 21h            ; Outputs carriage return.

    ; Step 4: Display the second string (using a jump)
    m:
    mov ah,9           ; Set DOS function to display a string.
    lea dx,b           ; Load the address of `b` into DX.
    int 21h            ; Display the string.

    ; Add a newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    jmp n              ; Jump to label `n` to skip to the next part.

    ; Step 5: Display the third string
    n:
    mov ah,9           ; Set DOS function to display a string.
    lea dx,c           ; Load the address of `c` into DX.
    int 21h            ; Display the string.

    ; Step 6: Exit the program
    exit:
    mov ah,4ch         ; Set DOS function to terminate the program.
    int 21h            ; Exit the program.

main endp          ; End of the main procedure.
end main           ; Specify the entry point for the program.
