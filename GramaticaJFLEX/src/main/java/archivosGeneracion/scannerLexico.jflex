//==================================================================================//
/* Área 1 - Código de Usuario*/

//Importación de Paquetes
package analizadores;
import java_cup.runtime.*;


%%
//==================================================================================//
/* Área 2 - Código de Usuario*/

//Directivas
%class Lexer //Scanner              //Indica el nombre de la clase generada
%public                             //Indica el método dse acceso de la clase generada
//%function next_token              //Cambia el nombre de la función de escaneo, si no se cambia, su nombre por defecto sera "yylex()".
%type java_cup.runtime.Symbol
%unicode
%cup
%line                               //Llevar control de filas
%column                             //Llevar control de columnas



/* Código de Usuario - Sintáxis de Java*/
%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
      return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
      return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]


/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"

// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

NombreIngrediente = [:jletter:] [:jletterdigit:]*

Numera =  0 | [1-9][0-9]*                                       //Se elimina el "-?" Por conflictos de sintaxis con las operaciones aritméticas con el operador "-".       (-?)
NumeraDecimus = [1-9]+ [0-9]* \. [0-9]*  | 0 \. [0-9]*          //Se elimina el "-?" Por conflictos de sintaxis con las operaciones aritméticas con el operador "-".       (-?)
Runas = [:jletterdigit:]*

//Estados
%state STRING


%%
//==================================================================================//
/* Área 3 - Reglas Léxicas y Acciones en Java*/

//Palabras Reservadas
//Estado ====== Símbolo ======================= Regla y Acción   

<YYINITIAL>     "Abracadabra"                   {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.ABRACADABRA));            return symbol(sym.ABRACADABRA);}
<YYINITIAL>     "Hechizo"                       {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.HECHIZO));                return symbol(sym.HECHIZO);}
<YYINITIAL>     "Hechizo_principal"             {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.HECHIZOPRINCIPAL));       return symbol(sym.HECHIZOPRINCIPAL);}
<YYINITIAL>     "Globalio"                      {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.GLOBALIO));               return symbol(sym.GLOBALIO);}
<YYINITIAL>     "siaparece"                     {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.SIAPARECE));              return symbol(sym.SIAPARECE);}
<YYINITIAL>     "si"                            {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.SI));                     return symbol(sym.SI);}
<YYINITIAL>     "sino"                          {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.SINO));                   return symbol(sym.SINO);}
<YYINITIAL>     "mientras"                      {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MIENTRAS));               return symbol(sym.MIENTRAS);}
<YYINITIAL>     "mutacion"                      {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MUTACION));               return symbol(sym.MUTACION);}
<YYINITIAL>     "paraRangus"                    {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.PARARANGUS));             return symbol(sym.PARARANGUS);}
<YYINITIAL>     "rivierto"                      {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.RIVIERTO));               return symbol(sym.RIVIERTO);}
<YYINITIAL>     "confracta"                     {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.CONFRACTA));              return symbol(sym.CONFRACTA);}
<YYINITIAL>     "Recita"                        {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.RECITA));                 return symbol(sym.RECITA);}
<YYINITIAL>     "Escribio"                      {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.ESCRIBIO));               return symbol(sym.ESCRIBIO);}

<YYINITIAL>     "Numera"                        {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NUMERA));                 return symbol(sym.NUMERA);}
<YYINITIAL>     "NumeraDecimus"                 {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NUMERADECIMUS));          return symbol(sym.NUMERADECIMUS);}                     
<YYINITIAL>     "SiNox"                         {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.SINOX));                  return symbol(sym.SINOX);}
<YYINITIAL>     "Runa"                          {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.RUNA));                   return symbol(sym.RUNA);}
<YYINITIAL>     "Runas"                         {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.RUNAS));                  return symbol(sym.RUNAS);}
<YYINITIAL>     "True"                          {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.TRUE));                   return symbol(sym.TRUE);}
<YYINITIAL>     "False"                         {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.FALSE));                  return symbol(sym.FALSE);}          
<YYINITIAL>     "not"                           {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NOTC));                   return symbol(sym.FALSE);}          

<YYINITIAL> {
  
/* Identificador */ 
    {NombreIngrediente}                         {System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NOMBREINGREDIENTE));          return symbol(sym.NOMBREINGREDIENTE, yytext()); }

/* Literales */
    {Numera}                                    { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NUMERALITERAL));             return symbol(sym.NUMERALITERAL, yytext()); }
    {NumeraDecimus}                             { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NUMERADECIMUSLITERAL));      return symbol(sym.NUMERADECIMUSLITERAL, yytext()); }
    {EndOfLineComment}                          { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.RUNASTRING));                return symbol(sym.RUNASTRING, yytext()); }
    \"                                          { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) );string.setLength(0); yybegin(STRING); }

/* Operadores Aritméticos*/
   
    "+"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.PLUS));                      return symbol(sym.PLUS); }
    "-"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MINUS));                     return symbol(sym.MINUS); }
    "*"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MUL));                       return symbol(sym.MUL); }
    "/"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.DIV));                       return symbol(sym.DIV); }
    "%"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MOD));                       return symbol(sym.MOD); }
    "^"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.POW));                       return symbol(sym.POW); }
    "="                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.EQ));                        return symbol(sym.EQ); }

/* Operadores Unarios*/
   
    "++"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.PLUSPLUS));                  return symbol(sym.PLUSPLUS); }
    "--"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MINUSMINUS));                return symbol(sym.MINUSMINUS); }

/* Operadores Lógicos*/
    "<"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.LESS));                      return symbol(sym.LESS); }
    "<="                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.LESSEQ));                    return symbol(sym.LESSEQ); }
    ">"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.GREATER));                   return symbol(sym.GREATER); }
    ">="                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.GREATEREQ));                 return symbol(sym.GREATEREQ); }
    "=="                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.EQEQ));                      return symbol(sym.EQEQ); }
    "!="                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.DIFF));                      return symbol(sym.DIFF); }
    "!"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NOT));                       return symbol(sym.NOT); }
    "@"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.NOTB));                      return symbol(sym.NOTB); }
    "&&"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.AND));                       return symbol(sym.AND); }
    "||"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.OR));                        return symbol(sym.OR); }   

/*Otros caracteres*/
    "#"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.SPACEGATO));                 return symbol(sym.SPACEGATO); }
    ","                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.COMMA));                     return symbol(sym.COMMA); }
    "("                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.PARENL));                    return symbol(sym.PARENL); }
    ")"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.PARENR));                    return symbol(sym.PARENR); }
    "{"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.KEYL));                      return symbol(sym.KEYL); }
    "}"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.KEYR));                      return symbol(sym.KEYR); }
    "<-"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.ASSIGN));                    return symbol(sym.ASSIGN); }  
    ";"                                         { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.DOTCOMMA));                  return symbol(sym.DOTCOMMA); }  
    "=>"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.DOUBLEDOT));                 return symbol(sym.DOUBLEDOT); }
    "//"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.COMMENT));                   return symbol(sym.COMMENT); }
    "/*"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MULCOMMENTL));                return symbol(sym.MULCOMMENTL); }
    "*/"                                        { System.out.println("Símbolo: " + yytext() + " Línea: " + String.valueOf(yyline + 1) + " Tipo: " + symbol(sym.MULCOMMENTR));return symbol(sym.MULCOMMENTR); }

 /* comments */
  {Comment}                                     { /* ignore */ }                   //No se ha tocado para que funcione, pero se supone es "RUNAS"

  /* whitespace */
  {WhiteSpace}                                  { /* ignore */ }
}


<STRING> {
  \"                             { yybegin(YYINITIAL); 
                                   return symbol(sym.STRING_LITERAL, 
                                   string.toString()); }
  [^\n\r\"\\]+                   { string.append( yytext() ); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }

  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}



//Manejo de Errores                                 Va aqui
[^]                             {throw new Error("Caractér Equivocado: ->" + yytext() + "<-"); }

