"A nonempty postfix expression.
 
 No associativity."
shared class NonemptyOperation(child_)
        extends UnaryOperation() {
    
    // TODO child_ is a workaround for ceylon-compiler#1728, remove!
    shared Precedence9Expression child_;
    
    "The child expression whose nonemptiness is tested."
    shared actual Precedence9Expression child = child_;
    
    shared actual [Precedence9Expression] children = [child];
    
    operator = "nonempty";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared NonemptyOperation copy(Precedence9Expression child = this.child) {
        value ret = NonemptyOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
