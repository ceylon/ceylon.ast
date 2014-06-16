"A type name with optional type arguments."
shared class BaseType(nameAndArgs)
        extends Type([nameAndArgs]) {
    
    "The type name and arguments."
    shared TypeNameWithArguments nameAndArgs;
    
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
    
    shared BaseType copy(TypeNameWithArguments nameAndArgs = this.nameAndArgs)
            => BaseType(nameAndArgs);
}
