"A “smaller than” expression.
 
 No associativity."
shared class SmallerOperation(leftOperand, rightOperand)
        extends ComparisonOperation() {
    
    "The left-hand side, expected to be smaller."
    shared actual ExistsNonemptyExpression leftOperand;
    "The right-hand side, expected to be larger."
    shared actual ExistsNonemptyExpression rightOperand;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = "<";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSmallerOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSmallerOperation(this);

    shared actual Boolean equals(Object that) {
        if (is SmallerOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SmallerOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = SmallerOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
