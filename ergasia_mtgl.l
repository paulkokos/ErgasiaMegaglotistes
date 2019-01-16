%option noyywrap
%{
    #include <stdio.h>
    int chars =0;
    int words =0;
    int lines =0;
    int line_number=1;
    void ret_print(char *token_type);
    void yyerror();
%}
%x COMMENT1
white_space     [ \t]*
nzdigit         [1-9]
digit           (0|{nzdigit})
alpha           [A-Za-z]
alpha_num       ({alpha}|{digit})
variable        (\$(alpha_num))

%%

"/*"           { BEGIN(COMMENT1); }
<COMMENT1>"*/" { BEGIN(INITIAL); }
<COMMENT1>\n   { }
<COMMENT1>.    { }
if              ret_print("Control_Structure_if");
and             ret_print("KeyWord_AND");
or              ret_print("KeyWord_OR");
">="            ret_print("GEQ");
"!="            ret_print("NEQ");
"<="            ret_print("NEQ");
"=="            ret_print("EQUAL");
"="             ret_print("ASSIGN");
"++"            ret_print("ASSIGNADDBYONE");
"--"            ret_print("ASSIGNSUBSTRACTBYONE");
"+="            ret_print("ASSIGNADD");
"-="            ret_print("ASSIGNSUBSTRACT");
"*="            ret_print("ASSIGNMULTIPLY");
"/="            ret_print("ASSIGNDIVIDE");

\n              line_number+=1;
"+"             ret_print(" Addition ");
"-"             ret_print(" Substruction ");
"*"             ret_print(" Multiplication ");
"/"             ret_print(" Division ");
"%"             ret_print(" Modulo ");

[ \t\n]+        printf( "Unrecognizedcharacter: %s\n", yytext);
%%
void ret_print(char *token_type)
{
    printf("%s\t%s\n", yytext, token_type);
    fprintf(yyout, "%s\t%s\n", yytext, token_type);
}
void yyerror(char *message)
{
    fprintf(yyout,"Error: \"%s\" in line %d. Token = %s\n",message,line_number,yytext);
    exit(1);
}
void countResults (){
    fprintf(yyout,"%8d Lines, %8d Words, %8d Characters",lines,words,chars);
}
int main(int argc, char *argv[])
{
    yyin= fopen(argv[1], "r");
    yyout= fopen("student_name.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}