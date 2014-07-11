"A postfix increment expression (`i++`)."
shared class PostfixIncrementOperation(child)
        extends PostfixOperation() {
    
    "The incremented primary."
    shared actual Primary child;
    
    operator = "++";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPostfixIncrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PostfixIncrementOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared PostfixIncrementOperation copy(Primary child = this.child) {
        value ret = PostfixIncrementOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
