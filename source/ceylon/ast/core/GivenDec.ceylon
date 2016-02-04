"A type parameter reference expression, that is,
 the name of a type parameter, prefixed by the type keyword \`given\` and surrounded by backticks.
 
 Examples:
 
     `given Element`
     `given Key`"
shared class GivenDec(name, qualifier = DecQualifier())
        extends TypeDec() {
    
    shared actual TypeName name;
    shared actual DecQualifier qualifier;
    
    keyword = "given";
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformGivenDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitGivenDec(this);

    shared actual Boolean equals(Object that) {
        if (is GivenDec that) {
            return name == that.name && qualifier == that.qualifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * qualifier.hash);
    
    shared GivenDec copy(TypeName name = this.name, DecQualifier qualifier = this.qualifier) {
        value ret = GivenDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
