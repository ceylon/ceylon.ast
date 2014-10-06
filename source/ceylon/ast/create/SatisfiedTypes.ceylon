import ceylon.ast.core {
    SatisfiedTypes,
    PrimaryType
}

shared alias SatisfiedTypesIsh<Absent>
        given Absent satisfies Null
        => SatisfiedTypes|Iterable<PrimaryType,Absent>;

"""Converts a stream of [[primary types|satisfiedTypes]]
   to [[SatisfiedTypes]].
   
   This function is not intended to be used directly; instead, it is used
   by functions like [[classDefinition]] and [[interfaceDefinition]].
   
   If the stream is guaranteed nonempty, then the return type is nonoptional
   (`Absent=Nothing`); if it may be empty, the return type is optional.
   Rationale: All `ceylon.ast` nodes with a `satisfiedTypes` child make it optional,
   i. e., of type `SatisfiedTypes?`; the helper functions for these nodes then
   declare parameters of type `SatisfiedTypesIsh<Null>`, signifying that the
   [[SatisfiedTypes]] node can be `null` if the received stream is empty.
   On the other hand, this function may also be used like this:
   
       SatisfiedTypes ct = satisfiedTypes({ lidentifier("true"), lidentifier("false") });
   
   where the inferred type for the argument is `Iterable<LIdentifier,Nothing>`,
   i. e., `Absent=Nothing`, and therefore the return type is nonoptional."""
shared SatisfiedTypes|Absent satisfiedTypes<Absent>(SatisfiedTypesIsh<Absent> satisfiedTypes)
        given Absent satisfies Null {
    if (is SatisfiedTypes satisfiedTypes) {
        return satisfiedTypes;
    } else {
        assert (is Iterable<PrimaryType,Absent> satisfiedTypes);
        if (is Sequence<PrimaryType> seq = satisfiedTypes.sequence()) {
            return SatisfiedTypes(seq);
        } else {
            assert (is Absent null);
            return null;
        }
    }
}
