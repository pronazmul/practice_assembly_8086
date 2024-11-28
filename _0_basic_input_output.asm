.model small   ; Specifies the memory model; 'small' means code and data segments are each limited to 64 KB.
.stack 100h    ; Allocates 256 bytes (100h in hexadecimal) for the stack. The stack is used for temporary storage.

.code          ; Indicates the start of the code segment.
main proc      ; Declares the main procedure (entry point of the program).

    ; Input the first character
    mov ah, 1      ; AH = 1 sets up the DOS interrupt (INT 21h) for accepting a single character input from the keyboard.
    int 21h        ; Calls the DOS interrupt. The ASCII value of the input character is stored in the AL register.
    mov bl, al     ; Copies the value from AL (input character) to the BL register for later use.

    ; Input the second character
    mov ah, 1      ; AH = 1 again sets up for accepting another character input.
    int 21h        ; Calls the DOS interrupt. The ASCII value of the second input character is stored in AL.
    mov bh, al     ; Copies the value from AL to the BH register for later use.

    ; Output the first character
    mov ah, 2      ; AH = 2 sets up the DOS interrupt for displaying a single character.
    mov dl, bl     ; Copies the value from BL (first character) to DL, as DL holds the character to be printed.
    int 21h        ; Calls the DOS interrupt. This displays the first input character on the screen.

    ; Output the second character
    mov ah, 2      ; AH = 2 again sets up for displaying a single character.
    mov dl, bh     ; Copies the value from BH (second character) to DL.
    int 21h        ; Calls the DOS interrupt. This displays the second input character on the screen.

    ; Exit the program
    exit: 
    mov ah, 4Ch    ; AH = 4Ch sets up the DOS interrupt to terminate the program.
    int 21h        ; Calls the DOS interrupt. The program exits and returns control to the operating system.

main endp      ; Marks the end of the main procedure.
end main       ; Specifies the starting point for execution (the 'main' procedure).
