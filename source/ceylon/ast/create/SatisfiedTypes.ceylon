import ceylon.ast.core {
    SatisfiedTypes
}

"""Converts a stream of [[primary types|satisfiedTypes]]
   to [[SatisfiedTypes]].
   
   Usage examples:
   
       satisfiedTypes("Identifiable")
       satisfiedTypes(baseType("MutableList", "Element"))"""
shared SatisfiedTypes satisfiedTypes(PrimaryTypeIsh+ satisfiedTypes) {
    return SatisfiedTypes(satisfiedTypes.collect(primaryType));
}

"Internal version of [[ceylon.ast.create::satisfiedTypes]]
 that also accepts a [[SatisfiedTypes]] argument."
SatisfiedTypes? satisfiedTypes_internal(SatisfiedTypes|{PrimaryTypeIsh*}? satisfiedTypes) {
    if (is SatisfiedTypes satisfiedTypes) {
        return satisfiedTypes;
    } else {
        if (exists satisfiedTypes, nonempty seq = satisfiedTypes.sequence()) {
            return package.satisfiedTypes(*seq);
        } else {
            return null;
        }
    }
}
