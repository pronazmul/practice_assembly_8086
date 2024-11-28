.model small      ; Specifies the memory model.
.stack 100h       ; Allocates 256 bytes for the stack.

.data
nazmul db "Welcome Nazmul Huda $"    ; Welcome message (terminated with $).
sid db "Enter your Serial: $"        ; Prompt asking for a serial (terminated with $).
sidy db "Your Serial is: $"          ; Prefix for displaying the entered serial (terminated with $).

.code
main proc         ; Start of the main procedure.

    ; Step 1: Initialize the data segment
    mov ax, @data     ; Load the address of the data segment into AX.
    mov ds, ax        ; Set the data segment register (DS).

    ; Step 2: Display welcome message
    mov ah, 9         ; AH=9 to display a string.
    lea dx, nazmul    ; Load the address of the `nazmul` string into DX.
    int 21h           ; Display the string.

    ; Step 3: Add a newline
    mov ah, 2         ; AH=2 to display a single character.
    mov dl, 10        ; DL=10 (newline).
    int 21h           ; Output newline.
    mov dl, 13        ; DL=13 (carriage return).
    int 21h           ; Output carriage return.

    ; Step 4: Display serial input prompt
    mov ah, 9         ; AH=9 to display a string.
    lea dx, sid       ; Load the address of the `sid` string into DX.
    int 21h           ; Display the string.

    ; Step 5: Read user input
    mov ah, 1         ; AH=1 to read a single character.
    int 21h           ; Store the input character in AL.
    mov bl, al        ; Save the user's input in BL for later use.

    ; Step 6: Add a newline
    mov ah, 2         ; AH=2 to display a single character.
    mov dl, 10        ; DL=10 (newline).
    int 21h           ; Output newline.
    mov dl, 13        ; DL=13 (carriage return).
    int 21h           ; Output carriage return.

    ; Step 7: Display "Your Serial is:" message
    mov ah, 9         ; AH=9 to display a string.
    lea dx, sidy      ; Load the address of the `sidy` string into DX.
    int 21h           ; Display the string.

    ; Step 8: Display the user's input
    mov ah, 2         ; AH=2 to display a single character.
    mov dl, bl        ; Move the input (stored in BL) to DL.
    int 21h           ; Display the character.

    ; Step 9: Exit the program
    exit:
    mov ah, 4ch       ; AH=4Ch to terminate the program.
    int 21h           ; Exit the program.

main endp          ; End of the main procedure.
end main           ; Specify the start of execution (main procedure).
