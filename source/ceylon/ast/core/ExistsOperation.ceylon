"An exists postfix expression.
 
 No associativity."
shared class ExistsOperation(child_)
        extends UnaryOperation() {
    
    // TODO child_ is a workaround for ceylon-compiler#1728, remove!
    shared Precedence9Expression child_;
    
    "The child expression whose existence is tested."
    shared actual Precedence9Expression child = child_;
    
    shared actual [Precedence9Expression] children = [child];
    
    operator = "exists";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsOperation that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared ExistsOperation copy(Precedence9Expression child = this.child) {
        value ret = ExistsOperation(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}
