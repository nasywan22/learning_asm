SECTION .data
    PROMPT          DB  "Enter your name: ", 0        ; Prompt  Text
    DISPLAY_NAME    DB  "Your name is: ",    0        ; Display Text

SECTION .bss
    FIRST_NAME    RESB    50    ; Sedia wadah nama depan    sepanjang 50 byte
    LAST_NAME     RESB    50    ; Sedia wadah nama belakang sepanjang 50 byte

SECTION .text
    global _start

    _start:                             ; !!! INSTRUKSI DIMULAI DISINI !!!
        ; [ PRINT PROMPT ]
        MOV ESI, PROMPT                 ; Pindahkan alamat PROMPT ke wadah ESI (Wadah source/sumber)
        MOV EDX, DISPLAY_NAME - PROMPT  ; Hasil perhitungan panjang text dipindahkan ke wadah EDX (Wadah data)
