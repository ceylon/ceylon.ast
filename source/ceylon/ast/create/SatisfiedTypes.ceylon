import ceylon.ast.core {
    SatisfiedTypes
}

shared alias SatisfiedTypesIsh<Absent>
        given Absent satisfies Null
        => Iterable<PrimaryTypeIsh,Absent>;

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
SatisfiedTypes|Absent satisfiedTypes_internal<Absent>(SatisfiedTypes|SatisfiedTypesIsh<Absent> satisfiedTypes)
        given Absent satisfies Null {
    if (is SatisfiedTypes satisfiedTypes) {
        return satisfiedTypes;
    } else {
        assert (is SatisfiedTypesIsh<Absent> satisfiedTypes);
        if (is SatisfiedTypesIsh<Nothing> satisfiedTypes) {
            return package.satisfiedTypes(*satisfiedTypes);
        } else {
            assert (is Absent null);
            return null;
        }
    }
}
