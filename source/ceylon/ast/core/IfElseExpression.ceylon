"An if/then/else conditional expression, that is,
 the keyword ‘`if`’, followed by a [[condition list|conditions]],
 the keyword ‘`then`’, followed by an [[expression|thenExpression]], and
 the keyword ‘`else`’, followed by an [[expression or another `if` expression|elseExpression]].
 
 The `then` and `else` expressions are both parsed with a precedence just below the [[then|ThenOperation]] and [[else|ElseOperation]] operations,
 to avoid ambiguity with these.
 
 Examples (multi-line):
 
     if (is Person p)
     then p.name
     else p.string
 
     if (exists youngest = peopleSortedByAge.first, youngest.age >= 18)
     then true
     else false"
shared class IfElseExpression(conditions, thenExpression, elseExpression)
        extends ConditionalExpression() {
    
    "The conditions that need to be satisfied
     to evaluate to the [[`then` expression|thenExpression]]."
    shared Conditions conditions;
    "The expression that is evaluated if the [[conditions]] are satisfied."
    shared DisjoiningExpression thenExpression;
    "The expression that is evaluated if the [[conditions]] aren’t satisfied."
    shared DisjoiningExpression|IfElseExpression elseExpression;
    
    shared actual [Conditions, DisjoiningExpression, DisjoiningExpression|IfElseExpression] children = [conditions, thenExpression, elseExpression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIfElseExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is IfElseExpression that) {
            return conditions == that.conditions && thenExpression == that.thenExpression && elseExpression == that.elseExpression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31 * (thenExpression.hash + 31 * elseExpression.hash));
    
    shared IfElseExpression copy(Conditions conditions = this.conditions, DisjoiningExpression thenExpression = this.thenExpression, DisjoiningExpression|IfElseExpression elseExpression = this.elseExpression) {
        value ret = IfElseExpression(conditions, thenExpression, elseExpression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
