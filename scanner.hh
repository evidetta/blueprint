#ifndef SCANNER_H
#define SCANNER_H

#if ! defined(yyFlexLexerOnce)
#undef yyFlexLexer
#define yyFlexLexer blueprintFlexLexer // the trick with prefix; no namespace here :(
#include <FlexLexer.h>
#endif

class Scanner : public yyFlexLexer {
  public:
    Scanner(std::istream* inputStream) :  yyFlexLexer(inputStream) {}
    int yylex();
    virtual ~Scanner() {}

    static const int LPAREN            = 1;
    static const int RPAREN            = 2;
    static const int NEWLINE           = 4;

    static const int IDENTIFIER        = 8;
    static const int STRING_LITERAL    = 16;
    static const int COMMENT           = 32;

    static const int UNKNOWN           = 256;
};

#endif
