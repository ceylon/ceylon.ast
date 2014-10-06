import ceylon.ast.core {
    StringLiteral,
    StringTemplate,
    ValueExpression
}
import ceylon.collection {
    LinkedList,
    MutableList
}

"Utility function to construct a [[StringTemplate]]
 from an alternating list of string literals and expressions.
 
 Using this function, you can list the string literals and expressions
 in exactly the order in which they appear in the string template
 (rather than separated into two sequences, as in [[StringLiteral]]),
 at the cost of some type safety."
shared StringTemplate stringTemplate(StringLiteral|ValueExpression+ parts) {
    value it = parts.iterator();
    variable value elem = it.next();
    MutableList<StringLiteral> literals = LinkedList<StringLiteral>();
    MutableList<ValueExpression> expressions = LinkedList<ValueExpression>();
    assert (is StringLiteral first = elem);
    literals.add(first);
    while (!((elem = it.next()) is Finished)) {
        assert (is ValueExpression expression = elem);
        expressions.add(expression);
        assert (is StringLiteral literal = it.next());
        literals.add(literal);
    }
    assert (nonempty lits = literals.sequence());
    assert (nonempty exprs = expressions.sequence());
    return StringTemplate(lits, exprs);
}
