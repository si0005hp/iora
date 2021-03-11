#pragma once

#include <memory>

namespace iora
{

struct Token
{
};

enum TokenType
{
};

class ILexer
{
  public:
    virtual std::unique_ptr<Token> readToken() = 0;
};

} // namespace iora
