
%option c++

%{
#include "y.tab.h"
%}

identifier       [a-z]([a-z_]*[a-z])*
string_literal   \"([^\\]|\\["\\\/bfnrt])*\"
comment          \/\/.*\n

%%
"("                     { printf("LPAREN: %s\n", yytext); return LPAREN; }
")"                     { printf("RPAREN: %s\n", yytext); return RPAREN; }
"\n"                    { printf("NEWLINE\n"); return NEWLINE; }
[ \t]
{identifier}            { printf("IDENTIFIER: %s\n", yytext); return IDENTIFIER; }
{string_literal}        { printf("STRING_LITERAL: %s\n", yytext); return STRING_LITERAL; }
{comment}
.                       { printf("UNKNOWN: %s\n", yytext); return UNKNOWN; }
%%

int yywrap(void){return 1;}

int main(int argc, char** argv)
{
  ++argv, --argc;

  if ( argc > 0 )
  {
    yyin = fopen( argv[0], "r" );
  }
  else
  {
    yyin = stdin;
  }

  while(yylex());
  fclose(yyin);
}
