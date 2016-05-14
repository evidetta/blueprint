
%option c++
%option noyywrap

%{

#include <iostream>
#include "scanner.h"

using namespace std;

%}

identifier       [a-z]([a-z_]*[a-z])*
string_literal   \"([^\\]|\\["\\\/bfnrt])*\"
comment          \/\/.*\n

%%
"("                     { cout << "LPAREN: " << YYText() << endl; return LPAREN; }
")"                     { cout << "RPAREN: " << YYText() << endl; return RPAREN; }
"\n"                    { cout << "NEWLINE" << endl; return NEWLINE; }
[ \t]
{identifier}            { cout << "IDENTIFIER: " << YYText() << endl; return IDENTIFIER; }
{string_literal}        { cout << "STRING_LITERAL: " << YYText() << endl; return STRING_LITERAL; }
{comment}
.                       { cout << "UNKNOWN: " << YYText() << endl; return UNKNOWN; }
%%
