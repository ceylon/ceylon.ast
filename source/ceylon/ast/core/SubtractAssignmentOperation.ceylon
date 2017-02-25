"A subtract assignment operation (`-=`).
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     countdown -= \\iΔt"
see (`class DifferenceOperation`)
shared class SubtractAssignmentOperation(target, subtrahend)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and minuend."
    shared ThenElseExpression target;
    "The subtrahend."
    shared Expression subtrahend;
    
    "The target expression and minuend."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The subtrahend."
    see (`value subtrahend`)
    shared actual Expression rightOperand = subtrahend;
    
    shared actual [ThenElseExpression, Expression] children = [leftOperand, rightOperand];
    
    operator = "-=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSubtractAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSubtractAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SubtractAssignmentOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared SubtractAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = SubtractAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
