"A prefix increment expression (`++i`)."
shared class PrefixIncrementOperation(operand)
        extends PrefixOperation() {
    
    "The incremented primary."
    shared actual Primary operand;
    
    operator = "++";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPrefixIncrementOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPrefixIncrementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is PrefixIncrementOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared PrefixIncrementOperation copy(Primary operand = this.operand) {
        value ret = PrefixIncrementOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
