"An of expression.
 
 No associativity."
shared class OfOperation(child_, type_)
        extends UnaryTypeOperation() {
    
    Precedence10Expression child_;
    Type type_;
    
    "The expression whose type is narrowed or widened."
    shared actual Precedence10Expression child = child_;
    "The covering type to which the expression is narrowed or widened."
    shared actual Type type = type_;
    
    shared actual [Precedence10Expression, Type] children = [child, type];
    
    operator = "of";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOfOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is OfOperation that) {
            return child == that.child && type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (child.hash + 31 * type.hash);
    
    shared OfOperation copy(Precedence10Expression child = this.child, Type type = this.type) {
        value ret = OfOperation(child, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
