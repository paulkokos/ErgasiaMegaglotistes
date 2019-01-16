%option noyywrap yylineno
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
%s NEWLINE
white_space     [ \t]*
nzdigit         [1-9]
digit           (0|{nzdigit})
alpha           [A-Za-z]
alpha_num       ({alpha}|{digit})
variable        $[A-Za-z]

%%

"/*"            { BEGIN(COMMENT1); }
<COMMENT1>"*/"  { BEGIN(INITIAL); }
<COMMENT1>\n    { }
<COMMENT1>.     { }
<COMMENT1><<EOF>> { yyerror("Unclosed Comment"); }
"if"            ret_print("Control_Structure_if");
"else if"       ret_print("ELSE IF STATEMENT");
"else"          ret_print("ELSE STATEMENT");
"while"         ret_print("WHILE STATEMENT");
"for"           ret_print("FOR STATEMENT");
"do"            ret_print("DO ... WHILE STATEMENT");
"break"         ret_print("BREAK STATEMENT");
"case"          ret_print("CASE STATEMENT");
"&&"            ret_print("KeyWord AND");
"||"            ret_print("KeyWord OR");
">="            ret_print("GEQ");
"!="            ret_print("NEQ");
"<="            ret_print("LEQ");
"=="            ret_print("EQUAL");
"="             ret_print("ASSIGN");
"++"            ret_print("ASSIGNADDBYONE");
"--"            ret_print("ASSIGNSUBSTRACTBYONE");
"+="            ret_print("ASSIGNADD");
"-="            ret_print("ASSIGNSUBSTRACT");
"*="            ret_print("ASSIGNMULTIPLY");
"/="            ret_print("ASSIGNDIVIDE");

"+"             ret_print(" Addition ");
"-"             ret_print(" Substruction ");
"*"             ret_print(" Multiplication ");
"/"             ret_print(" Division ");
"%"             ret_print(" Modulo ");

"{"             ret_print("Opening Brackets");      
"}"             ret_print("Closing Brackets");

^\<\?php$          ret_print("Opening php script");
^\?\>$          ret_print("Closure php Script");

[echo]+          ret_print("Output Function");
[print]+         ret_print("Output Function");
[printf]+        ret_print("Output Function");

[\t\n]+         printf("%d  Unrecognized character: %s\n",yylineno,yytext);
[a-zA-Z]+       { words++; chars+=strlen(yytext); }
\n              {chars++; lines++; line_number+=1;}
$[0-9a-z]+ |
$\"[^"\n]+\" |
$`[^`\n]+` |
$'[^'\n]+'      {ret_print("Variable");}

%%


void ret_print(char *token_type)
{
    printf("%d  %s\t%s\n",yylineno, yytext, token_type);
    fprintf(yyout,"%d %s\t%s\n",yylineno, yytext, token_type);
}
void yyerror(char *message)
{
    fprintf(yyout,"%d Error: \"%s\" in line %d. Token = %s\n",yylineno,message,line_number,yytext);
    exit(1);
}
void countResults (){
    fprintf(yyout,"%d %8d Lines, %8d Words, %8d Characters",yylineno,lines,words,chars);
}
int main(int argc, char *argv[])
{
    yyin= fopen(argv[1], "r");
    yyout= fopen("student_name.txt","w");
    yylex();
    countResults();
    fclose(yyin);
    fclose(yyout);
    return 0;
}