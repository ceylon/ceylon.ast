"The expression `+i`.
 
 This expression is defined to return `i` for any `i` of [[Invertible]] type."
shared class IdentityOperation(child_)
        extends UnaryArithmeticOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    Precedence2Expression child_;
    
    "The inner expression."
    shared actual Precedence2Expression child = child_;
    
    shared actual [Precedence2Expression] children = [child];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIdentityOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IdentityOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared IdentityOperation copy(Precedence2Expression child = this.child) {
        value ret = IdentityOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
