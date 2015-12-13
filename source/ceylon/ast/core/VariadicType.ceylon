"A variadic type is a [[MainType]] followed by a \"*\" (possibly-empty)
 or a \"+\" (nonempty)."
see (`class IterableType`, `class TypeList`)
shared class VariadicType(elementType, isNonempty = false)
        extends TypeIsh() {
    
    "The element type."
    shared MainType elementType;
    "[[true]] for a nonempty variadic type (`Type+`),
     [[false]] for a possibly-empty variadic type (`Type*`)."
    shared Boolean isNonempty;
    
    shared actual [MainType] children = [elementType];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformVariadicType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitVariadicType(this);

    shared actual Boolean equals(Object that) {
        if (is VariadicType that) {
            return isNonempty == that.isNonempty && elementType == that.elementType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * elementType.hash + isNonempty.hash;
    
    shared VariadicType copy(MainType elementType = this.elementType, Boolean isNonempty = this.isNonempty) {
        value ret = VariadicType(elementType, isNonempty);
        copyExtraInfoTo(ret);
        return ret;
    }
}
