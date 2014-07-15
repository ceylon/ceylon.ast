"An equals expression.
 
 Defined via [[Object.equals]]. No associativity."
shared class EqualOperation(leftOperand_, rightOperand_)
        extends EqualityOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    Precedence11Expression leftOperand_;
    Precedence11Expression rightOperand_;
    
    shared actual Precedence11Expression leftOperand = leftOperand_;
    shared actual Precedence11Expression rightOperand = rightOperand_;
    
    shared actual [Precedence11Expression, Precedence11Expression] children = [leftOperand, rightOperand];
    
    operator = "==";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEqualOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EqualOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared EqualOperation copy(Precedence11Expression leftOperand = this.leftOperand, Precedence11Expression rightOperand = this.rightOperand) {
        value ret = EqualOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
