/*
flex 파일을 통해 패턴에 따라 무엇을 할지 미리 규칙을 정함
원래 3파트가 있는데 메인은 bison에 있어서 지웠음
(우분투에 한글이 안나와서 메모장에 쓴 후 복사해서 붙여넣는 작업을 하고 있습니다.)
*/


/*
%{ }% 이걸 통해 c언어 코드를 넣을 수 잇음
컴파일 할 때 필요한 헤더파일을 추가함
yylval은 input 값에 있는 숫자를 받기 위함
*/
%{
#include "fb_cal_1.tab.h"

int yylval;
%}

%%

 /*
 왼쪽은 정규표현식
 오른쪽은 c언어로 어떤 작업을 할 것이냐를 말함
 0-9에 붙어있는 플러스는 연속적인 숫자를 하나로 보겠다는 의미임
 */


"+"	{return ADD;}
"-"	{return SUB;}
"*"	{return MUL;}
"/"	{return DIV;}
"|"	{return ABS;}
[0-9]+	{yylval=atoi(yytext);return NUMBER;}
\n		{return EOL;}
[ \t]		{}
.		{printf("Mysterious char %c\n", *yytext);}

%%

// 메인은 bison에 있어서 지웠음
