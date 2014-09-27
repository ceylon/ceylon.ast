"A logical conjunction assignment expression.
 
 Right-associative.
 
 Examples:
 
     valid &&= parsed exists
     legal &&= !globalLock"
see (`class AndOperation`)
shared class AndAssignmentOperation(target, other)
        extends LogicalAssignmentOperation() {
    
    "The target expression and left operand."
    shared ThenElseExpression target;
    "The right operand."
    shared AssigningExpression other;
    
    "The target expression and left operand."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The right operand."
    see (`value other`)
    shared actual AssigningExpression rightOperand = other;
    
    shared actual [ThenElseExpression, AssigningExpression] children = [leftOperand, rightOperand];
    
    operator = "&&=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAndAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is AndAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AndAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, AssigningExpression rightOperand = this.rightOperand) {
        value ret = AndAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
