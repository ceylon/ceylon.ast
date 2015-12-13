"A type metamodel expression, that is, a [[Type]] surrounded by backticks.
 
 Examples:
 
     `List<String>`
     `Integer|Float`"
shared class TypeMeta(type)
        extends Meta() {
    
    "The type."
    shared Type type;
    
    shared actual [Type] children = [type];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeMeta(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeMeta(this);

    shared actual Boolean equals(Object that) {
        if (is TypeMeta that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * type.hash;
    
    shared TypeMeta copy(Type type = this.type) {
        value ret = TypeMeta(type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
