; [ TEMPLATE PERINTAH ]
SYS_READ    EQU     0
SYS_WRITE   EQU     1
STDOUT      EQU     1

SECTION .data
    PROMPT          DB      "Enter your name: ",    0        ; Prompt  Text
    DISPLAY_NAME    DB      "Your name is: ",       0        ; Display Text

SECTION .bss
    FIRST_NAME    RESB    50    ; Sedia wadah nama depan    sepanjang 50 byte
    LAST_NAME     RESB    50    ; Sedia wadah nama belakang sepanjang 50 byte

SECTION .text
    global _start

    _start:                             ; !!! INSTRUKSI DIMULAI DISINI !!!
        ; [ HITUNG PANJANG PROMPT ]
        MOV ESI, DISPLAY_NAME           ; Pindahkan alamat DN     ke wadah ESI (Source/sumber)
        MOV EDI, PROMPT                 ; Pindahkan alamat PROMPT ke wadah EDI (Destination/destinasi)
        SUB ESI, EDI                    ; Perhitungan alamat DN dikurangi PROMPT hasilnya masuk ke mangkok ESI
        MOV EDX, ESI                    ; Memindahkan nilai dari mangkok ESI ke EDX (merubah hasil perhitungan menjadi data)

        ; [ PRINT PROMPT ]
        MOV ESI , PROMPT                ; Simpan source alamat target ke wadah source
        MOV AX  , SYS_WRITE             ; Simpan perintah   write  ke wadah accumulator
        XOR RDI  , RDI                  ; Kosongkan wadah DI bekas tadi dipakai perhitungan
        MOV DI  , STDOUT                ; Simpan target stdout ke awdah DI
        SYSCALL                         ; Panggil OS/Kernel

        ; [ STOP PROGRAM ]
        MOV RAX, 60                     ; Syscall number untuk sys_exit (64-bit)
        XOR RDI, RDI                    ; Arg 1: exit code = 0
        SYSCALL                         ; Panggil OS untuk kerja
