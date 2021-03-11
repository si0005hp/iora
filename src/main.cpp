#include <iostream>

#include "iora-antlr4.h"

using namespace antlr4;
using namespace antlrcpptest;

int main(int argc, char const *argv[])
{
    if (argc < 2) {
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

    auto ctx = parser.program();
    for (auto & stmt : ctx->statement())
    {
        std::cout << stmt->NUMBER()->getText() << std::endl;
    }

    return 0;
}
