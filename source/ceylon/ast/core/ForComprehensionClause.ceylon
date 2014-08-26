"""A ‘`for`’ comprehension clause, also known as a quantifier clause.
   
   A ‘`for`’ comprehension clause consists of the keyword ‘`for`’,
   an [[iterator]] and a following [[clause]].
   
   Examples:
   
       for (person in people) "``person.firstName`` ``person.lastName``"
       for (people in peoples) for (person in people) if (person.age >= 18) person"""
shared class ForComprehensionClause(iterator, clause)
        extends InitialComprehensionClause() {
    
    "The iterator of the comprehension clause."
    shared ForIterator iterator;
    "The following / next / inner comprehension clause."
    shared actual ComprehensionClause clause;
    
    shared actual [ForIterator, ComprehensionClause] children = [iterator, clause];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformForComprehensionClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is ForComprehensionClause that) {
            return iterator == that.iterator && clause == that.clause;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (iterator.hash + 31 * clause.hash);
    
    shared ForComprehensionClause copy(ForIterator iterator = this.iterator, ComprehensionClause clause = this.clause) {
        value ret = ForComprehensionClause(iterator, clause);
        copyExtraInfoTo(ret);
        return ret;
    }
}
