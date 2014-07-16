"A sum expression.
 
 Defined via [[Summable.plus]]. Left-associative.
 
 Examples:
 
     i + 1
     firstIndex + size"
shared class SumOperation(leftSummand, rightSummand)
        extends ArithmeticOperation() {
    
    "The left summand."
    shared Precedence8Expression leftSummand;
    "The right summand."
    shared Precedence7Expression rightSummand;
    
    "The left summand."
    see (`value leftSummand`)
    shared actual Precedence8Expression leftOperand = leftSummand;
    "The right summand."
    see (`value rightSummand`)
    shared actual Precedence7Expression rightOperand = rightSummand;
    
    shared actual [Precedence8Expression, Precedence7Expression] children = [leftOperand, rightOperand];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSumOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SumOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SumOperation copy(Precedence8Expression leftOperand = this.leftOperand, Precedence7Expression rightOperand = this.rightOperand) {
        value ret = SumOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
