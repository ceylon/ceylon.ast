"An anonymous named argument, that is, an expression followed by a semicolon.
 
 Examples:
 
     name;
     width * height;"
shared class AnonymousArgument(expression)
        extends NamedArgument() {
    
    "The argument expression.
     
     To avoid syntactical ambiguity between anonymous arguments
     and [[specified arguments|SpecifiedArgument]], the expression
     may not be an [[AssignOperation]]."
    shared Expression expression;
    "Illegal syntax"
    assert (!expression is AssignOperation);
    
    shared actual [Expression] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAnonymousArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is AnonymousArgument that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared AnonymousArgument copy(Expression expression = this.expression) {
        value ret = AnonymousArgument(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
