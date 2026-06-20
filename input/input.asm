; [ TEMPLATE PERINTAH ]
SYS_READ    EQU     0
SYS_WRITE   EQU     1
STDOUT      EQU     1
STDIN       EQU     0

SECTION .data
    data_start:                                                 ; !!! DATA DIMULAI DISINI !!!
        PROMPT          DB      "Enter your name: ",    0       ; Prompt  Text
        DISPLAY_NAME    DB      "Your name is: ",       0       ; Display Text

    data_end:

    TOTAL_DATA_BYTE     EQU     data_start - data_end           ; Menghitung total seluruh byte dalam section data

SECTION .bss
    FIRST_NAME      RESB        50          ; Sedia wadah nama depan    sepanjang 50 byte
    LAST_NAME       RESB        50          ; Sedia wadah nama belakang sepanjang 50 byte
    NAME            RESB        100         ; Sediakan wadah untuk menyimpan nama lengkap

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
        XOR RDI , RDI                   ; Kosongkan wadah DI bekas tadi dipakai perhitungan
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
        MOV EDI, TOTAL_DATA_BYTE
        SUB EDI, ESI
        MOV EDX, EDI

        ; [ PRINT DISPLAY_NAME ]
        MOV ESI , DISPLAY_NAME
        MOV AX  , SYS_WRITE
        XOR RDI , RDI
        MOV DI  , STDOUT
        SYSCALL

        ; [ PRINT NAMA ]
        

        ; [ STOP PROGRAM ]
        MOV RAX, 60                     ; Syscall number untuk sys_exit (64-bit)
        XOR RDI, RDI                    ; Arg 1: exit code = 0
        SYSCALL                         ; Panggil OS untuk kerja
