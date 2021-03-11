#pragma once

#include "IoraLexer.h"
#include "IoraParser.h"
#include "IoraParserBaseListener.h"
#include "IoraParserBaseVisitor.h"
#include "IoraParserListener.h"
#include "IoraParserVisitor.h"
#include "antlr4-runtime.h"

inline void printTree(std::ifstream& source)
{
    using namespace antlr4;
    using namespace antlrcpptest;

    ANTLRInputStream is(source);
    IoraLexer lexer(&is);
    CommonTokenStream ts(&lexer);
    IoraParser parser(&ts);
    std::cout << parser.program()->toStringTree(&parser) << std::endl;
}
