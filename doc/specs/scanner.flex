package compiler.lexical;

import compiler.syntax.sym;
import compiler.lexical.Token;
import es.uned.lsi.compiler.lexical.ScannerIF;
import es.uned.lsi.compiler.lexical.LexicalError;
import es.uned.lsi.compiler.lexical.LexicalErrorManager;

// incluir aqui, si es necesario otras importaciones

%%
 
%public
%class Scanner
%char
%line
%column
%cup
%unicode


%implements ScannerIF
%scanerror LexicalError

// incluir aqui, si es necesario otras directivas

%{
  LexicalErrorManager lexicalErrorManager = new LexicalErrorManager ();
  int anidamientoComentario = 0;
%}  
  

ESPACIO_BLANCO=[ \t\r\n\f]
fin = "fin"{ESPACIO_BLANCO}

ID=[a-zA-Z]([a-zA-Z]|[0-9])*
NUM=0|[1-9][0-9]*
CADENA=\".*\"

%state COMMENT


%%

<YYINITIAL> 
{

        "/*"             {
                           yybegin(COMMENT);
                           anidamientoComentario++;
                         }
          			       
        "+"              {  
                           Token token = new Token (sym.PLUS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                         }
                         
                           
        "++"              {  
                           Token token = new Token (sym.AUTO_INCREMENTO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                         }

        "*"              {  
                           Token token = new Token (sym.MULT);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }

        "&&"             {  
                           Token token = new Token (sym.AND_LOGICA);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "["              {  
                           Token token = new Token (sym.OPEN_BRACKET);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "]"              {  
                           Token token = new Token (sym.CLOSE_BRACKET);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }

        "{"              {  
                           Token token = new Token (sym.OPEN_PARENTHESIS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         } 

        "}"              {  
                           Token token = new Token (sym.CLOSE_PARENTHESIS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         } 
                                                                                                 
        "("              {  
                           Token token = new Token (sym.OPEN_KEY);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        ")"              {  
                           Token token = new Token (sym.CLOSE_KEY);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        ";"              {  
                           Token token = new Token (sym.SEMI_COLON);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        ","              {  
                           Token token = new Token (sym.COLON);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        ":"              {  
                           Token token = new Token (sym.TWO_POINTS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "!"              {  
                           Token token = new Token (sym.NEGACION);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "=="             {  
                           Token token = new Token (sym.EQUAL);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "+="             {  
                           Token token = new Token (sym.ASSIGN_SUMA);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "="              {  
                           Token token = new Token (sym.ASSIGN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "<"              {  
                           Token token = new Token (sym.LOWER_THAN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "caso"           {  
                           Token token = new Token (sym.CASO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "#constante"     {  
                           Token token = new Token (sym.CONSTANTE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "corte"          {  
                           Token token = new Token (sym.CORTE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "entero"         {  
                           Token token = new Token (sym.ENTERO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "escribe"        {  
                           Token token = new Token (sym.ESCRIBE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "escribeEnt"     {  
                           Token token = new Token (sym.ESCRIBE_ENT);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "alternativas"   {  
                           Token token = new Token (sym.ALTENATIVAS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "mientras"       {  
                           Token token = new Token (sym.MIENTRAS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "pordefecto"     {  
                           Token token = new Token (sym.PORDEFECTO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "principal"      {  
                           Token token = new Token (sym.principal);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "devuelve"       {  
                           Token token = new Token (sym.DEVUELVE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "si"             {  
                           Token token = new Token (sym.SI);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "sino"           {  
                           Token token = new Token (sym.SINO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "tipo"           {  
                           Token token = new Token (sym.TIPO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        "vacio"          {  
                           Token token = new Token (sym.VACIO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        {ID}             {  
                           Token token = new Token (sym.IDENTIFICADOR);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        {NUM}            {  
                           Token token = new Token (sym.NUMERO);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }
                           
        {CADENA}            {  
                           Token token = new Token (sym.STRING);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
                           return token;
                         }


   {ESPACIO_BLANCO}	{}
   
   {fin} {}

    // error en caso de que no coincidencia
	[^]     
                        {                                               
                           LexicalError error = new LexicalError ();
                           error.setLine (yyline + 1);
                           error.setColumn (yycolumn + 1);
                           error.setLexema (yytext ());
                           lexicalErrorManager.lexicalError (error);
                        }
    
}

<COMMENT>
{
      "/*" {
              anidamientoComentario++;
            } 
      "*/"  {
              anidamientoComentario--;
              if (anidamientoComentario == 0 )
                  yybegin( YYINITIAL );
                  
                  
      } 

     {ESPACIO_BLANCO} { }
                .     { }
     {fin} {
            if ( anidamientoComentario != 0 )
                lexicalErrorManager.lexicalError("Comentario no balanceado");
     }
}