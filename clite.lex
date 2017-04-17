%{
#include "y.tab.h"
%}


DIGIT		[0-9]
ID 			[a-z][a-z0-9]
LETTER, DIGIT, FLOAT, BOOLEAN, INTEGER, CHAR
%%


{DIGIT}+				{	printf("An Integer: %s (%d)\n", yytext, atoi(yytext));
						
						}

{DIGIT}+"."{DIGIT}*		{	printf( "A Float: %s (%g)\n", yytext, atof( yytext ) );

						}






if|then|int|float|bool|char {	printf("A keyword: %s\n", yytext);
	
							}

{ID}					{printf( "An identifier: %s\n", yytext );
						}

[a-zA-Z]+[[\d]*|[a-zA-Z]*] {
																		return IDENTIFIER;
																 }

[a-zA-Z] {
						return LETTER;
				 }

[0-9]+ {
				return DIGIT;
		   	}

[[\d]+ \. [\d]+] {
										return FLOAT;
								 }
[true|false] {
								return BOOLEAN;
						 }
[\d]+ {
				return INTEGER;
			}
[.] {
		return CHAR;
  }
%%
