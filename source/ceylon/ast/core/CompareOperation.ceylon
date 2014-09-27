"A compare expression.
 
 No associativity.
 
 Examples:
 
     first <=> last
     n <=> 0
 
 This is the concrete class for expressions like `first <=> last`;
 not to be confused with [[ComparisonOperation]], the abstract superclass of expressions like `a <= b` and `x > 3`!"
shared class CompareOperation(leftOperand_, rightOperand_)
        extends BinaryOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    ExistsNonemptyExpression leftOperand_;
    ExistsNonemptyExpression rightOperand_;
    
    "The left-hand side."
    shared actual ExistsNonemptyExpression leftOperand = leftOperand_;
    "The right-hand side."
    shared actual ExistsNonemptyExpression rightOperand = rightOperand_;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = "<=>";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCompareOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is CompareOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared CompareOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = CompareOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
