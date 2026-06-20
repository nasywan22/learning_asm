SECTION .data
    ; [ Kelompok data print "Hello World" ]
    TXT DB "HELLO, WORLD!", 10              ; Data text
    LEN_TXT EQU $ - TXT                     ; Data panjang text

    ; [ Kelompok data print 10 bintang ]
    STARS TIMES 10 DB "*"                   ; 10 Bintang
    LEN_STARS EQU $ - STARS                 ; Data panjang 10 bintang

SECTION .text
    GLOBAL _start                           ; Definisikan nama titik mulai nya

    _start:                                 ; !!!   TITIK MULAI INSTRUKSI NYA DISINI  !!!
        ;                                   [ PRINT HELLO WORLD! ]
        MOV RSI, TXT                        ; Simpan alamat text ke mangkok RSI (mangkok untuk menyimpan sumber/bahan)
        MOV EDX, LEN_TXT                    ; Simpan nilai panjang text ke mangkok EDX (mangkok data berukuran sedang)
        MOV AX, 1                           ; Simpan perintah menulis ke mangkok AL (Accumulator)
        MOV DI, 1                           ; Simpan target output ke mangkok DI (Destination Index) (Target output ke layar)
        SYSCALL                             ; Panggil OS untuk kerja

        ;                                   [ PRINT 10 BINTANG ]
        MOV RSI, STARS                      ; Simpan alamat 10 bintang ke mangkok RSI
        MOV EDX, LEN_STARS                  ; Simpan nilai panjang 10 bintang ke mangkok EDX
        MOV AX, 1                           ; Perintah tulis
        MOV DI, 1                           ; Target tulis ke layar
        SYSCALL                             ; Panggil kernel/OS

        ;                                   [ STOP PROGRAM ]
        MOV RAX, 60                         ; Syscall number untuk sys_exit (64-bit)
        XOR RDI, RDI                        ; Arg 1: exit code = 0
        SYSCALL                             ; Panggil OS untuk kerja
