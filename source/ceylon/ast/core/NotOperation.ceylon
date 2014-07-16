"A logical not expression.
 
 Right-associative.
 
 Examples:
 
     !n in primes
     !predicate(element)"
shared class NotOperation(operand_)
        extends UnaryOperation() {
    
    // TODO operand_ is a workaround for ceylon-compiler#1728, remove!
    Precedence13Expression operand_;
    
    "The negated expression."
    shared actual Precedence13Expression operand = operand_;
    
    shared actual [Precedence13Expression] children = [operand];
    
    operator = "!";
    
    prefix = true;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNotOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NotOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared NotOperation copy(Precedence13Expression operand = this.operand) {
        value ret = NotOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
