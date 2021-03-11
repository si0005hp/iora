grammar Iora
    ;

program
    : statement+
    ;

statement
    : 'iora' NUMBER eos
    ;

NUMBER
    : [0-9]+
    ;

eos
    : '\n'
    | EOF
    ;
