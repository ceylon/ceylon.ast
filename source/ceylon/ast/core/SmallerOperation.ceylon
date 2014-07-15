"A “smaller than” expression.
 
 No associativity."
shared class SmallerOperation(leftOperand_, rightOperand_)
        extends ComparisonOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression leftOperand_;
    Precedence10Expression rightOperand_;
    
    "The left-hand side, expected to be smaller."
    shared actual Precedence10Expression leftOperand = leftOperand_;
    "The right-hand side, expected to be larger."
    shared actual Precedence10Expression rightOperand = rightOperand_;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftOperand, rightOperand];
    
    operator = "<";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSmallerOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SmallerOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SmallerOperation copy(Precedence10Expression leftOperand = this.leftOperand, Precedence10Expression rightOperand = this.rightOperand) {
        value ret = SmallerOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
