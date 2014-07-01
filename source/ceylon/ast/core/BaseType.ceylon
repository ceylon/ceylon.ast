"A type name with optional type arguments."
shared class BaseType(nameAndArgs)
        extends SimpleType() {
    
    shared actual TypeNameWithArguments nameAndArgs;
    
    shared actual [TypeNameWithArguments] children = [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseType(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseType that) {
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => nameAndArgs.hash;
    
    shared BaseType copy(TypeNameWithArguments nameAndArgs = this.nameAndArgs) {
        value ret = BaseType(nameAndArgs);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
