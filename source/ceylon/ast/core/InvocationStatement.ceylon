"""An invocation statement, that is, an invocation terminated by a semicolon.
   
   (The invocation can also be an *instantiation* invocation.)
   
   Examples:
   
       print("Hello, World!");
       that.visitChildren(this);"""
shared class InvocationStatement(expression)
        extends ExpressionStatement() {
    
    shared actual Invocation expression;
    
    shared actual [Invocation] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInvocationStatement(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitInvocationStatement(this);

    shared actual Boolean equals(Object that) {
        if (is InvocationStatement that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared InvocationStatement copy(Invocation expression = this.expression) {
        value ret = InvocationStatement(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
