"A ‘`case`’ expression clause of a [[‘`switch`’ expression|SwitchCaseElseExpression]], that is,
 optionally the keyword ‘`else`’, then the keyword ‘`case`’, followed by a [[case item|caseItem]] enclosed in parentheses and an expression.
 
 The expression is parsed with a precedence just below
 the [[`then`|ThenOperation]] and [[`else`|ElseOperation]] operations,
 to avoid ambiguity with these.
 Alternatively, it may be an [[`if`/`then`/`else` expression|IfElseExpression]]
 or [[`let` expression|LetExpression]].
 
 Examples:
 
     case (is Integer) val / 2
     case ('$') 2
     else case (is Integer) val.magnitude"
shared class CaseExpression(caseItem, expression, elseCase = false)
        extends Node() {
    
    "The case item for this clause."
    shared CaseItem caseItem;
    "The expression for this clause."
    shared DisjoiningExpression|IfElseExpression|LetExpression expression;
    "Whether this is a non-disjoint `else case` clause
     or a regular disjoint `case` clause."
    shared Boolean elseCase;
    
    shared actual [CaseItem, DisjoiningExpression|IfElseExpression|LetExpression] children = [caseItem, expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCaseExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCaseExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is CaseExpression that) {
            return caseItem==that.caseItem && expression==that.expression && elseCase==that.elseCase;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (caseItem.hash + 31 * (expression.hash + 31*elseCase.hash));
    
    shared CaseExpression copy(CaseItem caseItem = this.caseItem, DisjoiningExpression|IfElseExpression|LetExpression expression = this.expression, Boolean elseCase = this.elseCase) {
        value ret = CaseExpression(caseItem, expression, elseCase);
        copyExtraInfoTo(ret);
        return ret;
    }
}
