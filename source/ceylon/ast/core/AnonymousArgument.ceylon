"An anonymous named argument, that is, an expression followed by a semicolon.
 
 Examples:
 
     name;
     width * height;"
shared class AnonymousArgument(expression)
        extends NamedArgument() {
    
    "The argument expression."
    shared Expression expression;
    
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
