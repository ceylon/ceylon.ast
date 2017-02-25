"""An assignment expression statement, that is, an assignment terminated by a semicolon.
   
   In principle, a statement like `i = 0;` could be parsed ambigously, either as an assignment statement
   or as a [[specification|ValueSpecification]]. When possible, the Ceylon language favors the latter interpretation,
   which means that an assignment statement where the [[target|AssignOperation.target]] is a [[BaseExpression]]
   is invalid. (This is only true for simple [[AssignOperation]]s; other [[assignment operations|AssignmentOperation]],
   e. g. `i += size;`, are still valid assignment expression statements.)
   
   Examples:
   
       text.length += added.length;
       ret.endToken = tokens.token(";", semicolon);"""
shared class AssignmentStatement(expression)
        extends ExpressionStatement() {
    
    shared actual AssignmentOperation expression;
    
    if (is AssignOperation expression) {
        "An assignment statement with a simple assign operation
         where the target expression is a simple base expression
         must instead be expressed as a value specification"
        assert (!expression.target is BaseExpression);
    }
    
    shared actual [AssignmentOperation] children = [expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAssignmentStatement(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAssignmentStatement(this);
    
    shared actual Boolean equals(Object that) {
        if (is AssignmentStatement that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared AssignmentStatement copy(AssignmentOperation expression = this.expression) {
        value ret = AssignmentStatement(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
