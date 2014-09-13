"A lazy specification statement, that is,
 a [[member name|name]], optionally followed by one or more [[parameter lists|parameterLists]], and specified by a [[lazy specifier|specifier]].
 
 Examples:
 
     string => counter.string;
     visitIdentifier(Identifier that) => names.put((names[that.name] else 0) + 1);"
shared class LazySpecification(name, specifier, parameterLists = [])
        extends Specification() {
    
    shared actual LIdentifier name;
    shared actual LazySpecifier specifier;
    "The parameter lists, if any."
    shared Parameters[] parameterLists;
    
    shared actual [LIdentifier, <Parameters|LazySpecifier>*] children
            = [name, *concatenate(parameterLists, [specifier])];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLazySpecification(this);
    
    shared actual Boolean equals(Object that) {
        if (is LazySpecification that) {
            return name == that.name && specifier == that.specifier && parameterLists == that.parameterLists;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (specifier.hash + 31 * parameterLists.hash));
    
    shared LazySpecification copy(LIdentifier name = this.name, LazySpecifier specifier = this.specifier, Parameters[] parameterLists = this.parameterLists) {
        value ret = LazySpecification(name, specifier, parameterLists);
        copyExtraInfoTo(ret);
        return ret;
    }
}
