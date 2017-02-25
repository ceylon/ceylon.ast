"An import wildcard, that is, three colons (‘`...`’).
 
 Used to indicate that all elements from a package should be imported."
shared class ImportWildcard()
        extends Node() {
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportWildcard(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitImportWildcard(this);
    
    shared actual Boolean equals(Object that) {
        return that is ImportWildcard;
    }
    
    shared actual Integer hash
            => 31 * "...".hash;
    
    shared ImportWildcard copy() {
        value ret = ImportWildcard();
        copyExtraInfoTo(ret);
        return ret;
    }
}
