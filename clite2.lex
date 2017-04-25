%{

%}

DIGIT		[0-9]
ID 			[a-z][a-z0-9]*
LETTER, DIGIT, FLOAT, BOOLEAN, INTEGER, CHAR
%%

"true"|"false" { printf("Boolean-%s\n", yytext);}
"=="|"!=" { printf("EquOp-%s\n", yytext);}
"||" { printf("Conjunction-%s\n", yytext);}
{DIGIT}+				{	printf("Integer-%s\n", yytext);}
{DIGIT}+"."{DIGIT}*		{	printf( "Float-%s\n", yytext);}
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
" "?"//"(.*?)				{ 	printf("Inline-comment-%s\n", yytext);}
\+|\-|\*|\/   		{printf( "Operator-%s\n", yytext );}
" = "					{ printf("Assignment\n");}
";"						{ printf("Semicolon\n");}
"("						{ printf("Open-paren\n");}
")"						{ printf("Close-paren\n");}
"{"						{ printf("Open-bracket\n");}
"}"						{ printf("Close-bracket\n");}
"<"|"<="|">"|">="	{ printf("Comparison-%s\n", yytext);}
if|then|"int"|float|bool|char {	printf("Keyword-%s\n", yytext);}
{ID}						{printf( "Identifier-%s\n", yytext );}
[ \t\n]+          /* eat up whitespace */

%%
