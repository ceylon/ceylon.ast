"A “larger than” expression.
 
 No associativity."
shared class LargerOperation(leftOperand, rightOperand)
        extends ComparisonOperation() {
    
    "The left-hand side, expected to be larger."
    shared actual ExistsNonemptyExpression leftOperand;
    "The right-hand side, expected to be smaller."
    shared actual ExistsNonemptyExpression rightOperand;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = ">";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLargerOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitLargerOperation(this);

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
