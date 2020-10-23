parser grammar VSLParser;

options {
  language = Java;
  tokenVocab = VSLLexer;
}

@header {
  package TP2;

  import java.util.stream.Collectors;
  import java.util.Arrays;
}


// TODO : other rules

program returns [TP2.ASD.Program out]
    : e=expression EOF { $out = new TP2.ASD.Program($e.out); }
    //| s = statement EOF { $out = new TP2.ASD.Program($s.out);} // TODO : change when you extend the language
    ;
//statement returns [TP2.ASD.Affectation out]
	//: e
expression returns [TP2.ASD.Expression out]
	: term { $out = $term.out;} ( (PLUS term { $out = new TP2.ASD.AddExpression($out, $term.out) ;}) 
	| (MINUS term { $out = new TP2.ASD.MinusExpression($out, $term.out) ;}))* 
    // TODO : that's all?
    ;

term returns [TP2.ASD.Expression out]
	: factor {$out = $factor.out ;}(( MUL factor { $out = new TP2.ASD.MulExpression($out, $factor.out); })
	| ( DIV factor { $out = new TP2.ASD.DivExpression($out, $factor.out); }))*
	;
	
factor returns [TP2.ASD.Expression out]
    : p=primary { $out = $p.out; }
    // TODO : that's all?
    ;

primary returns [TP2.ASD.Expression out]
    : INTEGER { $out = new TP2.ASD.IntegerExpression($INTEGER.int); }
    // TODO : that's all?
    ;
   
//identifier returns [TP2.ASD.EXpression out]
	//: IDENT { $out = new TP2.ASD.
