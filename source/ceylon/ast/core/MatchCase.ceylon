"A ‘`case`’ item to test if the `switch` expression matches one or more expressions.
 
 Examples:
 
     null
     0 | 1
     null | smaller | larger"
shared class MatchCase(expressions)
        extends CaseItem() {
    
    "The tested expressions.
     
     The tested expressions must all be known at compile time:
     - literals are always known at compile time;
     - the [[operand|NegationOperation.operand]] of a [[NegationOperation]] must be an [[IntegerLiteral]];
     - a [[BaseExpression]] must refer to a toplevel value that satisfies `Identifiable|Null`.
     
     (A [[FloatLiteral]] is not permitted because due to rounding errors,
     exact comparison with a float literal value is rarely the correct thing to do.)"
    shared [<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression>+] expressions;
    // TODO perhaps we need an alias for IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression
    
    for (expression in expressions) {
        if (is NegationOperation expression) {
            "Negated operand in switch case item must be integer literal"
            assert (expression.operand is IntegerLiteral);
        }
    }
    
    shared actual [<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression>+] children = expressions;
    
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
    
    shared MatchCase copy([<IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression>+] expressions = this.expressions) {
        value ret = MatchCase(expressions);
        copyExtraInfoTo(ret);
        return ret;
    }
}
