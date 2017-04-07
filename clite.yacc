%{
#include <stdio.h>
%}

%token CHAR FLOAT BOOLEAN INTEGER LITERAL DIGIT LETTER IDENTIFIER PRIMARY

%%



PRIMARY: IDENTIFIER [EXPRESSION] {

                                  }

          |       LITERAL         {

                                  }

          |       (EXPRESSION)    {

                                  }

          |       TYPE(EXPRESSION)]{

                                  }
          ;

IDENTIFIER: IDENTIFIER{
                        printf("This is an Identifier\n");
                      }

LETTER: LETTER {
                printf("This is a Letter\n");
               }

DIGIT: DIGIT {
               printf("This is a Digit\n");
             }

LITERAL:  INTEGER {
                    printf("int");
                  }
         | BOOLEAN {
                     printf("bool");
                   }
         | FLOAT {
                   printf("float");
                 }
         | CHAR {
                   printf("char");
                 }
         ;

INTEGER: INTEGER{
            printf("This is an Integer\n");
}

BOOLEAN: BOOLEAN {
            printf("This is a Boolean\n");
}
FLOAT: INTERGER '.' INTEGER {
            printf("This is a Float\n");
}
CHAR: CHAR {
            printf("This is a Character\n");
}
%%
