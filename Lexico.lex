import java.lang.System;
class Analex {
      public static void main(String argv[])
	throws java.io.IOException {
	Yylex yy = new Yylex(System.in);
	while (yy.yylex() != null) {}	
    }
}

class Yytoken {
  Yytoken () {}
}
 
%%

%eofval{
  { System.exit(0); }
%eofval}

%class Lexico
%line    
%char  
%cup


NUMERO = [0-9]*
CADENA=([a-zA-Z]|[0-9])*
ID = [a-zA-Z]([a-zA-Z]|[0-9])*
COMILLA = [\"]
LINEA = [\n]
TAB = [\t]
IDENTIFICADOR= [\$|\\]



%%
 
 
 

<YYINITIAL> "incr" 		{ return new Symbol(sym.INCR,yyline,yychar, yytext());}
<YYINITIAL> "set" 		{ return new Symbol(sym.SET,yyline,yychar, yytext());}
<YYINITIAL> "puts" 		{ return new Symbol(sym.PUTS,yyline,yychar, yytext());}
<YYINITIAL> "expr" 		{ return new Symbol(sym.EXPR,yyline,yychar, yytext());}
<YYINITIAL> "switch"            { return new Symbol(sym.SWITCH,yyline,yychar, yytext());}
<YYINITIAL> "while"     { System.out.println ("WHILE");}
<YYINITIAL> "break" 	{ System.out.println ("BREAK");}
<YYINITIAL> "continue" 	{ System.out.println ("CONTINUE");}
<YYINITIAL> "default" 	{ System.out.println ("DEFAULT");}
<YYINITIAL> "else" 		{ System.out.println ("ELSE");}
<YYINITIAL> "for" 		{ System.out.println ("FOR");}
<YYINITIAL> "if" 		{ System.out.println ("IF");}
<YYINITIAL> "return"	{ System.out.println ("RETURN");}

<YYINITIAL> {NUMERO} 	{ return new Symbol(sym.NUM,yyline,yychar, yytext());} 
<YYINITIAL> \#{CADENA}	{ System.out.println ("COMENTARIO");}
<YYINITIAL> {CADENA}	{ return new Symbol(sym.CADENA,yyline,yychar, yytext());}
<YYINITIAL> {ID}        { return new Symbol(sym.ID,yyline,yychar, yytext());}
<YYINITIAL> {COMILLA} 	{ System.out.println ("COMILLA");}
<YYINITIAL> {LINEA} 	{ return new Symbol(sym.SL,yyline,yychar, yytext());}
<YYINITIAL> {TAB} 	{ System.out.println ("TABULACION");}
<YYINITIAL> {IDENTIFICADOR} 		{ return new Symbol(sym.IDE,yyline,yychar, yytext());}

<YYINITIAL> "(" 		{ return new Symbol(sym.PARIZQ,yyline,yychar, yytext());}
<YYINITIAL> ")" 		{ return new Symbol(sym.PARDER,yyline,yychar, yytext());}
<YYINITIAL> "[" 		{ return new Symbol(sym.CORCIZQ,yyline,yychar, yytext());}
<YYINITIAL> "]" 		{ return new Symbol(sym.CORDER,yyline,yychar, yytext());}
<YYINITIAL> "{" 		{ System.out.println ("LLAVE ABIERTA");}
<YYINITIAL> "}" 		{ System.out.println ("LLAVE CERRADA");}
<YYINITIAL> ";" 		{ return new Symbol(sym.PC,yyline,yychar, yytext());}
<YYINITIAL> ":" 		{ return new Symbol(sym.DP,yyline,yychar, yytext());}
<YYINITIAL> "," 		{ return new Symbol(sym.COMA,yyline,yychar, yytext());}
<YYINITIAL> "." 		{ return new Symbol(sym.PUNTO,yyline,yychar, yytext());}
<YYINITIAL> ">" 		{ System.out.println ("MAYOR");}
<YYINITIAL> ">=" 		{ System.out.println ("MAYOR O IGUAL");}
<YYINITIAL> "<" 		{ System.out.println ("MENOR");}
<YYINITIAL> "<=" 		{ System.out.println ("MENOR O IGUAL");}
<YYINITIAL> "=="		{ System.out.println ("IGUAL");}
<YYINITIAL> "="                 { System.out.println ("IGUAL");}
<YYINITIAL> "!" 		{ System.out.println ("DIFERENCIA");}
<YYINITIAL> "/" 		{ System.out.println ("DIVISION");}
<YYINITIAL> "+" 		{ System.out.println ("SIGNO MAS");}
<YYINITIAL> "-" 		{ System.out.println ("SIGNO MENOS");}
<YYINITIAL> "*" 		{ System.out.println ("SIGNO POR");}
<YYINITIAL> "/" 		{ System.out.println ("SIGNO DE DIVISION");}
<YYINITIAL> "%"			{ System.out.println ("SIGNO DE PORCENTAJE");}
<YYINITIAL> "_"			{ System.out.println ("GUION BAJO ");}


<YYINITIAL> [\n] 		{yychar=0;}
<YYINITIAL>  (" "|\r|\t)+	{ }

.
  { 
    System.out.println("error lexico en "  + yyline + "," + yychar + " No se reconoce " + yytext());
    yychar=0;
  }
  
  
