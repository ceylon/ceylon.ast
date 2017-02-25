"A postfix decrement expression (`i--`)."
shared class PostfixDecrementOperation(operand)
        extends PostfixOperation() {
    
    "The decremented primary."
    shared actual Primary operand;
    
    operator = "--";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPostfixDecrementOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPostfixDecrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PostfixDecrementOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared PostfixDecrementOperation copy(Primary operand = this.operand) {
        value ret = PostfixDecrementOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
