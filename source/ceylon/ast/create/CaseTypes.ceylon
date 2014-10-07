import ceylon.ast.core {
    CaseTypes,
    MemberName,
    PrimaryType,
    UIdentifier,
    LIdentifier
}

shared alias CaseTypeIsh => PrimaryTypeIsh|IdentifierIsh;
shared alias CaseTypesIsh<Absent>
        given Absent satisfies Null
        => Iterable<CaseTypeIsh,Absent>;

"""Converts a stream of [[primary types and anonymous class names|caseTypes]]
   to [[CaseTypes]].
   
   Usage examples:
   
       caseTypes("Other") // self type constraint
       caseTypes("true", "false")"""
shared CaseTypes caseTypes(CaseTypeIsh+ caseTypes) {
    value seq = caseTypes.collect {
        PrimaryType|MemberName collecting(PrimaryTypeIsh|IdentifierIsh element) {
            switch (element)
            case (is PrimaryType) { return element; }
            case (is IdentifierIsh) {
                value id = identifier(element);
                switch (id)
                case (is UIdentifier) { return primaryType(id); }
                case (is LIdentifier) { return id; }
            }
        }
    };
    return CaseTypes(seq);
}

"Internal version of [[ceylon.ast.create::caseTypes]]
 that also accepts a [[CaseTypes]] argument or an empty argument."
CaseTypes|Absent caseTypes_internal<Absent>(CaseTypes|CaseTypesIsh<Absent> caseTypes)
        given Absent satisfies Null {
    if (is CaseTypes caseTypes) {
        return caseTypes;
    } else {
        assert (is CaseTypesIsh<Absent> caseTypes);
        if (is CaseTypesIsh<Nothing> caseTypes) {
            return package.caseTypes(*caseTypes);
        } else {
            assert (is Absent null);
            return null;
        }
    }
}
