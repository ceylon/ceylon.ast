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
                if (exists varType = that.variadicType) {
                    return variadicType == varType;
                } else {
                    return false;
                }
            } else {
                return !(that.variadicType exists);
            }
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
