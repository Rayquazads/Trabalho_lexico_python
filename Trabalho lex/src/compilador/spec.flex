package compilador;
import static compilador.Token.*;

%%

%{
    private void imprimir(String token, String lexema){
        System.out.println(lexema + " ===>> " + token);
    }
%}

%class Lexer
%type Token

nomeVariavel = [_a-zA-Z][_a-zA-Z0-9]*
inteiro = [0-9]+
decimal = [0-9]+["."]+[0-9]+
branco = [\t\r\n ]+
blocoComentario = "'''" ~"'''" | "\"\"\"" ~"\"\"\""
linhaComentario = {branco}* "#" .*
palavraChave = "if" | "class" | "int" | "while" | "do" | "float"| "input" | "printf" | "def" | "len" | "return" | "None" | "not" | "is" | "else" | "sum" | "import" | "in" | "range" | "for"
terminador = ";"
lparent = "("
rparent = ")"
lcol = "["
rcol = "]"
underline = "_"
igualdade = "=="
igual = "="
mod = "%"
soma = "+"
sub = "-"
div = "/"
mult = "*"
dot = "."
virg = ","
doubleDot = ":"
stexto = \"[^\"]*\"
%%

{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{inteiro}               {imprimir ("NUMERO INTEIRO",yytext()); return INT; }
{decimal}               {imprimir ("NUMERO DECIMAL",yytext()); return DEC; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{terminador}            {imprimir ("Terminador", yytext()); return TERMINADOR;}
{lparent}               {imprimir ("lparent", yytext()); return LPARENT;}
{rparent}               {imprimir ("rparent", yytext()); return RPARENT;}
{igualdade}             {imprimir ("igualdade", yytext()); return IGUALDADE;}
{igual}                 {imprimir ("igual", yytext()); return IGUAL;}
{mod}                   {imprimir ("mod", yytext()); return MOD;}
{soma}                  {imprimir ("soma", yytext()); return SOMA;}
{sub}                   {imprimir ("sub", yytext()); return SUB;}
{div}                   {imprimir ("div", yytext()); return DIV;}
{mult}                  {imprimir ("mult", yytext()); return MULT;}
{dot}                   {imprimir ("dot", yytext()); return DOT;}
{rcol}                  {imprimir ("rcol", yytext()); return RCOL;}
{lcol}                  {imprimir ("lcol", yytext()); return LCOL;}
{virg}                  {imprimir ("virg", yytext()); return VIRG;}
{underline}             {imprimir ("underline", yytext()); return UNDERLINE;}
{doubleDot}             {imprimir ("doubleDot", yytext()); return DOUBLEDOT;}
{stexto}                {imprimir ("string", yytext()); return STEXTO;} //reconhecer string delimitadas por aspas duplas
{branco}                {return BRANCO; }

.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
