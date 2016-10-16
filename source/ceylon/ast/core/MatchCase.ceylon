"A ‘`case`’ item to test if the `switch` expression matches one or more expressions.
 
 Examples:
 
     null
     0 | 1
     null | smaller | larger"
shared class MatchCase(expressions)
        extends CaseItem() {
    
    "The tested expressions.
     Every tested expression must be [[acceptable|matchCaseAcceptable]]."
    shared [<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression>+] expressions;
    
    "All expressions must be known at compile time"
    assert (expressions.every(matchCaseAcceptable));
    
    shared actual [<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression>+] children = expressions;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMatchCase(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMatchCase(this);

    shared actual Boolean equals(Object that) {
        if (is MatchCase that) {
            return expressions == that.expressions;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expressions.hash;
    
    shared MatchCase copy([<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression>+] expressions = this.expressions) {
        value ret = MatchCase(expressions);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"Determines whether an expression is acceptable for a [[match case|MatchCase]].
 
 - An [[integer|IntegerLiteral]], [[character|CharacterLiteral]]
   or [[string literal|StringLiteral]] is known at compile time and therefore accepted.
   (Float literals are not accepted because due to rounding errors,
   exact comparison with a float literal value is rarely the correct thing to do.)
 - A [[negated|NegationOperation]] [[integer literal|IntegerLiteral]] is known at compile time and therefore accepted.
 - A [[base expression|BaseExpression]] referring to a toplevel object is known at compile time
   and acceptable if the object satisfies `Identifiable|Null`.
 - A [[qualified expression|QualifiedExpression]] referring to
   a value constructor of a toplevel class is known at compile time
   and acceptable if the class satisfies `Identifiable|Null`.
 - A [[qualified expression|QualifiedExpression]] referring to
   a [[package|Package]]-qualified toplevel object is known at compile time
   and accepted if the object satisfies `Identifiable|Null`.
 - No other expressions are accepted.
 
 These conditions are slightly relaxed for `ceylon.ast`;
 without typechecker information, it is impossible to know what an expression refers to,
 so any base expression is accepted,
 and a qualified  expression is accepted
 iff its [[receiver expression|QualifiedExpression.receiverExpression]] is accepted,
 permitting arbitrarily nested qualifier expressions."
see (`value MatchCase.expressions`)
shared Boolean matchCaseAcceptable(Expression expression) {
    switch (expression)
    case (is IntegerLiteral|CharacterLiteral|StringLiteral|BaseExpression|Package) { return true; }
    case (is NegationOperation) { return  expression.operand is IntegerLiteral; }
    case (is QualifiedExpression) { return matchCaseAcceptable(expression.receiverExpression); }
    else { return false; }
}
