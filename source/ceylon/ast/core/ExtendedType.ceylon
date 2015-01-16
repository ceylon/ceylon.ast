"An ‘`extends`’ clause for a [[class definition|ClassDefinition]].
 
 Examples:
 
     extends Node()
     extends super.Entry<Key, Item>(key, item)
     extends HomogenousCoordinates.Cartesian(x, y, z, 1.0)"
shared class ExtendedType(instantiation)
        extends Node() {
    
    "The instantiation of the type being extended."
    shared ClassInstantiation instantiation;
    
    shared actual [ClassInstantiation] children = [instantiation];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExtendedType(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExtendedType that) {
            return instantiation == that.instantiation;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * instantiation.hash;
    
    shared ExtendedType copy(ClassInstantiation instantiation = this.instantiation) {
        value ret = ExtendedType(instantiation);
        copyExtraInfoTo(ret);
        return ret;
    }
}
