#include "Antlr4BaseLexer.h"
#include "Lexer.h"
#include "gmock/gmock.h"
#include "gtest/gtest.h"

using namespace iora;
using namespace std;

class LexerTestFixture : public ::testing::Test
{
  public:
    LexerTestFixture() {}
    void SetUp() {}
    void TearDown() {}
};

TEST_F(LexerTestFixture, Primary)
{
    ILexer* lexer = new Antlr4BaseLexer("iora 999");
}
