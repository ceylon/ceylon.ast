"A nonempty list of satisfied types, separated by the intersection operator (‘`&`’).
 
 Examples:
 
     satisfies {Element+}
     satisfies Printable & Persistent"
shared class SatisfiedTypes(satisfiedTypes)
        extends Node() {
    
    "The satisfied types."
    shared [PrimaryType+] satisfiedTypes;
    
    shared actual [PrimaryType+] children = satisfiedTypes;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSatisfiedTypes(this);
    
    shared actual Boolean equals(Object that) {
        if (is SatisfiedTypes that) {
            return satisfiedTypes == that.satisfiedTypes;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * satisfiedTypes.hash;
    
    shared SatisfiedTypes copy([PrimaryType+] satisfiedTypes = this.satisfiedTypes) {
        value ret = SatisfiedTypes(satisfiedTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
