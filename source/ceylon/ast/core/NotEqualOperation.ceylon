"A not equals expression.
 
 Defined via [[Object.equals]]. No associativity.
 
 Examples:
 
     uid != 0
     process.arguments.length != 7"
shared class NotEqualOperation(leftOperand, rightOperand)
        extends EqualityOperation() {
    
    shared actual ComparingExpression leftOperand;
    shared actual ComparingExpression rightOperand;
    
    shared actual [ComparingExpression, ComparingExpression] children = [leftOperand, rightOperand];
    
    operator = "!=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNotEqualOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitNotEqualOperation(this);

    shared actual Boolean equals(Object that) {
        if (is NotEqualOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared NotEqualOperation copy(ComparingExpression leftOperand = this.leftOperand, ComparingExpression rightOperand = this.rightOperand) {
        value ret = NotEqualOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
