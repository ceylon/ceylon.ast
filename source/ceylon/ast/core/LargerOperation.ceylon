"A “larger than” expression.
 
 No associativity."
shared class LargerOperation(leftOperand_, rightOperand_)
        extends ComparisonOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    ExistsNonemptyExpression leftOperand_;
    ExistsNonemptyExpression rightOperand_;
    
    "The left-hand side, expected to be larger."
    shared actual ExistsNonemptyExpression leftOperand = leftOperand_;
    "The right-hand side, expected to be smaller."
    shared actual ExistsNonemptyExpression rightOperand = rightOperand_;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = ">";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLargerOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is LargerOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared LargerOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = LargerOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
