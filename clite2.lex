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

"true"|"false" { printf("Boolean: %s ", yytext);
}

"//".*\n				{ 	printf("Inline-comment- %s\n", yytext);}

" \+ "|" \- "|" \* "|" \/ "   		{printf( "Operator-%s\n", yytext );}

"/*"     { /* ignore multiline comments. */
           register int c;
		   printf("Open-multiline-comment\n");
           for (;;)
           {
             while ((c = input ()) != '*' && c != EOF)
               ; /* eat up text of comment. */

             if (c == '*')
             {
               while ((c = input ()) == '*')
                 ;

               if (c == '/')
                 break; /* found the end. */
             }

             if (c == EOF)
             {
               printf ("Error: EOF in comment.\n");
               break;
             }
           }
		   printf("Close-multiline-comment\n");
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
if|then|"int"|float|bool|char {	printf("A keyword: %s\n", yytext); }
" < " | " <= " | " > " | " >= "	{ printf("Comparison-%s\n", yytext);}


{ID}						{printf( "Identifier-%s\n", yytext );
							}

[ \t\n]+          /* eat up whitespace */


%%
