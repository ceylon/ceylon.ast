"A comprehension, that is,
 a chain of [[comprehension clauses|ComprehensionClause]],
 beginning with an [[InitialComprehensionClause]]
 and terminated by an [[ExpressionComprehensionClause]].
 
 Examples:
 
     for (people in peoples) for (person in people) if (person.age >= age) person
     if (exists typeArguments = that.typeArguments) for (typeArgument in typeArguments) typeArgument.type"
shared class Comprehension(clause)
        extends Node() {
    
    "The initial, “head” comprehension clause.
     The other comprehension clauses are stored
     as a linked list via [[InitialComprehensionClause.clause]]."
    shared InitialComprehensionClause clause;
    
    shared actual [InitialComprehensionClause] children = [clause];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformComprehension(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitComprehension(this);

    shared actual Boolean equals(Object that) {
        if (is Comprehension that) {
            return clause == that.clause;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * clause.hash;
    
    shared Comprehension copy(InitialComprehensionClause clause = this.clause) {
        value ret = Comprehension(clause);
        copyExtraInfoTo(ret);
        return ret;
    }
}
