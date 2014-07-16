"An identity test operation.
 
 Defined natively, on objects that satisfy [[Identifiable]]. No associativity.
 
 Examples:
 
     node === rootNode
     this === zero"
shared class IdenticalOperation(leftOperand_, rightOperand_)
        extends EqualityOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    Precedence11Expression leftOperand_;
    Precedence11Expression rightOperand_;
    
    shared actual Precedence11Expression leftOperand = leftOperand_;
    shared actual Precedence11Expression rightOperand = rightOperand_;
    
    shared actual [Precedence11Expression, Precedence11Expression] children = [leftOperand, rightOperand];
    
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
    
    shared IdenticalOperation copy(Precedence11Expression leftOperand = this.leftOperand, Precedence11Expression rightOperand = this.rightOperand) {
        value ret = IdenticalOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
