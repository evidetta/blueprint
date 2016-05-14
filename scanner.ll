
%option c++
%option noyywrap
%option yyclass="Scanner"
%option prefix="blueprint"

%{

#include <iostream>
#include "scanner.hh"

using namespace std;

%}

identifier       [a-z]([a-z_]*[a-z])*
string_literal   \"([^\\]|\\["\\\/bfnrt])*\"
comment          \/\/.*\n

%%
"("                     { cout << "LPAREN: " << YYText() << endl; return Scanner::LPAREN; }
")"                     { cout << "RPAREN: " << YYText() << endl; return Scanner::RPAREN; }
"\n"                    { cout << "NEWLINE" << endl; return Scanner::NEWLINE; }
[ \t]
{identifier}            { cout << "IDENTIFIER: " << YYText() << endl; return Scanner::IDENTIFIER; }
{string_literal}        { cout << "STRING_LITERAL: " << YYText() << endl; return Scanner::STRING_LITERAL; }
{comment}
.                       { cout << "UNKNOWN: " << YYText() << endl; return Scanner::UNKNOWN; }
%%
