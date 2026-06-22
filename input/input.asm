; [ TEMPLATE PERINTAH ]
SYS_READ    EQU     0
SYS_WRITE   EQU     1
STDOUT      EQU     1
STDIN       EQU     0

SECTION .data
    PROMPT              DB      "Enter your name: ",0       ; Prompt  Text
    DISPLAY_NAME        DB      "Your name is: ",0          ; Display Text

    DATA_END_TAG        EQU             $                   ; Penanda posisi alamat terakhir data

SECTION .bss
    FIRST_NAME      RESB        50          ; Sedia wadah nama depan    sepanjang 50 byte
    LAST_NAME       RESB        50          ; Sedia wadah nama belakang sepanjang 50 byte
    NAME            RESB        100         ; Sediakan wadah untuk menyimpan nama lengkap

SECTION .text
    global _start

    _start:                             ; !!! INSTRUKSI DIMULAI DISINI !!!
        ; [ HITUNG PANJANG PROMPT ]
        MOV ESI, PROMPT                 ; Simpan alamat PROMPT       ke wadah source
        MOV EDI, DISPLAY_NAME           ; Simpan alamat DISPLAY_NAME ke wadah destination                
        SUB EDI, ESI                    ; Masukkan alamat prompt ke wadah DISPLAY_NAME untuk mengurangi nilai alamat DISPLAY_NAME     
        MOV EDX, EDI                    ; Pindahkan hasil perhitungan ke wadah data     

        ; [ PRINT PROMPT ]
        MOV AX  , SYS_WRITE             ; Simpan perintah   write  ke wadah accumulator
        MOV DI  , STDOUT                ; Simpan target stdout ke awdah DI
        SYSCALL                         ; Panggil OS/Kernel

        ; [ SYSTEM READ ]
        MOV ESI , NAME                  ; Sumber target alamat yang akan menyimpan nama
        MOV EDX , 100                   ; Tentukan maksimal byte input yang diterima
        MOV AX  , SYS_READ              ; Perintah baca
        MOV DI  , STDIN                 ; Pilih target file_desc ke standar input
        SYSCALL                         ; Panggil OS/Kernel

        ; [ HITUNG PANJANG TEXT DISPLAY_NAME ]
        MOV ESI, DISPLAY_NAME
        MOV EDI, DATA_END_TAG
        SUB EDI, ESI
        MOV EDX, EDI

        ; [ PRINT DISPLAY_NAME ]
        MOV AX  , SYS_WRITE
        MOV DI  , STDOUT
        SYSCALL

        ; [ PRINT NAMA ]
        MOV ESI , NAME
        MOV EDX , 100
        MOV AX  , SYS_WRITE
        MOV DI  , STDOUT
        SYSCALL

        ; [ STOP PROGRAM ]
        MOV RAX, 60                     ; Syscall number untuk sys_exit (64-bit)
        XOR RDI, RDI                    ; Arg 1: exit code = 0
        SYSCALL                         ; Panggil OS untuk kerja
