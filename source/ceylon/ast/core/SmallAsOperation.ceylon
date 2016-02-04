"A “small as” expression.
 
 No associativity."
shared class SmallAsOperation(leftOperand, rightOperand)
        extends ComparisonOperation() {
    
    "The left-hand side, expected to be at least as small as the right-hand side."
    shared actual ExistsNonemptyExpression leftOperand;
    "The right-hand side, expected to be at least as large as the left-hand side."
    shared actual ExistsNonemptyExpression rightOperand;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = "<=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSmallAsOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSmallAsOperation(this);

    shared actual Boolean equals(Object that) {
        if (is SmallAsOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SmallAsOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = SmallAsOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
