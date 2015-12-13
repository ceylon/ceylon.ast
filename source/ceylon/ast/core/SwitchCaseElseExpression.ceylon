"""A `switch`/`case`/`else` expression, that is,
   a [[`switch` clause|switchClause]], followed by one or more [[`case` expressions|caseExpressions]]
   and optionally an [[`else` expression|elseExpression]] preceded by an ‘`else`’ keyword.
   
   Examples:
   
       switch (seq) case (null) "null" case (is []) "empty" else "nonempty"
       switch (text.first) case ('$') 2 case ('#') 16 case ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9') 10 else nothing"""
shared class SwitchCaseElseExpression(clause, caseExpressions, elseExpression)
        extends ConditionalExpression() {
    
    "The `switch` clause."
    shared SwitchClause clause;
    "The `case` expressions."
    shared [CaseExpression+] caseExpressions;
    "The `else` expression, if present."
    shared DisjoiningExpression|IfElseExpression|LetExpression? elseExpression;
    
    shared actual <SwitchClause|CaseExpression|DisjoiningExpression|IfElseExpression|LetExpression>[] children
            = concatenate(
        [clause],
        caseExpressions,
        emptyOrSingleton(elseExpression)
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchCaseElseExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSwitchCaseElseExpression(this);

    shared actual Boolean equals(Object that) {
        if (is SwitchCaseElseExpression that) {
            if (exists elseExpression) {
                if (exists elseExpression_ = that.elseExpression) {
                    if (elseExpression != elseExpression_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.elseExpression exists) {
                return false;
            }
            return clause == that.clause && caseExpressions == that.caseExpressions;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (clause.hash + 31 * (caseExpressions.hash + 31 * (elseExpression?.hash else 0)));
    
    shared SwitchCaseElseExpression copy(SwitchClause clause = this.clause, [CaseExpression+] caseExpressions = this.caseExpressions, DisjoiningExpression|IfElseExpression|LetExpression? elseExpression = this.elseExpression) {
        value ret = SwitchCaseElseExpression(clause, caseExpressions, elseExpression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
