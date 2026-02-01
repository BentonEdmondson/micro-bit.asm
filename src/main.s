    .thumb

vector_table:
    .word 0x20008000
    .word main
    .rept 46
    .word panic
    .endr

panic:
    b panic

main:
    b main
