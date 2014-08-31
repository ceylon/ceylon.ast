"An ‘`if`’ comprehension clause, also knows as a filter clause.
 
 An ‘`if`’ comprehension clause consists of the keyword ‘`if`’,
 a [[condition list|conditions]] and a following [[clause]].
 
 Examples:
 
     if (person.age >= 18) person
     if (exists typeArguments = that.typeArguments) for (typeArgument in typeArguments) typeArgument.type"
shared class IfComprehensionClause(conditions, clause)
        extends InitialComprehensionClause() {
    
    "The condition list of the comprehension clause."
    shared Conditions conditions;
    "The following / next / inner comprehension clause."
    shared actual ComprehensionClause clause;
    
    shared actual [Conditions, ComprehensionClause] children = [conditions, clause];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIfComprehensionClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is IfComprehensionClause that) {
            return conditions == that.conditions && clause == that.clause;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31 * clause.hash);
    
    shared IfComprehensionClause copy(Conditions conditions = this.conditions, ComprehensionClause clause = this.clause) {
        value ret = IfComprehensionClause(conditions, clause);
        copyExtraInfoTo(ret);
        return ret;
    }
}
