"A logical conjunction expression.
 
 Left-associative.
 
 Examples:
 
     i%2 == 0 && j%2 == 1
     attr1 == that.attr1 && attr2 == that.attr2 && attr3 == that.attr3"
see (`class AndAssignmentOperation`)
shared class AndOperation(leftOperand, rightOperand)
        extends LogicalOperation() {
    
    shared actual ConjoiningExpression leftOperand;
    shared actual NegatingExpression rightOperand;
    
    shared actual [ConjoiningExpression, NegatingExpression] children = [leftOperand, rightOperand];
    
    operator = "&&";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAndOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is AndOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AndOperation copy(ConjoiningExpression leftOperand = this.leftOperand, NegatingExpression rightOperand = this.rightOperand) {
        value ret = AndOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
