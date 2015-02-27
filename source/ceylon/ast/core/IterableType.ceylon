"An iterable type, like `{String*}` or `{}`."
shared class IterableType(variadicType)
        extends PrimaryType() {
    
    "The element type, or [[null]] if there is no element type (means `Iterable<Nothing, Null>`)."
    shared VariadicType? variadicType;
    
    shared actual [VariadicType=] children = emptyOrSingleton(variadicType);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIterableType(this);
    
    shared actual Boolean equals(Object that) {
        if (is IterableType that) {
            if (exists variadicType) {
                if (exists variadicType_ = that.variadicType) {
                    if (variadicType != variadicType_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.variadicType exists) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => variadicType?.hash else 0;
    
    shared IterableType copy(VariadicType? elementType = this.variadicType) {
        value ret = IterableType(elementType);
        copyExtraInfoTo(ret);
        return ret;
    }
}
