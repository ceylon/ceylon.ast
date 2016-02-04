"A specified named argument, that is, a [[Specification]].
 
 Examples:
 
     groupSeparators = false;
     initialCapacity = 256;"
shared class SpecifiedArgument(specification)
        extends NamedArgument() {
    
    "The specification of the argument.
     
     (Must not be qualified, i. e., [[Specification.qualifier]] must be [[null]].)"
    shared Specification specification;
    
    "Specification must not be qualified"
    assert (!specification.qualifier exists);
    
    shared actual [Specification] children = [specification];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifiedArgument(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpecifiedArgument(this);

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
