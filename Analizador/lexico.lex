package Analizador;
import java_cup.runtime.Symbol;


%%


%class Yylex
%public
%line    
%char  
%cup


BLANCO=[\n\ \t\b]
ESPACIO = [ \t]+
SALTO = [\n]+
CADENA= (\\\"|[^\n\"]|\\{BLANCO}+\\)*
VARIABLE =({LETRA})({LETRA}|{NUMERO}|"_")*
DECIMAL = [0-9]+("."[  |0-9]+)?
NUMERO = [0-9]
LETRA=[a-zA-Z]

%%

<YYINITIAL> "incr" 		{ return (new Symbol(sym.INCR,yyline,yychar, yytext()));}
<YYINITIAL> "set"               { return (new Symbol(sym.SET,yyline,yychar, yytext()));}
<YYINITIAL> "puts" 		{ return (new Symbol(sym.PUTS,yyline,yychar, yytext()));}
<YYINITIAL> "expr" 		{ return (new Symbol(sym.EXPR,yyline,yychar, yytext()));}
<YYINITIAL> "switch"            { return (new Symbol(sym.SWITCH,yyline,yychar, yytext()));}
<YYINITIAL> "while"             { return (new Symbol(sym.WHILE,yyline,yychar, yytext()));}
<YYINITIAL> "break"             { return (new Symbol(sym.BREAK,yyline,yychar, yytext()));}
<YYINITIAL> "continue"          { return (new Symbol(sym.CONTINUE,yyline,yychar, yytext()));}
<YYINITIAL> "default"           { return (new Symbol(sym.DEFAULT,yyline,yychar, yytext()));}
<YYINITIAL> "else"              { return (new Symbol(sym.ELSE,yyline,yychar, yytext()));}
<YYINITIAL> "for"               { return (new Symbol(sym.FOR,yyline,yychar, yytext()));}
<YYINITIAL> "if"                { return (new Symbol(sym.IF,yyline,yychar, yytext()));}
<YYINITIAL> "return"            { return (new Symbol(sym.RETURN	,yyline,yychar, yytext()));}
<YYINITIAL> {NUMERO}+           { return new Symbol(sym.NUM,yyline,yychar, yytext());} 
<YYINITIAL> {DECIMAL}           { return new Symbol(sym.DECIMAL,yyline,yychar, yytext());} 
<YYINITIAL> {VARIABLE}          { return new Symbol(sym.ID,yyline,yychar, new String (yytext()));}
<YYINITIAL> {SALTO}             { /* IGNORAR */}
<YYINITIAL> {BLANCO}            { /* IGNORAR */}
<YYINITIAL> {ESPACIO}           { /* IGNORAR */}
<YYINITIAL> "$"	{ return new Symbol(sym.IDE,yyline,yychar, yytext());}

<YYINITIAL> "(" 		{ return new Symbol(sym.PARIZQ,yyline,yychar, yytext());}
<YYINITIAL> ")" 		{ return new Symbol(sym.PARDER,yyline,yychar, yytext());}
<YYINITIAL> "[" 		{ return new Symbol(sym.CORCIZQ,yyline,yychar, yytext());}
<YYINITIAL> "]" 		{ return new Symbol(sym.CORCDER,yyline,yychar, yytext());}
<YYINITIAL> "{"                 { return new Symbol (sym.LLAVEA	,yyline,yychar, yytext());}
<YYINITIAL> "}"                 { return (new Symbol(sym.LLAVEC	,yyline,yychar, yytext()));}
<YYINITIAL> ";" 		{ return new Symbol(sym.PC,yyline,yychar, yytext());}
<YYINITIAL> ":" 		{ return new Symbol(sym.DP,yyline,yychar, yytext());}
<YYINITIAL> "<"                 { return (new Symbol(sym.MENOR,yyline,yychar, yytext()));}
<YYINITIAL> ">"                 { return (new Symbol(sym.MAYOR,yyline,yychar, yytext()));}
<YYINITIAL> "<="                { return (new Symbol(sym.MENORIGUAL,yyline,yychar, yytext()));}
<YYINITIAL> ">="                { return (new Symbol(sym.MAYORIGUAL,yyline,yychar, yytext()));}
<YYINITIAL> "=="                { return (new Symbol(sym.IGUAL,yyline,yychar, yytext()));}
<YYINITIAL> "!"                 { return (new Symbol(sym.DIFERENCIA,yyline,yychar, yytext()));}
<YYINITIAL> "/"                 { return (new Symbol(sym.DIVISION,yyline,yychar, yytext()));}
<YYINITIAL> "+"                 { return (new Symbol(sym.MAS,yyline,yychar, yytext()));}
<YYINITIAL> "-"                 { return (new Symbol(sym.MENOS,yyline,yychar, yytext()));}
<YYINITIAL> "*"                 { return (new Symbol(sym.MULTIPLICACION,yyline,yychar, yytext()));}
<YYINITIAL> "/"                 { return (new Symbol(sym.DIVISION,yyline,yychar, yytext()));}
<YYINITIAL> "%"                 { return (new Symbol(sym.PORCENTAJE,yyline,yychar, yytext()));}
<YYINITIAL> "&&"                { return (new Symbol(sym.AND,yyline,yychar, yytext()));}
<YYINITIAL> "||"                { return (new Symbol(sym.OR,yyline,yychar, yytext()));}
<YYINITIAL> "!"                 { return (new Symbol(sym.NOT,yyline,yychar, yytext()));}
<YYINITIAL> "eq"                { return (new Symbol(sym.EQ,yyline,yychar, yytext()));}
<YYINITIAL> "ne"                { return (new Symbol(sym.NE,yyline,yychar, yytext()));}
<YYINITIAL> "in"                { return (new Symbol(sym.IN,yyline,yychar, yytext()));}
<YYINITIAL> "ni"                { return (new Symbol(sym.NI,yyline,yychar, yytext()));}


<YYINITIAL>  \"{CADENA}\"  {
	String string =  yytext().substring(1,yytext().length() - 1);
        return (new Symbol(sym.AGRUPACION,yyline,yychar, yytext()));
}
<YYINITIAL> \#{CADENA} {
	String string =  yytext().substring(1,yytext().length());
        return (new Symbol(sym.COMENTARIO,yyline,yychar, yytext()));
} 

  
