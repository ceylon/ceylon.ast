"A boolean condition, that is, an expression.
 
 The condition is satisfied when the expression evaluates to [[true]].
 
 Examples:
 
     type in { type_ws, type_comment }
     literals.size == expressions.size + 1"
shared class BooleanCondition(condition)
        extends Condition() {
    
    "The boolean expression that needs to be [[true]]."
    shared Expression condition;
    
    shared actual [Expression] children = [condition];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBooleanCondition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitBooleanCondition(this);

    shared actual Boolean equals(Object that) {
        if (is BooleanCondition that) {
            return condition == that.condition;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * condition.hash;
    
    shared BooleanCondition copy(Expression condition = this.condition) {
        value ret = BooleanCondition(condition);
        copyExtraInfoTo(ret);
        return ret;
    }
}
