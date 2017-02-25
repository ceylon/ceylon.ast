"A sum expression.
 
 Defined via [[Summable.plus]]. Left-associative.
 
 Examples:
 
     i + 1
     firstIndex + size"
see (`class AddAssignmentOperation`)
shared class SumOperation(leftSummand, rightSummand)
        extends ArithmeticOperation() {
    
    "The left summand."
    shared AddingExpression leftSummand;
    "The right summand."
    shared ScalingExpression rightSummand;
    
    "The left summand."
    see (`value leftSummand`)
    shared actual AddingExpression leftOperand = leftSummand;
    "The right summand."
    see (`value rightSummand`)
    shared actual ScalingExpression rightOperand = rightSummand;
    
    shared actual [AddingExpression, ScalingExpression] children = [leftOperand, rightOperand];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSumOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSumOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SumOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared SumOperation copy(AddingExpression leftOperand = this.leftOperand, ScalingExpression rightOperand = this.rightOperand) {
        value ret = SumOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
