"The expression `+i`.
 
 This expression is defined to return `i` for any `i` of [[Invertible]] type.
 
 (Not to be confused with [[IdenticalOperation]], `i === i`.)"
shared class IdentityOperation(operand_)
        extends UnaryArithmeticOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    Precedence2Expression operand_;
    
    "The inner expression."
    shared actual Precedence2Expression operand = operand_;
    
    shared actual [Precedence2Expression] children = [operand];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIdentityOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IdentityOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared IdentityOperation copy(Precedence2Expression operand = this.operand) {
        value ret = IdentityOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
