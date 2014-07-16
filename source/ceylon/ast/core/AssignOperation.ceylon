"""An assignment expression.
   
   Right-associative.
   
   Examples:
   
       i = 1
       text = "Hello, ``name else "World"``!""""
shared class AssignOperation(target, expression)
        extends AssignmentOperation() {
    
    "The target expression."
    shared Precedence16Expression target;
    "The expression to assign to [[target]]."
    shared Precedence17Expression expression;
    
    "The target expression."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The expression to assign to [[target]]."
    see (`value expression`)
    shared actual Precedence17Expression rightOperand = expression;
    
    shared actual [Precedence16Expression, Precedence17Expression] children = [leftOperand, rightOperand];
    
    operator = "=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAssignOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is AssignOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AssignOperation copy(Precedence16Expression target = this.target, Precedence17Expression expression = this.rightOperand) {
        value ret = AssignOperation(target, expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
