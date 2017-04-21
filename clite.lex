%{

%}


DIGIT		[0-9]
ID 			[a-z]*[a-z0-9]*
LETTER, DIGIT, FLOAT, BOOLEAN, INTEGER, CHAR
%%


{DIGIT}+				{	printf("An Integer- %s (%d)\n", yytext, atoi(yytext));
						}

{DIGIT}+"."{DIGIT}*		{	printf( "A Float- %s (%g)\n", yytext, atof( yytext ) );
						}

"true"|"false" { printf("Boolean: %s ", yytext);
}

"//".*\n				{ 	printf("Inline-comment- %s\n", yytext);
						}

"/*".*"*/"				{	printf("Open-multiline-comment\nClose-multiline-comment");
						}

"+"|"-"|"*"|"/"   		printf( "An operator: %s\n", yytext );

if|then|"int"|float|bool|char {	printf("A keyword: %s\n", yytext);

							}

{ID}						{printf( "An identifier: %s\n", yytext );
							}


%%
