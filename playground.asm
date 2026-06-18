SECTION .data
    TXT DB "HELLO, WORLD!", 10  ; Data text
    STARS DB TIMES 10 "*"       ; 10 Bintang
    LEN_TXT EQU $ - TXT         ; Data panjang text

SECTION .text
    GLOBAL _start           ; Definisikan nama titik mulai nya

    _start:                 ; !!!   TITIK MULAI INSTRUKSI NYA DISINI  !!!

        ;                   [ PRINT HELLO WORLD! ]
        MOV RSI, TXT        ; Simpan alamat text ke mangkok RSI (mangkok untuk menyimpan sumber/bahan)
        MOV EDX, LEN_TXT    ; Simpan nilai panjang text ke mangkok EDX (mangkok data berukuran sedang)
        MOV AX, 1           ; Simpan perintah menulis ke mangkok AL (Accumulator)
        MOV DI, 1           ; Simpan target output ke mangkok DI (Destination Index) (Target output ke layar)
        SYSCALL             ; Panggil OS untuk kerja

        ;                   [ PRINT 10 BINTANG ]


        ;                   [ STOP PROGRAM ]
        MOV RAX, 60         ; Syscall number untuk sys_exit (64-bit)
        XOR RDI, RDI        ; Arg 1: exit code = 0
        SYSCALL             ; Panggil OS untuk kerja
