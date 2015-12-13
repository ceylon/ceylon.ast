"A package qualifier, that is,
 the keyword ‘`package`’ followed by a [[member operator|MemberOperator]].
 
 (The member operator is implicit and not an actual child node.)
 
 This node is used in types and meta expressions and not to be confused with [[Package]],
 which is used in regular expressions."
shared class PackageQualifier()
        extends TypeIsh() {
    
    shared actual [] children = [];
    
    shared actual Integer hash = -207712476;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackageQualifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPackageQualifier(this);

    shared actual Boolean equals(Object that) {
        return that is PackageQualifier;
    }
    
    shared PackageQualifier copy() {
        value ret = PackageQualifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}
