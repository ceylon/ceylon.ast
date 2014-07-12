"A unary negation operation, that is, `-i`.
 
 This operator is defined in terms of [[Invertible.negated]]."
shared class NegationOperation(child_)
        extends UnaryArithmeticOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    Precedence2Expression child_;
    
    "The negated expression."
    shared actual Precedence2Expression child = child_;
    
    shared actual [Precedence2Expression] children = [child];
    
    operator = "-";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNegationOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NegationOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared NegationOperation copy(Precedence2Expression child = this.child) {
        value ret = NegationOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
