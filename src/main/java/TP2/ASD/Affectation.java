package TP2.ASD;

import TP2.Llvm;
import TP2.TypeException;
import TP2.Utils;
import TP2.ASD.Expression.RetExpression;

public class Affectation extends Expression{
	Expression left ;
	Expression right ;
	
	public Affectation(Expression left, Expression right) {
		this.left = left;
		this.right = right;
	}

	@Override
	public String pp() {
		return "(" + left.pp() + " := " + right.pp() + ")";
	
		
	}

	@Override
	public RetExpression toIR() throws TypeException {
		 RetExpression leftRet = left.toIR();
	      RetExpression rightRet = right.toIR();
	      
		return null;
	}
	

}
