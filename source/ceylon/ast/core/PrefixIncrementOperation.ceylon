"A prefix increment expression (`++i`)."
shared class PrefixIncrementOperation(child)
        extends PrefixOperation() {
    
    "The incremented primary."
    shared actual Primary child;
    
    operator = "++";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPrefixIncrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PrefixIncrementOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared PrefixIncrementOperation copy(Primary child = this.child) {
        value ret = PrefixIncrementOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
