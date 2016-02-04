"A type specifier, that is, a type prefixed by a computation operator ‘`=>`’.
 
 Examples:
 
     => Map<String,Person>
     => Comparison(Value,Value)"
shared class TypeSpecifier(type)
        extends Node() {
    
    "The type being specified."
    shared Type type;
    
    shared actual [Type] children = [type];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeSpecifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeSpecifier(this);

    shared actual Boolean equals(Object that) {
        if (is TypeSpecifier that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * type.hash;
    
    shared TypeSpecifier copy(Type type = this.type) {
        value ret = TypeSpecifier(type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
