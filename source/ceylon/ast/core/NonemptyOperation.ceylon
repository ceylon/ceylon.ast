"A nonempty postfix expression.
 
 No associativity."
shared class NonemptyOperation(operand_)
        extends UnaryOperation() {
    
    // TODO operand_ is a workaround for ceylon-compiler#1728, remove!
    shared Precedence9Expression operand_;
    
    "The operand expression whose nonemptiness is tested."
    shared actual Precedence9Expression operand = operand_;
    
    shared actual [Precedence9Expression] children = [operand];
    
    operator = "nonempty";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared NonemptyOperation copy(Precedence9Expression operand = this.operand) {
        value ret = NonemptyOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
