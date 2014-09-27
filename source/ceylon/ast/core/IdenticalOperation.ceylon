"An identity test operation.
 
 Defined natively, on objects that satisfy [[Identifiable]]. No associativity.
 
 Examples:
 
     node === rootNode
     this === zero"
shared class IdenticalOperation(leftOperand_, rightOperand_)
        extends EqualityOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    ComparingExpression leftOperand_;
    ComparingExpression rightOperand_;
    
    shared actual ComparingExpression leftOperand = leftOperand_;
    shared actual ComparingExpression rightOperand = rightOperand_;
    
    shared actual [ComparingExpression, ComparingExpression] children = [leftOperand, rightOperand];
    
    operator = "===";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIdenticalOperation(this);
    
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
