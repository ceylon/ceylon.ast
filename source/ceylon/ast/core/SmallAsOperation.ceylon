"A “small as” expression.
 
 No associativity."
shared class SmallAsOperation(leftOperand_, rightOperand_)
        extends ComparisonOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression leftOperand_;
    Precedence10Expression rightOperand_;
    
    "The left-hand side, expected to be at least as small as the right-hand side."
    shared actual Precedence10Expression leftOperand = leftOperand_;
    "The right-hand side, expected to be at least as large as the left-hand side."
    shared actual Precedence10Expression rightOperand = rightOperand_;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftOperand, rightOperand];
    
    operator = "<=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSmallAsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SmallAsOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SmallAsOperation copy(Precedence10Expression leftOperand = this.leftOperand, Precedence10Expression rightOperand = this.rightOperand) {
        value ret = SmallAsOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
