"""A comprehension clause that can start a comprehension.                                                                                                                                                                                                                                              Examples:                                                                                                                                                                                                                                                                                               for (person in people) "``person.firstName`` ``person.lastName``"
       if (exists typeArguments = that.typeArguments) for (typeArgument in typeArguments) typeArgument.type"""
shared abstract class InitialComprehensionClause()
        of ForComprehensionClause | IfComprehensionClause
        extends ComprehensionClause() {
    
    "The following / next / inner comprehension clause."
    shared formal ComprehensionClause clause;
}
