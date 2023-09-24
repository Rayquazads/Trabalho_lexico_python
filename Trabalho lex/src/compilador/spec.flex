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
blocoComentario = "'''" ~"'''" | "\"\"\"" ~"\"\"\""
linhaComentario = {branco}* "#" .*
palavraChave = "if"| "elif" |{nomeVariavel}{dot}{nomeVariavel}| "url" | "switch"| "case" | "try" | "except" | "opne" | "class" | "break" | "int" | "while" | "do" | "float"| "input" | "bool" | "string" | "long" | "append "| "print" | "def" | "len" | "return" | "None" | "not" | "is" | "else" | "sum" | "import" | "in"| "pass" | "range" | "for" | "true" | "false" | "var"
terminador = ";"
lparent = "("
rparent = ")"
lcol = "["
rcol = "]"
lbrace = "{"
rbrace = "}"
aspas =  \"
aspasSimples = "'"
underline = "_"
igualdade = "=="
notequal = "!="
menorque = "<="
maiorque = ">="
til = "~"
doublestar = "**"
circunflexo = "^"
comercial = "&"
igual = "="
porcentagem = "%"
soma = "+"
sub = "-"
div = "/"
ou = "|"
maior = ">"
menor = "<"
mult = "*"
dot = "."
virg = ","
colon = ":"
stexto = \"[^\"]*\"
%%

{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{inteiro}               {imprimir ("NUMERO INTEIRO",yytext()); return INT; }
{decimal}               {imprimir ("NUMERO DECIMAL",yytext()); return DEC; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{aspas}                 {imprimir ("aspas",yytext()); return ASPAS; }
{aspasSimples}          {imprimir ("aspasSimples",yytext()); return ASPASSIMPLES; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{terminador}            {imprimir ("Terminador", yytext()); return TERMINADOR;}
{lparent}               {imprimir ("lparent", yytext()); return LPARENT;}
{rparent}               {imprimir ("rparent", yytext()); return RPARENT;}
{rbrace}                {imprimir ("rbrace", yytext()); return RBRACE;}
{lbrace}                {imprimir ("lbrace", yytext()); return LBRACE;}
{doublestar}            {imprimir ("doublestar", yytext()); return DOUBLESTAR;}
{menor}                 {imprimir ("menor", yytext()); return MENOR;}
{comercial}             {imprimir ("comercial", yytext()); return COMERCIAL;}
{maior}                 {imprimir ("maior", yytext()); return MAIOR;}
{notequal}              {imprimir ("notequal", yytext()); return NOTEQUAL;}
{igualdade}             {imprimir ("igualdade", yytext()); return IGUALDADE;}
{menorque}              {imprimir ("menor que", yytext()); return MENORQUE;}
{maiorque}              {imprimir ("maior que", yytext()); return MAIORQUE;}
{til}                   {imprimir ("til", yytext()); return TIL;}
{circunflexo}           {imprimir ("circunflexo", yytext()); return CIRCUNFLEXO;}
{ou}                    {imprimir ("ou", yytext()); return OU;}
{igual}                 {imprimir ("igual", yytext()); return IGUAL;}
{porcentagem}           {imprimir ("porcentagem", yytext()); return PORCENTAGEM;}
{soma}                  {imprimir ("soma", yytext()); return SOMA;}
{sub}                   {imprimir ("sub", yytext()); return SUB;}
{div}                   {imprimir ("div", yytext()); return DIV;}
{mult}                  {imprimir ("mult", yytext()); return MULT;}
{dot}                   {imprimir ("dot", yytext()); return DOT;}
{rcol}                  {imprimir ("rcol", yytext()); return RCOL;}
{lcol}                  {imprimir ("lcol", yytext()); return LCOL;}
{virg}                  {imprimir ("virg", yytext()); return VIRG;}
{underline}             {imprimir ("underline", yytext()); return UNDERLINE;}
{colon}                 {imprimir ("ponto duplo", yytext()); return COLON;}
{stexto}                {imprimir ("string", yytext()); return STEXTO;} //reconhecer string delimitadas por aspas duplas
{branco}                {return BRANCO; }

.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
