"A list of types, with an optional trailing variadic type.
 
 Examples:
 
     String, String, String+"
shared class TypeList(elements, variadic = null)
        extends TypeIsh() {
    
    "The element types."
    shared <Type|DefaultedType>[] elements;
    "The trailing variadic type, if any."
    shared VariadicType? variadic;
    
    shared actual <VariadicType|Type|DefaultedType>[] children = concatenate(elements, emptyOrSingleton(variadic));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeList(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeList(this);

    shared actual Boolean equals(Object that) {
        if (is TypeList that) {
            if (exists variadic) {
                if (exists variadic_ = that.variadic) {
                    if (variadic != variadic_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.variadic exists) {
                return false;
            }
            return elements == that.elements;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * elements.hash + (variadic?.hash else 0);
    
    shared TypeList copy(<Type|DefaultedType>[] elements = this.elements, VariadicType? variadic = this.variadic) {
        value ret = TypeList(elements, variadic);
        copyExtraInfoTo(ret);
        return ret;
    }
}
