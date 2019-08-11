
/*
이것도 3파트
C언어 문법 필요한거 넣었고
어떤 토큰이 있는지 알려줌
*/
%{
#include <stdio.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

 /*
calclist:
calclist를 보면 EOL이 마지막에 오면 숫자를 배출하고 다음줄로 넘어가라
$2는 잘 모르겠음
제 생각엔 calclist exp EOL 순서대로 $1, $2, $3을 뜻하는 것임
 */

calclist:
| calclist exp EOL {printf("= %d\n", $2);}
;

 /*
exp: factor
$$는 $1임 결국 연산해서 $1로 만들어줌 결국 exp가 남음
factor: term
똑같음
term: NUMBER
똑같음
 */
exp: factor
|exp ADD factor {$$=$1+$3;}
|exp SUB factor {$$=$1-$3;}
;

factor: term
|factor MUL term {$$=$1*$3;}
|factor DIV term {$$=$1/$3;}
;

term: NUMBER
|ABS term {$$=$2 >= 0 ? $2 : -$2;}
;


 /*
결국 우선순위를 위해 변수를 여러개로 해 놓음
결국 exp: factor에서는 factor를 먼저 찾을 것이고,
factor: term에서는 term을 먼저 찾을 것이고
이런식으로 우선순위를 설정하는 것으로 생각하고 있음
 */

%%

/*
메인함수를 만들어 에러메세지 호출 함수도 정의함
yyparse() 규칙에 따라서 토큰을 처리함
*/

main (int argc, char * argv[])
{
	yyparse();
}

yyerror (char * s)
{
	fprintf(stderr, "error \: %s\n", s);
}

