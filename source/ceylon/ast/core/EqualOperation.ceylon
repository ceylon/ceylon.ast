"An equals expression.
 
 Defined via [[Object.equals]]. No associativity.
 
 Examples:
 
     length == 1
     first == last
     parseInteger(input) == 0"
shared class EqualOperation(leftOperand, rightOperand)
        extends EqualityOperation() {
    
    shared actual ComparingExpression leftOperand;
    shared actual ComparingExpression rightOperand;
    
    shared actual [ComparingExpression, ComparingExpression] children = [leftOperand, rightOperand];
    
    operator = "==";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEqualOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitEqualOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EqualOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared EqualOperation copy(ComparingExpression leftOperand = this.leftOperand, ComparingExpression rightOperand = this.rightOperand) {
        value ret = EqualOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
