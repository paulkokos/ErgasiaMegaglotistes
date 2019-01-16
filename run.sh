#! /bin/bash
flex ergasia_mtgl.l
gcc lex.yy.c -lfl
./a.out PHP_basics.txt