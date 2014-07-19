"A specified named argument, that is, a [[Specification]].
 
 Examples:
 
     groupSeparators = false;
     initialCapacity = 256;"
shared class SpecifiedArgument(specification)
        extends NamedArgument() {
    
    "The specification of the argument."
    shared Specification specification;
    
    shared actual [Specification] children = [specification];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifiedArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpecifiedArgument that) {
            return specification == that.specification;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * specification.hash;
    
    shared SpecifiedArgument copy(Specification specification = this.specification) {
        value ret = SpecifiedArgument(specification);
        copyExtraInfoTo(ret);
        return ret;
    }
}
