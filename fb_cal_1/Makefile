fb_cal_1: fb_cal_1.l fb_cal_1.y
	bison -d fb_cal_1.y
	flex fb_cal_1.l
	cc -o $@ fb_cal_1.tab.c lex.yy.c -lfl
