"A nonempty comma-separated list of type arguments, enclosed in angle brackets.
 
 Examples:
 
     <String,Nothing>
     <out Element>"
shared class TypeArguments(typeArguments)
        extends TypeIsh() {
    
    "The type arguments.
     
     (The restriction that the arguments must be nonempty
     might be lifted in [ceylon-spec#791](https://github.com/ceylon/ceylon-spec/issues/791).)"
    shared [TypeArgument+] typeArguments;
    
    shared actual [TypeArgument+] children = typeArguments;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeArguments that) {
            return typeArguments == that.typeArguments;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * typeArguments.hash;
    
    shared TypeArguments copy([TypeArgument+] typeArguments = this.typeArguments) {
        value ret = TypeArguments(typeArguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}
