#include <iostream>
#include <fstream>

#include <FlexLexer.h>

using namespace std;

int main(int argc, char** argv)
{
  ifstream inputFileStream;

  try
  {
    cout << "Blueprint compiler v0.01." << endl << endl;

    istream* inputStream;

    if (argc > 1)
    {
      inputFileStream.open(argv[1], std::ifstream::in);

      if(!inputFileStream.is_open())
      {
        cerr << "Could not open " << argv[1] << ". Exiting...";
        return -1;
      }

      inputStream = (istream*)&inputFileStream;
    }
    else
    {
      inputStream = &cin;
    }

    FlexLexer* lexer = new yyFlexLexer(inputStream);

    cout << "Performing compliation..." << endl << endl;

    while(lexer->yylex() != 0);
    return 0;
  }
  catch(ifstream::failure e)
  {
    cerr << "Could not open " << argv[1] << ". Exiting...";
    return -1;
  }
}
