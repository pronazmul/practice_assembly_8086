.model small      ; Specifies the memory model.
.stack 100h       ; Allocates 256 bytes for the stack.

.data             ; No data is defined in this program.

.code
main proc         ; Start of the main procedure.

    ; Step 1: Trigger a beep sound (ASCII Bell)
    mov ah,2          ; Set up DOS function to display a single character.
    mov dl,7          ; ASCII code 7 (BEL, triggers a beep sound).
    int 21h           ; Call DOS interrupt to execute.

    ; Step 2: Exit the program
    exit:
    mov ah,4ch        ; Set up DOS function to terminate the program.
    int 21h           ; Call DOS interrupt to exit.

main endp          ; End of the main procedure.
end main           ; Specify the entry point for the program.
