"An expression that terminates a comprehension.
 
 Examples:
 
     person.age
     i"
shared class ExpressionComprehensionClause(expression)
        extends ComprehensionClause() {
    
    "The expression."
    shared Expression expression;
    
    shared actual [Expression] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExpressionComprehensionClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExpressionComprehensionClause that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared ExpressionComprehensionClause copy(Expression expression = this.expression) {
        value ret = ExpressionComprehensionClause(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
