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

nomeVariavel = [a-zA-Z][_a-zA-Z0-9]*
inteiro = [0-9]+
decimal = [0-9]+["."]+[0-9]+
branco = [\t\r\n ]+
blocoComentario = "/*" ~"*/"
linhaComentario = {branco}* "#" .*
palavraChave = "if" | "class" | "int" | "while" | "do" | "input" | "printf" | "def" | "len" | "return" | "None" | "not" | "is" | "else" | "sum" | "f" | "import" | "in" | "range" | "for"
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
%%

{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{inteiro}               {imprimir ("NUMERO INTEIRO",yytext()); return INT; }
{decimal}               {imprimir ("NUMERO DECIMAL",yytext()); return DEC; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{terminador}            {imprimir ("Terminador", yytext()); return TERMINADOR;}
{lparent}               {imprimir ("lparent", yytexte()); return LPARENT;}
{rparent}               {imprimir ("rparent", yytexte()); return RPARENT;}
{igualdade}             {imprimir ("igualdade", yytexte()); return IGUALDADE;}
{igual}                 {imprimir ("igual", yytexte()); return IGUAL;}
{mod}                   {imprimir ("mod", yytexte()); return MOD;}
{soma}                  {imprimir ("soma", yytexte()); return SOMA;}
{sub}                   {imprimir ("sub", yytexte()); return SUB;}
{div}                   {imprimir ("div", yytexte()); return DIV;}
{mult}                  {imprimir ("mult", yytexte()); return MULT;}
{dot}                   {imprimir ("dot", yytexte()); return DOT;}
{rcol}                  {imprimir ("rcol", yytexte()); return RCOL;}
{lcol}                  {imprimir ("lcol", yytexte()); return LCOL;}
{virg}                  {imprimir ("virg", yytexte()); return VIRG;}
{underline}             {imprimir ("underline", yytexte()); return UNDERLINE;}
{doubleDot}             {imprimir ("doubleDot", yytexte()); return DOUBLEDOT;}
{branco}                {return BRANCO; }

.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
