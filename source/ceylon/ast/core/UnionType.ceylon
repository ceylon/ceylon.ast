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
    
    shared actual Boolean equals(Object that) {
        if (is UnionType that) {
            return children == that.children;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * children.hash;
    
    "**Note**: The parameter [[children]] is only declared possibly-empty to work around a compiler bug
     ([ceylon/ceylon-compiler#2179](https://github.com/ceylon/ceylon-compiler/issues/2179));
     actual arguments must always be nonempty (`[<IntersectionType|PrimaryType>+]`)."
    shared UnionType copy([<IntersectionType|PrimaryType>*] children = this.children) {
        assert (nonempty children);
        value ret = UnionType(children);
        copyExtraInfoTo(ret);
        return ret;
    }
}
