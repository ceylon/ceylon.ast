"A postfix increment expression (`i++`)."
shared class PostfixIncrementOperation(operand)
        extends PostfixOperation() {
    
    "The incremented primary."
    shared actual Primary operand;
    
    operator = "++";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPostfixIncrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PostfixIncrementOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared PostfixIncrementOperation copy(Primary operand = this.operand) {
        value ret = PostfixIncrementOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
