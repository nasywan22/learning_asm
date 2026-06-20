SECTION .data
    PROMPT          DB  "Enter your name: ", 0        ; Prompt Text
    DISPLAY_NAME    DB  "Your name is: ",    0        ; Display Text

SECTION .bss
    NAME RESB 100    ; Sedia wadah sepanjang 100 byte

SECTION .text
    global _start

_start:
