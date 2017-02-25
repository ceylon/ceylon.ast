"A class specifier for a [[class alias|ClassAliasDefinition]],
 that is, a lazy specification operator ‘`=>`’ followed by an [[extension or construction|target]].
 
 Examples:
 
     => String(characters)
     => Entry<String,Item>(name, item)
     => HomogenousCoordinates.Cartesian(x, y, z, 1.0)"
shared class ClassSpecifier(target)
        extends Node() {
    
    "The extension or construction being delegated to."
    shared ExtensionOrConstruction target;
    
    shared actual [ExtensionOrConstruction] children = [target];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassSpecifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitClassSpecifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassSpecifier that) {
            return target == that.target;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * target.hash;
    
    shared ClassSpecifier copy(ExtensionOrConstruction target = this.target) {
        value ret = ClassSpecifier(target);
        copyExtraInfoTo(ret);
        return ret;
    }
}
