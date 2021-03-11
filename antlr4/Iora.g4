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

WS
    : [ \t\u000C\r\n]+ -> skip
    ;

eos
    : '\n'
    | EOF
    ;
