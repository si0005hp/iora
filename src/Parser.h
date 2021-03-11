#pragma once

#include <memory>

#include "Lexer.h"

namespace iora
{

class Parser
{
  public:
    Parser(std::unique_ptr<ILexer> lexer) : lexer_(std::move(lexer)) {}

  private:
    std::unique_ptr<ILexer> lexer_;
};

} // namespace iora
