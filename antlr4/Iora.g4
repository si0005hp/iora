grammar Iora
    ;

program
    : (iora)+
    ;

iora
    : 'iora' eos
    ;

eos
    : '\n'
    | EOF
    ;
