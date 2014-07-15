"A prefix decrement expression (`--i`)."
shared class PrefixDecrementOperation(operand)
        extends PrefixOperation() {
    
    "The decremented primary."
    shared actual Primary operand;
    
    operator = "--";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPrefixDecrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PrefixDecrementOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared PrefixDecrementOperation copy(Primary operand = this.operand) {
        value ret = PrefixDecrementOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
