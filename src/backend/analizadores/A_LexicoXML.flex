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
%class Analizador_Lexico_XML
%cupsym Simbolos
%cup
%char
%column
%full
%line
%unicode

//--------> Expresiones Regulares

D = [0-9]
LINETERMINATOR = \r|\n|\r\n
WHITE=[ \t\f]+
URL = ((http(s)?)(":")("/")("/"))?([:jletterdigit:])+(".")([:jletterdigit:])+(".")([:jletterdigit:] | [-] | [_] | [$]|"+"|"*"|"'"|":"|","|";"|"@"|"%"|"&"|"/"|"#"|"?"|"¿"|"¡"|"!"|".")+
IDENTIFICADOR = ( [_] | [-] | [$] )([:jletterdigit:] | [-] | [_] | [$] )+

FECHA = {D}{D}{D}{D}("-")("0"|"1"){D}("-")(("0"|"1"|"2"){D}|("3")("0"|"1"))

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Simbolos y Expresiones Regulares

<YYINITIAL> {

          
         ("\"")("ID")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Id"); return new Symbol(Simbolos.Id, yycolumn, yyline, yytext()); }

         ("a"|"A")("c"|"C")("c"|"C")("i"|"I")("o"|"O")("n"|"N") {System.out.println("Se reconocio "+yytext()+" de tipo Accion"); return new Symbol(Simbolos.Accion, yycolumn, yyline, yytext()); }

          ("a"|"A")("c"|"C")("c"|"C")("i"|"I")("o"|"O")("n"|"N")("e"|"E")("s"|"S")    { System.out.println("Se reconocio "+yytext()+" de tipo Acciones"); return new Symbol(Simbolos.Acciones, yycolumn, yyline, yytext()); }

          ("a"|"A") ("t"|"T") ("r"|"R") ("i"|"I") ("b"|"B") ("u"|"U") ("t"|"T") ("o"|"O")    { System.out.println("Se reconocio "+yytext()+" de tipo Atributo"); return new Symbol(Simbolos.Atributo, yycolumn, yyline, yytext()); }

         ("a"|"A") ("t"|"T") ("r"|"R") ("i"|"I") ("b"|"B") ("u"|"U") ("t"|"T") ("o"|"O")("s"|"S")   { System.out.println("Se reconocio "+yytext()+" de tipo Atributos"); return new Symbol(Simbolos.Atributos, yycolumn, yyline, yytext()); }

         ("n"|"N")("o"|"O")("m"|"M")("b"|"B")("r"|"R")("e"|"E")   { System.out.println("Se reconocio "+yytext()+" de tipo Nombre"); return new Symbol(Simbolos.Nombre, yycolumn, yyline, yytext()); }

         "="    { System.out.println("Se reconocio "+yytext()+" de Igual"); return new Symbol(Simbolos.Igual, yycolumn, yyline, yytext()); }

         "<"    { System.out.println("Se reconocio "+yytext()+" de tipo Menor Que"); return new Symbol(Simbolos.MenorQue, yycolumn, yyline, yytext()); }

         "/"    { System.out.println("Se reconocio "+yytext()+" de tipo Diagonal"); return new Symbol(Simbolos.Diagonal, yycolumn, yyline, yytext()); }

         ">"    { System.out.println("Se reconocio "+yytext()+" de tipo Mayor Que"); return new Symbol(Simbolos.MayorQue, yycolumn, yyline, yytext()); }

         ("e"|"E")("t"|"T")("i"|"I")("q"|"Q")("u"|"U")("e"|"E")("t"|"T")("a"|"A")    { System.out.println("Se reconocio "+yytext()+" de tipo Etiqueta"); return new Symbol(Simbolos.Etiqueta, yycolumn, yyline, yytext()); }

         ("e"|"E")("t"|"T")("i"|"I")("q"|"Q")("u"|"U")("e"|"E")("t"|"T")("a"|"A") ("s"|"S")    { System.out.println("Se reconocio "+yytext()+" de tipo Etiquetas"); return new Symbol(Simbolos.Etiquetas, yycolumn, yyline, yytext()); }

         ("v"|"V") ("a"|"A") ("l"|"L") ("o"|"O") ("r"|"R")    { System.out.println("Se reconocio "+yytext()+" de tipo Valor"); return new Symbol(Simbolos.Valor, yycolumn, yyline, yytext()); }

         ("p"|"P") ("a"|"A") ("r"|"R") ("a"|"A") ("m"|"M") ("e"|"E") ("t"|"T") ("r"|"R") ("o"|"O")     { System.out.println("Se reconocio "+yytext()+" de tipo Parametro"); return new Symbol(Simbolos.Parametro, yycolumn, yyline, yytext()); }

         ("p"|"P") ("a"|"A") ("r"|"R") ("a"|"A") ("m"|"M") ("e"|"E") ("t"|"T") ("r"|"R") ("o"|"O")("s"|"S")      { System.out.println("Se reconocio "+yytext()+" de tipo Parametros"); return new Symbol(Simbolos.Parametros, yycolumn, yyline, yytext()); }

         ("\"")("TEXTO")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo TEXTO"); return new Symbol(Simbolos.Texto, yycolumn, yyline, yytext()); }

         ("\"")("ALINEACION")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo ALINEACION"); return new Symbol(Simbolos.Alineacion, yycolumn, yyline, yytext()); }

         ("\"")("COLOR")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo COLOR"); return new Symbol(Simbolos.Color, yycolumn, yyline, yytext()); }

         ("\"")("ORIGEN")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo ORIGEN"); return new Symbol(Simbolos.Origen, yycolumn, yyline, yytext()); }

         ("\"")("ALTURA")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo ALTURA"); return new Symbol(Simbolos.Altura, yycolumn, yyline, yytext()); }

         ("\"")("ANCHO")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo ANCHO"); return new Symbol(Simbolos.Ancho, yycolumn, yyline, yytext()); }

         ("\"")("ETIQUETAS")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo ETIQUETAS"); return new Symbol(Simbolos.AtributoEtiquetas, yycolumn, yyline, yytext()); }

         ("\"")("NUEVO_SITIO_WEB")("\"")    { System.out.println("Se reconocio "+yytext()+" de tipo Nuevo Sitio Web"); return new Symbol(Simbolos.NuevoSitioWeb, yycolumn, yyline, yytext()); }

         ("\"")("USUARIO_CREACION")("\"")     { System.out.println("Se reconocio "+yytext()+" de tipo Usuario Creacion"); return new Symbol(Simbolos.UsuarioCreacion, yycolumn, yyline, yytext()); }

         ("\"")("FECHA_CREACION")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Fecha Creacion"); return new Symbol(Simbolos.FechaCreacion, yycolumn, yyline, yytext()); }

         ("\"")("FECHA_MODIFICACION")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Fecha Modificacion"); return new Symbol(Simbolos.FechaModificacion, yycolumn, yyline, yytext()); }

         ("\"")("USUARIO_MODIFICACION")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Usuario Modificacion"); return new Symbol(Simbolos.UsuarioModificacion, yycolumn, yyline, yytext()); }

         ("\"")("BORRAR_SITIO_WEB")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Borrar Sitio Web"); return new Symbol(Simbolos.BorrarSitioWeb, yycolumn, yyline, yytext()); }

         ("\"")("NUEVA_PAGINA")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Nueva Pagina"); return new Symbol(Simbolos.NuevaPagina, yycolumn, yyline, yytext()); }

         ("\"")("BORRAR_PAGINA")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Borrar Pagina"); return new Symbol(Simbolos.BorrarPagina, yycolumn, yyline, yytext()); }

         ("\"")("BORRAR_COMPONENTE")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Borrar Componente"); return new Symbol(Simbolos.BorrarComponente, yycolumn, yyline, yytext()); }

         ("\"")("AGREGAR_COMPONENTE")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Agregar Componente"); return new Symbol(Simbolos.AgregarComponente, yycolumn, yyline, yytext()); }

         ("\"")("MODIFICAR_COMPONENTE")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Modificar Componente"); return new Symbol(Simbolos.ModificarComponente, yycolumn, yyline, yytext()); }

         ("\"")("MODIFICAR_PAGINA")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Modificar Pagina"); return new Symbol(Simbolos.ModificarPagina, yycolumn, yyline, yytext()); }

         ("\"")("TITULO")("\"")     { System.out.println("Se reconocio "+yytext()+" de tipo Titulo"); return new Symbol(Simbolos.Titulo, yycolumn, yyline, yytext()); }

         ("\"")("PAGINA")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Pagina"); return new Symbol(Simbolos.Pagina, yycolumn, yyline, yytext()); }        

         ("\"")("SITIO")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Sitio"); return new Symbol(Simbolos.Sitio, yycolumn, yyline, yytext()); }

         ("\"")("PADRE")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Padre"); return new Symbol(Simbolos.Padre, yycolumn, yyline, yytext()); }

         ("\"")("CLASE")("\"")      { System.out.println("Se reconocio "+yytext()+" de tipo Clase"); return new Symbol(Simbolos.Clase, yycolumn, yyline, yytext()); }

        {WHITE} { /*Se ignora*/}
        
        {LINETERMINATOR} {/*Se Ingnora*/}

        ("\""){IDENTIFICADOR}("\"") { System.out.println("Se reconocio "+yytext()+" de tipo Dato entre comillas"); return new Symbol(Simbolos.DatoEntreComillas, yycolumn, yyline, extraerInfo(yytext())); }

        ("["){D}+("]") { System.out.println("Se reconocio "+yytext()+" de tipo Entero"); return new Symbol(Simbolos.Entero, yycolumn, yyline, extraerInfo(yytext())); }

        ("["){IDENTIFICADOR}("]") { System.out.println("Se reconocio "+yytext()+" de tipo Identificador"); return new Symbol(Simbolos.Identificador, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("TITULO")("]") { System.out.println("Se reconocio "+yytext()+" de tipo TITULO componente"); return new Symbol(Simbolos.TituloComponente, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("PARRAFO")("]") { System.out.println("Se reconocio "+yytext()+" de tipo PARRAFO componente"); return new Symbol(Simbolos.ParrafoComponente, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("IMAGEN")("]") { System.out.println("Se reconocio "+yytext()+" de tipo IMAGEN componente"); return new Symbol(Simbolos.ImagenComponente, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("VIDEO")("]") { System.out.println("Se reconocio "+yytext()+" de tipo VIDEO Componente"); return new Symbol(Simbolos.VideoComponente, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("MENU")("]") { System.out.println("Se reconocio "+yytext()+" de tipo MENU Componente"); return new Symbol(Simbolos.MenuComponente, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("CENTRAR")("]") { System.out.println("Se reconocio "+yytext()+" de tipo Centrar"); return new Symbol(Simbolos.Centrar, yycolumn, yyline, extraerInfo(yytext()));}

        ("[")("IZQUIERDA")("]") { System.out.println("Se reconocio "+yytext()+" de tipo Izquierda"); return new Symbol(Simbolos.Izquierda, yycolumn, yyline, extraerInfo(yytext()));}

        ("[")("DERECHA")("]") { System.out.println("Se reconocio "+yytext()+" de tipo Derecha"); return new Symbol(Simbolos.Derecha, yycolumn, yyline, extraerInfo(yytext()));}

        ("[")("JUSTIFICAR")("]") { System.out.println("Se reconocio "+yytext()+" de tipo Justificar"); return new Symbol(Simbolos.Justificar, yycolumn, yyline, extraerInfo(yytext()));}

        ("["){URL}("]") { System.out.println("Se reconocio "+yytext()+" de tipo URL"); return new Symbol(Simbolos.URL, yycolumn, yyline, extraerInfo(yytext()));}
        
        ("["){FECHA}("]") { System.out.println("Se reconocio "+yytext()+" de tipo Fecha"); return new Symbol(Simbolos.Fecha, yycolumn, yyline, extraerInfo(yytext()));}

        ("[")([:jletterdigit:] | [-] | [_] | [$]|"+"|"*"|"'"|":"|","|"("|")"|";"|"|"|"@"|"%"|"&"|{WHITE}|{LINETERMINATOR})+("]") { System.out.println("Se reconocio "+yytext()+" de tipo Valor Parametro"); return new Symbol(Simbolos.ValorParametro, yycolumn, yyline, extraerInfo(yytext())); }

        ("[")("#")(([a-fA-F]|[0-9]){6})("]") { System.out.println("Se reconocio "+yytext()+" de tipo Color de Texto"); return new Symbol(Simbolos.TextColor, yycolumn, yyline, extraerInfo(yytext())); }
}

. {System.out.println("Se reconocio el error lexico: "+yytext()); return new Symbol(Simbolos.ErrorLexico, yycolumn, yyline, yytext()); 
}



