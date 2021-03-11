#include <iostream>

#include "antlr4.h"

using namespace antlr4;
using namespace antlrcpptest;

static void printTree(CommonTokenStream &ts)
{
    IoraParser parser(&ts);
    std::cout << parser.program()->toStringTree(&parser) << std::endl;
}

static void printTokens(CommonTokenStream &ts)
{
    // IoraParser parser(&ts);
    ts.fill();
    for (auto &t : ts.getTokens()) std::cout << t->toString() << std::endl;
}

static void runFile(CommonTokenStream &ts)
{
    ts.fill();

    for (auto token : ts.getTokens())
    {
        std::cout << token->toString() << std::endl;
    }
}

int main(int argc, char const *argv[])
{
    if (argc < 2)
    {
        std::cerr << "[Usage]: ./iora filename" << std::endl;
        exit(1);
    }

    std::string sourcePath = argv[1];
    std::ifstream fstream;
    fstream.open(sourcePath);
    if (fstream.fail())
    {
        std::cerr << "Failed to read source." << std::endl;
        exit(1);
    }

    ANTLRInputStream is(fstream);
    IoraLexer lexer(&is);
    CommonTokenStream ts(&lexer);
    IoraParser parser(&ts);

    if (false)
        printTokens(ts);
    else if (false)
        printTree(ts);
    else
        runFile(ts);
    return 0;
}
