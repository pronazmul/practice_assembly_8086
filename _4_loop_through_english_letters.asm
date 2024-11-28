
.model small
.stack 100h

.data

.code
main proc
    
    
    mov ah,2
    mov dl,07
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    
main endp
end main Define an uninitialized byte variable for user input.

.code
main proc         ; Start of the main procedure.

    ; Step 1: Initialize the data segment
    mov ax, @data     ; Load the address of the data segment into AX.
    mov ds, ax        ; Set the data segment register (DS).

    ; Step 2: Display the value of `msg`
    mov ah, 2         ; AH = 2 to display a character.
    add msg, 48       ; Convert `msg` from numeric to ASCII ('1' = 49).
    mov dl, msg       ; Move the ASCII value into DL.
    int 21h           ; Display the character stored in DL.

    ; Step 3: Add a newline
    mov ah, 2         ; AH = 2 to display a character.
    mov dl, 10        ; DL = 10 (newline character).
    int 21h           ; Output newline.
    mov dl, 13        ; DL = 13 (carriage return).
    int 21h           ; Output carriage return.

    ; Step 4: Read a character from the user
    mov ah, 1         ; AH = 1 to read a single character from the keyboard.
    int 21h           ; Store the input in AL.
    mov msg2, al      ; Save the user's input into `msg2`.

    ; Step 5: Add another newline
    mov ah, 2         ; AH = 2 to display a character.
    mov dl, 10        ; DL = 10 (newline character).
    int 21h           ; Output newline.
    mov dl, 13        ; DL = 13 (carriage return).
    int 21h           ; Output carriage return.

    ; Step 6: Display the user's input
    mov ah, 2         ; AH = 2 to display a character.
    mov dl, msg2      ; Move the value of `msg2` (user's input) into DL.
    int 21h           ; Display the character stored in DL.

    ; Step 7: Exit the program
    exit: 
    mov ah, 4ch       ; AH = 4Ch to terminate the program.
    int 21h           ; Call the DOS interrupt to exit.

main endp          ; End of the main procedure.
end main           ; Specify the start of execution (main procedure).
