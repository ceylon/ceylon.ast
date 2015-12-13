"An ‘`extends`’ clause for a [[class definition|ClassDefinition]], that is,
 the keyword ‘`extends`’, followed by an [[extension or construction|target]].
 
 Examples:
 
     extends Node()
     extends super.Entry<Key, Item>(key, item)
     extends HomogenousCoordinates.Cartesian(x, y, z, 1.0)"
shared class ExtendedType(target)
        extends Node() {
    
    "The extension or construction that is being delegated to."
    shared ExtensionOrConstruction target;
    
    shared actual [ExtensionOrConstruction] children = [target];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExtendedType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitExtendedType(this);

    shared actual Boolean equals(Object that) {
        if (is ExtendedType that) {
            return target == that.target;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * target.hash;
    
    shared ExtendedType copy(ExtensionOrConstruction target = this.target) {
        value ret = ExtendedType(target);
        copyExtraInfoTo(ret);
        return ret;
    }
}
