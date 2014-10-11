"""A string template, that is,
   a *string start*, followed by any number of value expression and *string mid* pairs,
   followed by a value expression and a *string end*.
   
   (The distinction between string starts, mids, and ends is a purely lexical one,
   and not covered in `ceylon.ast`.)
   
   There must be at least one expression in a string template,
   and the number of string literals must be exactly the number
   of expressions plus one.
   
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
