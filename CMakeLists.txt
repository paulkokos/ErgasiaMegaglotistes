cmake_minimum_required(VERSION 3.5.1)
project(ErgasiaMetaglotistes)
FIND_PACKAGE(BISON REQUIRED)
set(CMAKE_CXX_STANDARD 11)
#SET(BisonOutput ${CMAKE_SOURCE_DIR}/src/rcdgen/parser.cpp)
#IF(BISON_FOUND)
#    ADD_CUSTOM_COMMAND(
#            OUTPUT ${BisonOutput}
#            COMMAND ${BISON_EXECUTABLE}
#            --defines=${CMAKE_SOURCE_DIR}/src/rcdgen/tokens.h
#            --output=${BisonOutput}
#            ${CMAKE_SOURCE_DIR}/src/rcdgen/parser.y
#            COMMENT "Generating parser.cpp"
#    )
#ENDIF()

FIND_PACKAGE(FLEX REQUIRED)
SET(FlexOutput ${CMAKE_SOURCE_DIR}/ErgasiaMetaglotistes.cpp)
IF(FLEX_FOUND)
    ADD_CUSTOM_COMMAND(
            OUTPUT ${FlexOutput}
            COMMAND ${FLEX_EXECUTABLE}
            --outfile=${FlexOutput}
            ${CMAKE_SOURCE_DIR}/ergasia_mtgl.l
            COMMENT "Generating scanner.cpp"
    )
ENDIF()
ADD_LIBRARY(MyLib ${FlexOutput})
add_executable(ErgasiaMetaglotistes ErgasiaMetaglotistes.cpp)