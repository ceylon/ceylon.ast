"A ‘`switch`’ clause of a [[`switch` statement|SwitchCaseElse]], that is,
 the keyword ‘`switch`’, followed by an [[expression]] enclosed in parentheses.
 
 Examples:
 
     switch (i.magnitude)
     switch (child)"
shared class SwitchClause(expression)
        extends Node() {
    
    "The `switch` expression."
    shared Expression expression;
    
    shared actual [Expression] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is SwitchClause that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared SwitchClause copy(Expression expression = this.expression) {
        value ret = SwitchClause(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
