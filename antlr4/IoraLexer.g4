lexer grammar IoraLexer
    ;

/* comment */
MultiLineComment
    : '/*' .*? '*/' -> channel(HIDDEN)
    ;

SingleLineComment
    : '//' ~[\r\n\u2028\u2029]* -> channel(HIDDEN)
    ;

WS
    : [ \t\u000C\r\n]+ -> skip
    ;

/* tokens */

PLUS
    : '+'
    ;

MINUS
    : '-'
    ;

STAR
    : '*'
    ;

SLASH
    : '/'
    ;

PERCENT
    : '%'
    ;

NOT
    : '!'
    ;

LEFT_PAREN
    : '('
    ;

RIGHT_PAREN
    : ')'
    ;

LEFT_BRACKET
    : '['
    ;

RIGHT_BRACKET
    : ']'
    ;

LEFT_BRACE
    : '{'
    ;

RIGHT_BRACE
    : '}'
    ;

COMMA
    : ','
    ;

DOT
    : '.'
    ;

EQ
    : '='
    ;

EQEQ
    : '=='
    ;

NEQ
    : '!='
    ;

LESS
    : '<'
    ;

LESS_EQ
    : '<='
    ;

GREATER
    : '>'
    ;

GREATER_EQ
    : '>='
    ;

SEMICOLON
    : ';'
    ;

COLON
    : ':'
    ;

/* reserved words */
FOR
    : 'for'
    ;

WHILE
    : 'while'
    ;

IF
    : 'if'
    ;

ELSE
    : 'else'
    ;

RETURN
    : 'return'
    ;

BREAK
    : 'break'
    ;

FUNC
    : 'func'
    ;

VAR
    : 'var'
    ;

VAL
    : 'val'
    ;

AND
    : 'and'
    ;

OR
    : 'or'
    ;

CLASS
    : 'class'
    ;

NEW
    : 'new'
    ;

/* Literal */
TRUE
    : 'true'
    ;

FALSE
    : 'false'
    ;

NIL
    : 'nil'
    ;

INT
    : Digit+
    ;

FLOAT
    : Digit+ '.' Digit+
    ;

STRING
    : '"' ~('\\' | '"')* '"'
    ;

IDENTIFIER
    : Alpha (Alpha | Digit)*
    ;

fragment Alpha
    : [a-zA-Z_]
    ;

fragment Digit
    : [0-9]
    ;

