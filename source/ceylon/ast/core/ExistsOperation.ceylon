"An exists postfix expression.
 
 No associativity."
shared class ExistsOperation(operand_)
        extends UnaryOperation() {
    
    // TODO operand_ is a workaround for ceylon-compiler#1728, remove!
    shared Precedence9Expression operand_;
    
    "The operand expression whose existence is tested."
    shared actual Precedence9Expression operand = operand_;
    
    shared actual [Precedence9Expression] children = [operand];
    
    operator = "exists";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared ExistsOperation copy(Precedence9Expression operand = this.operand) {
        value ret = ExistsOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
