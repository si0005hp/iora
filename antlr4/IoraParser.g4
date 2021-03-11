parser grammar IoraParser
    ;

options {
    tokenVocab = IoraLexer;
}

program
    : declaration* EOF
    ;

/* declaration */
declaration
    : classDecl
    | funcDecl
    | varDecl
    | statement
    ;

classDecl
    : CLASS IDENTIFIER (COLON IDENTIFIER)? classBody
    ;

funcDecl
    : FUNC IDENTIFIER funcBody
    ;

varDecl
    : (VAR | VAL) IDENTIFIER EQ expression
    ;

classBody
    : LEFT_BRACE method* RIGHT_BRACE
    ;

method
    : IDENTIFIER funcBody
    ;

/* statement */
statement
    : expressionStatement
    | ifStatement
    | returnStatement
    | whileStatement
    | block
    ;

expressionStatement
    : expression SEMICOLON?
    ;

ifStatement
    : IF LEFT_PAREN expression RIGHT_PAREN statement (
        ELSE statement
    )?
    ;

returnStatement
    : RETURN expression? SEMICOLON?
    ;

whileStatement
    : WHILE LEFT_PAREN expression RIGHT_PAREN statement
    ;

block
    : LEFT_BRACE declaration* RIGHT_BRACE
    ;

/* expression */
expression
    : assignment
    ;

assignment
    : (call DOT)? IDENTIFIER EQ assignment
    | logicOr
    ;

logicOr
    : logicAnd (OR logicAnd)*
    ;

logicAnd
    : comparison (AND comparison)*
    ;

comparison
    : term (
        (EQEQ | NEQ | LESS | LESS_EQ | GREATER | GREATER_EQ) term
    )*
    ;

term
    : factor ((PLUS | MINUS) factor)*
    ;

factor
    : unary ((STAR | SLASH | PERCENT) unary)*
    ;

unary
    : (NOT | MINUS) unary
    | call
    ;

call
    : primary (
        (LEFT_PAREN arguments? RIGHT_PAREN)
        | DOT IDENTIFIER
    )*
    | new_
    ;

new_
    : NEW IDENTIFIER LEFT_PAREN arguments? RIGHT_PAREN
    ;

primary
    : literal
    | IDENTIFIER
    | anonymousFunc
    | LEFT_PAREN expression RIGHT_PAREN
    ;

literal
    : number
    | string
    | bool_
    | NIL
    ;

number
    : INT
    | FLOAT
    ;

string
    : STRING
    ;

bool_
    : TRUE
    | FALSE
    ;

anonymousFunc
    : FUNC funcBody
    ;

/* aliases */
funcBody
    : LEFT_PAREN parameters? RIGHT_PAREN block
    ;

arguments
    : expression (COMMA expression)*
    ;

parameters
    : IDENTIFIER (COMMA IDENTIFIER)*
    ;
