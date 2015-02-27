"A value specification statement, that is, a [[member name|LIdentifier]] followed by a [[Specifier]].
 
 Examples:
 
     size = 0;
     it = iterators.next();"
shared class ValueSpecification(name, specifier, qualifier = null)
        extends Specification() {
    
    shared actual MemberName name;
    shared actual Specifier specifier;
    shared actual This? qualifier;
    
    shared actual [LIdentifier, Specifier, This=] children = [name, specifier, *emptyOrSingleton(qualifier)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueSpecification(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueSpecification that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    if (qualifier != qualifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.qualifier exists) {
                return false;
            }
            return name == that.name && specifier == that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * specifier.hash);
    
    shared ValueSpecification copy(LIdentifier name = this.name, Specifier specifier = this.specifier, This? qualifier = this.qualifier) {
        value ret = ValueSpecification(name, specifier, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
