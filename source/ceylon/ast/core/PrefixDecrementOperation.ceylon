"A prefix decrement expression (`--i`)."
shared class PrefixDecrementOperation(child)
        extends PrefixOperation() {
    
    "The decremented primary."
    shared actual Primary child;
    
    operator = "--";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPrefixDecrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PrefixDecrementOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared PrefixDecrementOperation copy(Primary child = this.child) {
        value ret = PrefixDecrementOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
