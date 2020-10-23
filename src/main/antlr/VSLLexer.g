lexer grammar VSLLexer;

options {
  language = Java;
}

@header {
  package TP2;
}

WS : (' '|'\n'|'\t') -> skip
   ;

COMMENT : '//' (~'\n')* -> skip
        ;

fragment LETTER : 'a'..'z' ;
fragment DIGIT  : '0'..'9' ;
fragment ASCII  : ~('\n'|'"');
// other tokens (no conflict with keywords in VSL)

IDENT   : LETTER (LETTER|DIGIT)*;
TEXT    : '"' (ASCII)* '"' { setText(getText().substring(1, getText().length() - 1)); };
INTEGER : (DIGIT)+ ;

// keywords
LP    : '(' ; // Left parenthesis
RP    : ')' ;
PLUS      : '+' ;
MINUS	: '-' ;
DIV : '/' ;
MUL : '*' ;
LBRACE : '{';
RBRACE : '}';
COMA : ',';
LBKT : '[';
RBKT : ']';

IF : 'IF';
THEN : 'THEN';
ELSE : 'ELSE';
FI: 'FI';
WHILE : 'WHILE';
DO : 'DO';
DONE : 'DONE';
VOID : 'VOID';
INT : 'INT';
AFFECT : ':=';
RETURN : 'RETURN';
PRINT : 'PRINT';
READ : 'READ';
FUNC : 'FUNC';

PROTO : 'PROTO';


// TODO : other keywords


