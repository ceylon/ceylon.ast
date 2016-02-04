"A subtract assignment operation (`-=`).
 
 Right-associative.
 
 Examples:
 
     countdown -= \\iΔt"
see (`class DifferenceOperation`)
shared class SubtractAssignmentOperation(target, subtrahend)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and minuend."
    shared ThenElseExpression target;
    "The subtrahend."
    shared AssigningExpression subtrahend;
    
    "The target expression and minuend."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The subtrahend."
    see (`value subtrahend`)
    shared actual AssigningExpression rightOperand = subtrahend;
    
    shared actual [ThenElseExpression, AssigningExpression] children = [leftOperand, rightOperand];
    
    operator = "-=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSubtractAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSubtractAssignmentOperation(this);

    shared actual Boolean equals(Object that) {
        if (is SubtractAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SubtractAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, AssigningExpression rightOperand = this.rightOperand) {
        value ret = SubtractAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
