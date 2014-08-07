"A type import alias, that is,
 an uppercase identifier followed by an “equals” character.
 
 Examples:
 
     JString=
     Char="
shared class TypeAlias(name)
        extends Alias() {
    
    shared actual TypeName name;
    
    shared actual [UIdentifier] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeAlias(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeAlias that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared TypeAlias copy(TypeName name = this.name) {
        value ret = TypeAlias(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
