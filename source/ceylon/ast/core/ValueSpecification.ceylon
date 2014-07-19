"A value specification statement, that is, a [[member name|LIdentifier]] followed by a [[Specifier]].
 
 Examples:
 
     size = 0;
     it = iterators.next();"
shared class ValueSpecification(name, specifier)
        extends Specification() {
    
    "The name of the member being specified."
    shared MemberName name;
    "The specifier."
    shared Specifier specifier;
    
    shared actual [LIdentifier, Specifier] children = [name, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueSpecification(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueSpecification that) {
            return name == that.name && specifier == that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * specifier.hash);
    
    shared ValueSpecification copy(LIdentifier name = this.name, Specifier specifier = this.specifier) {
        value ret = ValueSpecification(name, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
