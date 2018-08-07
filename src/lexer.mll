{
  open Parser
}

rule token = parse
  | [' ' '\r' '\t'] { token lexbuf }
  | ['\n'] { NEWLINE }

  (* symbols *)
  | '(' ')' { SYM_UNIT }

  | ':' { SYM_COLON }
  | '=' { SYM_EQUALS }
  | '(' { SYM_LPAREN }
  | ')' { SYM_RPAREN }
  | ';' { SYM_SEMI }

  (* keywords *)
  | "fn" { KW_FN }
  | "let" { KW_LET }
  | "return" { KW_RETURN }

  | '-'? ['0'-'9']+ as n { NUMBER(int_of_string n) }
  | ['A'-'Z' 'a'-'z' '_'] ['A'-'Z' 'a'-'z' '0'-'9' '_']* as s { IDENT(s) }

  | eof { EOF }
