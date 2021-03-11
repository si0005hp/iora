#pragma once

#include <memory>
#include <vector>

#include "Lexer.h"
#include "antlr4.h"

namespace iora
{

using namespace antlr4;
using namespace antlrcpptest;

class Antlr4BaseLexer : public ILexer
{
  public:
    Antlr4BaseLexer(const std::string &source)
      : is_(source),
        lexer_(&is_),
        ts_(&lexer_),
        tokenIdx(0)
    {
        ts_.fill();
    }

    virtual std::unique_ptr<Token> readToken();

  private:
    ANTLRInputStream is_;
    IoraLexer lexer_;
    CommonTokenStream ts_;
    int tokenIdx;
};

inline std::unique_ptr<Token> Antlr4BaseLexer::readToken()
{
    antlr4::Token *antlr4Token = ts_.get(tokenIdx++);
    // convert to our token
    return nullptr;
}

} // namespace iora
