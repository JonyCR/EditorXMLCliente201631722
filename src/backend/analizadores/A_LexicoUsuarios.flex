
/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes, Importaciones
package backend.analizadores;
import java_cup.runtime.*;
import java.util.ArrayList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{

public String extraerInfo (String token){
    int longitud = token.length();
    String tokenSinCorchetes = token.substring(1, longitud-1);
    System.out.println("El token a enviar es: "+tokenSinCorchetes);
    return tokenSinCorchetes;
}

%}

//-------> Directivas
%public 
%class Analizador_Lexico_Usuarios
%cupsym SimbolosUsuarios
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//--------> Expresiones Regulares

LINETERMINATOR = \r|\n|\r\n
WHITE=[ \t\f]+
ALL = ([:jletterdigit:] | [-] | [_] | [$]|"+"|"*"|"'"|":"|","|";"|"@"|"%"|"&")+

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Simbolos y Expresiones Regulares

<YYINITIAL> {

        ("u"|"U")("s"|"S")("u"|"U")("a"|"A")("r"|"R")("i"|"I")("o"|"O") {System.out.println("Se reconocio "+yytext()+" de tipo Usuario"); return new Symbol(SimbolosUsuarios.Usuario, yycolumn, yyline, yytext()); }

        ("u"|"U")("s"|"S")("u"|"U")("a"|"A")("r"|"R")("i"|"I")("o"|"O")("s"|"S") {System.out.println("Se reconocio "+yytext()+" de tipo Usuarios"); return new Symbol(SimbolosUsuarios.Usuarios, yycolumn, yyline, yytext()); }       

         ("i"|"I")("d"|"D") {System.out.println("Se reconocio "+yytext()+" de tipo Id"); return new Symbol(SimbolosUsuarios.Id, yycolumn, yyline, yytext()); }

         ("c"|"C")("o"|"O")("n"|"N")("t"|"T")("r"|"R")("a"|"A")("s"|"S")("e"|"E")("ñ"|"Ñ")("a"|"A") { System.out.println("Se reconocio "+yytext()+" de tipo Contraseña"); return new Symbol(SimbolosUsuarios.Contraseña, yycolumn, yyline, yytext()); }

         "="    { System.out.println("Se reconocio "+yytext()+" de Igual"); return new Symbol(SimbolosUsuarios.Igual, yycolumn, yyline, yytext()); }

         "<"    { System.out.println("Se reconocio "+yytext()+" de tipo Menor Que"); return new Symbol(SimbolosUsuarios.MenorQue, yycolumn, yyline, yytext()); }

         "/"    { System.out.println("Se reconocio "+yytext()+" de tipo Diagonal"); return new Symbol(SimbolosUsuarios.Diagonal, yycolumn, yyline, yytext()); }

         ">"    { System.out.println("Se reconocio "+yytext()+" de tipo Mayor Que"); return new Symbol(SimbolosUsuarios.MayorQue, yycolumn, yyline, yytext()); }

        {WHITE} { /*Se ignora*/}
        
        {LINETERMINATOR} {/*Se Ingnora*/}

        ("\""){ALL}("\"") { System.out.println("Se reconocio "+yytext()+" de tipo Dato entre comillas"); return new Symbol(SimbolosUsuarios.DatoEntreComillas, yycolumn, yyline, extraerInfo(yytext())); }

        
}

. {System.out.println("Se reconocio el error lexico: "+yytext()); return new Symbol(SimbolosUsuarios.ErrorLexico, yycolumn, yyline, yytext()); 
}



