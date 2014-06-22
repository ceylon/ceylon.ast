"An intersection type.
 
 Examples:
 
     Element&Identifiable
     Persistent&Printable&Identifiable"
shared class IntersectionType(children)
        extends Type(children) {
    
    "The child types of this intersection type.
     
     An intersection type must have at least two children."
    shared actual [PrimaryType+] children;
    
    "Intersection of less than two types is not allowed"
    assert (children.longerThan(1));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntersectionType(this);
    
    shared actual Boolean equals(Object that) {
        if (is IntersectionType that) {
            return children == that.children;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * children.hash;
    
    shared IntersectionType copy([PrimaryType+] children = this.children) {
        value ret = IntersectionType(children);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
