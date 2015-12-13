"A union type.
 
 Examples:
 
     String|Integer|Float"
shared class UnionType(children)
        extends MainType() {
    
    "The child types of this union type.
     
     A union type must have at least two children."
    shared actual [<IntersectionType|PrimaryType>+] children;
    
    "Union of less than two types is not allowed"
    assert (children.longerThan(1));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnionType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitUnionType(this);

    shared actual Boolean equals(Object that) {
        if (is UnionType that) {
            return children == that.children;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * children.hash;
    
    shared UnionType copy([<IntersectionType|PrimaryType>+] children = this.children of [<IntersectionType|PrimaryType>+]) {
        value ret = UnionType(children);
        copyExtraInfoTo(ret);
        return ret;
    }
}
