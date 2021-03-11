cmake_minimum_required(VERSION 3.4)
project(main)

set(CMAKE_CXX_FLAGS "-g -std=c++2a -Wall")

find_package(Java COMPONENTS Runtime REQUIRED)

# antlr4
set(antlr4-lib-cpp-dir ${PROJECT_SOURCE_DIR}/deps/antlr4/runtime/Cpp)
add_subdirectory(${antlr4-lib-cpp-dir} build)

set(project-antlr4-dir ${PROJECT_SOURCE_DIR}/antlr4)
set(antlr4-GENERATED_DIR ${project-antlr4-dir}/generated)

set(antlr4-GENERATED_SRC
  ${antlr4-GENERATED_DIR}/IoraLexer.cpp
  ${antlr4-GENERATED_DIR}/IoraParser.cpp
  ${antlr4-GENERATED_DIR}/IoraParserBaseVisitor.cpp
  ${antlr4-GENERATED_DIR}/IoraParserVisitor.cpp
  ${antlr4-GENERATED_DIR}/IoraParserBaseListener.cpp
  ${antlr4-GENERATED_DIR}/IoraParserListener.cpp
)

add_custom_target(GenerateParser DEPENDS ${antlr4-GENERATED_SRC})
add_custom_command(OUTPUT ${antlr4-GENERATED_SRC}
  COMMAND 
  ${CMAKE_COMMAND} -E make_directory ${antlr4-GENERATED_DIR}/
  COMMAND
  ${Java_JAVA_EXECUTABLE} -jar ${ANTLR_JAR_LOCATION} -Werror -Dlanguage=Cpp -listener -visitor -o ${antlr4-GENERATED_DIR}/ -package antlrcpptest ${project-antlr4-dir}/IoraLexer.g4 ${project-antlr4-dir}/IoraParser.g4

  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
  DEPENDS ${project-antlr4-dir}/IoraLexer.g4 ${project-antlr4-dir}/IoraParser.g4
)

include_directories(
  ${antlr4-lib-cpp-dir}/runtime/src
  ${antlr4-lib-cpp-dir}/runtime/src/misc
  ${antlr4-lib-cpp-dir}/runtime/src/atn
  ${antlr4-lib-cpp-dir}/runtime/src/dfa
  ${antlr4-lib-cpp-dir}/runtime/src/tree
  ${antlr4-lib-cpp-dir}/runtime/src/support
  ${antlr4-GENERATED_DIR}
)

set(iora_lib_SRC
  ${antlr4-GENERATED_SRC}
)

add_library(iora_lib ${iora_lib_SRC})
add_dependencies(iora_lib GenerateParser)
target_link_libraries(iora_lib antlr4_static stdc++fs)

add_executable(iora ${PROJECT_SOURCE_DIR}/src/main.cpp)
target_link_libraries(iora iora_lib)


# tests
option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
  enable_testing()
  include(GoogleTest)
  add_subdirectory(test)
endif()
