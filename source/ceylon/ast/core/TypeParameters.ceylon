"A nonempty comma-separated list of type parameters, surrounded by angle brackets.
 
 Examples:
 
     <in Key, out Item>
     <out Element>"
shared class TypeParameters(typeParameters)
        extends Node() {
    
    "The type parameters."
    shared [TypeParameter+] typeParameters;
    
    shared actual [TypeParameter+] children = typeParameters;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeParameters(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeParameters(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeParameters that) {
            return typeParameters == that.typeParameters;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * typeParameters.hash;
    
    shared TypeParameters copy([TypeParameter+] typeParameters = this.typeParameters) {
        value ret = TypeParameters(typeParameters);
        copyExtraInfoTo(ret);
        return ret;
    }
}
