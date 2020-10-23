package TP2.ASD;

import TP2.Llvm;
import TP2.TypeException;
import TP2.Utils;
import TP2.ASD.Expression.RetExpression;
import TP2.SymbolTable;
import TP2.SymbolTable.*;

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
		
		 // We check if the types mismatches
	      if(!leftRet.type.equals(rightRet.type)) {
	        throw new TypeException("type mismatch: have " + leftRet.type + " and " + rightRet.type);
	      }
	      
	     // Symbol present = SymbolTable.lookup(left.pp());
	      	
	      // We base our build on the left generated IR:
	      // append right code
	      leftRet.ir.append(rightRet.ir);

	      // allocate a new identifier for the result
	      String result = Utils.newtmp();

	      // new add instruction result = left + right
	      Llvm.Instruction affect = new Llvm.Affect(leftRet.type.toLlvmType(), leftRet.result, rightRet.result);

	      // append this instruction
	      leftRet.ir.appendCode(affect);

	      // return the generated IR, plus the type of this expression
	      // and where to find its result
	      return new RetExpression(leftRet.ir, leftRet.type, result);
	    }


}
