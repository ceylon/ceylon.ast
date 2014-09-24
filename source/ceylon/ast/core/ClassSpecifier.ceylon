"A class specifier for a [[class alias|ClassAliasDefinition]],
 that is, a lazy specification operator ‘`=>`’ followed by a [[class instantiation|instantiation]].
 
 Examples:
 
     => String(characters)
     => Entry<String,Item>(name, item)"
shared class ClassSpecifier(instantiation)
        extends Node() {
    
    "The instantiation of the specifying class."
    shared ClassInstantiation instantiation;
    
    shared actual [ClassInstantiation] children = [instantiation];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassSpecifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassSpecifier that) {
            return instantiation == that.instantiation;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * instantiation.hash;
    
    shared ClassSpecifier copy(ClassInstantiation instantiation = this.instantiation) {
        value ret = ClassSpecifier(instantiation);
        copyExtraInfoTo(ret);
        return ret;
    }
}
