"A postfix is expression.
 
 No associativity."
shared class IsOperation(child_, type_)
        extends UnaryTypeOperation() {
    
    // TODO child_ and type_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression child_;
    Type type_;
    
    "The expression whose type is tested."
    shared actual Precedence10Expression child = child_;
    "The type against which the expression’s type is tested."
    shared actual Type type = type_;
    
    shared actual [Precedence10Expression, Type] children = [child, type];
    
    operator = "is";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IsOperation that) {
            return child == that.child && type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (child.hash + 31 * type.hash);
    
    shared IsOperation copy(Precedence10Expression child = this.child, Type type = this.type) {
        value ret = IsOperation(child, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
