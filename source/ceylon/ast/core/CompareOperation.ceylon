"A compare expression.
 
 No associativity.
 
 Examples:
 
     first <=> last
     n <=> 0
 
 This is the concrete class for expressions like `first <=> last`;
 not to be confused with [[ComparisonOperation]], the abstract superclass of expressions like `a <= b` and `x > 3`!"
shared class CompareOperation(leftOperand, rightOperand)
        extends BinaryOperation() {
    
    "The left-hand side."
    shared actual ExistsNonemptyExpression leftOperand;
    "The right-hand side."
    shared actual ExistsNonemptyExpression rightOperand;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = "<=>";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCompareOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCompareOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is CompareOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared CompareOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = CompareOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
