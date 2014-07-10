"A defaulted type.
 
 Examples:
 
     String=
     Integer->String="
see (`class TypeList`)
shared class DefaultedType(type)
        extends TypeIsh() {
    
    "The inner type."
    shared Type type;
    
    shared actual [Type] children = [type];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDefaultedType(this);
    
    shared actual Boolean equals(Object that) {
        if (is DefaultedType that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * type.hash;
    
    shared DefaultedType copy(Type type = this.type) {
        value ret = DefaultedType(type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
