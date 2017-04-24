%{

%}


DIGIT		[0-9]
ID 			[a-z][a-z0-9]*
LETTER, DIGIT, FLOAT, BOOLEAN, INTEGER, CHAR
%%


{DIGIT}+				{	printf("Integer-%s\n", yytext);
						
						}

{DIGIT}+"."{DIGIT}*		{	printf( "Float-%s\n", yytext);

						}
" \+ "|" \- "|" \* "|" \/ "   		{printf( "Operator-%s\n", yytext );}

["/\*"]\n?(.*?(\n)).*?"*/"\n$				{	printf("Open-multiline-comment\nClose-multiline-comment\n");
						}

"//"(.*?)				{ 	printf("Inline-comment-%s\n", yytext);
	

						}




" = "					{ printf("Assignment\n");

						}

";"						{ printf("Semicolon\n");
	
						}
"("						{ printf("Open-paren\n");
	
						}
")"						{ printf("Close-paren\n");
	
						}
"{"						{ printf("Open-bracket\n");
	
						}
"}"						{ printf("Close-bracket\n");
	
						}

" < " | " <= " | " > " | " >= "	{ printf("Comparison-%s\n", yytext);
	
						}


if|then|"int"|float|bool|char {	printf("Keyword-%s\n", yytext);
	
							}

{ID}						{printf( "Identifier-%s\n", yytext );
							}

[ \t\n]+          /* eat up whitespace */
	

%%
