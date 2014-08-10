import ceylon.collection {
    MutableList,
    LinkedList
}
"""A string template, that is,
   a *string start*, followed by any number of value expression and *string mid* pairs,
   followed by a value expression and a *string end*.
   
   (The distinction between string starts, mids, and ends is a purely lexical one,
   and not covered in `ceylon.ast`.)
   
   There must be at least one expression in a string template,
   and the number of string literals must be exactly the number
   of expressions plus one.
   
   Note: If you are constructing the string template “by hand”, consider using
   the [[stringTemplate]] utility function; as it allows you to list the literals
   and expressions in the order in which they appear in the template (rather than
   separating them into two lists), this might make your code more readable.
   
   Examples:
   
       "Elapsed: `` tEnd - tStart ``ms"
       "Hello, ``person.firstName`` ``person.lastName``. How nice to see you back in ``person.homeTown``.""""
shared class StringTemplate(literals, expressions)
        extends Atom() {
    
    "The string literals of the string template, in order of appearance."
    shared [StringLiteral+] literals;
    "The expressions in the string template, in order of appearance."
    shared [ValueExpression+] expressions;
    
    "There must be exactly one more string literal than there are expressions"
    assert (literals.size == expressions.size + 1);
    
    assert (nonempty children_ = concatenate([literals.first], *zipPairs(literals.rest, expressions)));
    shared actual [<StringLiteral|Expression>+] children = children_;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformStringTemplate(this);
    
    shared actual Boolean equals(Object that) {
        if (is StringTemplate that) {
            return literals == that.literals && expressions == that.expressions;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (literals.hash + 31 * expressions.hash);
    
    shared StringTemplate copy([StringLiteral+] literals = this.literals, [ValueExpression+] expressions = this.expressions) {
        value ret = StringTemplate(literals, expressions);
        copyExtraInfoTo(ret);
        return ret;
    }
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
