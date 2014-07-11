"A postfix decrement expression (`i--`)."
shared class PostfixDecrementOperation(child)
        extends PostfixOperation() {
    
    "The decremented primary."
    shared actual Primary child;
    
    operator = "--";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPostfixDecrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PostfixDecrementOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared PostfixDecrementOperation copy(Primary child = this.child) {
        value ret = PostfixDecrementOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
