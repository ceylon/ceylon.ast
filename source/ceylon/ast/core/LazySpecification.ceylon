"A lazy specification statement, that is,
 a [[member name|name]], optionally followed by one or more [[parameter lists|parameterLists]], and specified by a [[lazy specifier|specifier]].
 
 Examples:
 
     string => counter.string;
     visitIdentifier(Identifier that) => names.put((names[that.name] else 0) + 1);"
shared class LazySpecification(name, specifier, parameterLists = [], qualifier = null)
        extends Specification() {
    
    shared actual LIdentifier name;
    shared actual LazySpecifier specifier;
    "The parameter lists, if any."
    shared Parameters[] parameterLists;
    shared actual This? qualifier;
    
    shared actual [LIdentifier, <Parameters|LazySpecifier|This>*] children
            = [name, *concatenate(parameterLists, [specifier], emptyOrSingleton(qualifier))];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLazySpecification(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitLazySpecification(this);

    shared actual Boolean equals(Object that) {
        if (is LazySpecification that) {
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
            return name == that.name && specifier == that.specifier && parameterLists == that.parameterLists;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (specifier.hash + 31 * parameterLists.hash));
    
    shared LazySpecification copy(LIdentifier name = this.name, LazySpecifier specifier = this.specifier, Parameters[] parameterLists = this.parameterLists, This? qualifier = this.qualifier) {
        value ret = LazySpecification(name, specifier, parameterLists, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
