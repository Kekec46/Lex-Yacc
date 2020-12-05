%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *);
%}
digit		[0-9]
alphabetic	[a-zA-Z_]
alphanumeric	({alphabetic}|{digit})
%%


start				return START;
end				return END;
;				return SC;
yazdir				return PRINT;
dongu					return DONGU;
yap				return YAP;
integer				return INTEGER;
floatv				return FLOATV;
karakter			return KARAKTER;
string				return STRING;
eger				return EGER;
degil					return DEGIL;


{digit}+,{digit}+		return SAYIRASYONEL;
{digit}+			return SAYI;
{digit}+{alphanumeric}+		return DUM;
[ \n\t]				;				
\${alphabetic}{alphanumeric}*	return VARIABLE;
["'][a-zA-Z _-]*["']		return DEGER;



[/]{2,2}.*			return YORUM;
"^"				return BIRLESTIRICI;
"("				return PA;			
")"				return PK;
"{"				return SPA;			
"}"				return SPK;
":"				return INU;			
[/*]				return FIRSTLOGIC;
[+-]				return SECONDLOGIC;
"|"				return DC;			
"=="				return KE;
"!="				return KED;			
"<="				return KKE;
">="				return KBE;
">"				return KB;
"<"				return KK;
[|&]				return SART;
"++"				return PLUS2;
"--"				return MINUS2;
.				;				



%%
int yywrap(){
	return 1;
}
