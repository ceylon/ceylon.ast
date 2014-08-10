"A prefix or postfix increment or decrement expression statement.
 
 Examples:
 
     i++;
     --size;"
shared class PrefixPostfixStatement(expression)
        extends ExpressionStatement() {
    
    shared actual PrefixOperation|PostfixOperation expression;
    
    shared actual [PrefixOperation|PostfixOperation] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPrefixPostfixStatement(this);
    
    shared actual Boolean equals(Object that) {
        if (is PrefixPostfixStatement that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared PrefixPostfixStatement copy(PrefixOperation|PostfixOperation expression = this.expression) {
        value ret = PrefixPostfixStatement(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
