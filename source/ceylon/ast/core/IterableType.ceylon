"An iterable type, like `{String*}` or `{Integer+}`."
shared class IterableType(variadicType)
        extends PrimaryType() {
    
    "The element type."
    shared VariadicType variadicType;
    
    shared actual [VariadicType] children = [variadicType];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIterableType(this);
    
    shared actual Boolean equals(Object that) {
        if (is IterableType that) {
            return variadicType == that.variadicType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => variadicType.hash;
    
    shared IterableType copy(VariadicType elementType = this.variadicType) {
        value ret = IterableType(elementType);
        copyExtraInfoTo(ret);
        return ret;
    }
}
