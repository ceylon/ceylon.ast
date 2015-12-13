"""An assignment expression.
   
   Right-associative.
   
   Examples:
   
       i = 1
       text = "Hello, ``name else "World"``!""""
shared class AssignOperation(target, expression)
        extends AssignmentOperation() {
    
    "The target expression."
    shared ThenElseExpression target;
    "The expression to assign to [[target]]."
    shared AssigningExpression expression;
    
    "The target expression."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The expression to assign to [[target]]."
    see (`value expression`)
    shared actual AssigningExpression rightOperand = expression;
    
    shared actual [ThenElseExpression, AssigningExpression] children = [leftOperand, rightOperand];
    
    operator = "=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAssignOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAssignOperation(this);

    shared actual Boolean equals(Object that) {
        if (is AssignOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AssignOperation copy(ThenElseExpression target = this.target, AssigningExpression expression = this.rightOperand) {
        value ret = AssignOperation(target, expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
