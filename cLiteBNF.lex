%{
%}

%%

<Integer> ::= <Digit>

<Boolean> ::= true|false

<Float> ::= <Integer> '.' <Integer>

[.] {
		return CHAR;
  }
%%
