%{
#include "y.tab.h"
%}

%%


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
