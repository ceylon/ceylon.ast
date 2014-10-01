"A “large as” expression.
 
 No associativity."
shared class LargeAsOperation(leftOperand, rightOperand)
        extends ComparisonOperation() {
    
    "The left-hand side, expected to be at least as large as the right-hand side."
    shared actual ExistsNonemptyExpression leftOperand;
    "The right-hand side, expected to be at least as small as the left-hand side."
    shared actual ExistsNonemptyExpression rightOperand;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = ">=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLargeAsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is LargeAsOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared LargeAsOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = LargeAsOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
