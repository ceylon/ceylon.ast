"An optional type, that is, a shortcut for `UnionType(definiteType, nullType)`.
 
 Examples:
 
     String?
     <String->Integer>?"
shared class OptionalType(definiteType)
        extends PrimaryType([definiteType]) {
    
    "The definite type.
     
     Note that it doesn’t _have_ to be definite; while useless,
     it’s allowed to use another [[OptionalType]] as the definite type."
    shared PrimaryType definiteType;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOptionalType(this);
    
    shared actual Boolean equals(Object that) {
        if (is OptionalType that) {
            return definiteType == that.definiteType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * definiteType.hash;
    
    shared OptionalType copy(PrimaryType definiteType = this.definiteType)
            => OptionalType(definiteType);
}
