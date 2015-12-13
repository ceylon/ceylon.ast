"An identity test operation.
 
 Defined natively, on objects that satisfy [[Identifiable]]. No associativity.
 
 Examples:
 
     node === rootNode
     this === zero"
shared class IdenticalOperation(leftOperand, rightOperand)
        extends EqualityOperation() {
    
    shared actual ComparingExpression leftOperand;
    shared actual ComparingExpression rightOperand;
    
    shared actual [ComparingExpression, ComparingExpression] children = [leftOperand, rightOperand];
    
    operator = "===";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIdenticalOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIdenticalOperation(this);

    shared actual Boolean equals(Object that) {
        if (is IdenticalOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared IdenticalOperation copy(ComparingExpression leftOperand = this.leftOperand, ComparingExpression rightOperand = this.rightOperand) {
        value ret = IdenticalOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
