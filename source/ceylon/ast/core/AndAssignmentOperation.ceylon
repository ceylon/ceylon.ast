"A logical conjunction assignment expression.
 
 Right-associative.
 
 Examples:
 
     valid &&= parsed exists
     legal &&= !globalLock"
see (`class AndOperation`)
shared class AndAssignmentOperation(target, other)
        extends LogicalAssignmentOperation() {
    
    "The target expression and left operand."
    shared Precedence16Expression target;
    "The right operand."
    shared Precedence17Expression other;
    
    "The target expression and left operand."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The right operand."
    see (`value other`)
    shared actual Precedence17Expression rightOperand = other;
    
    shared actual [Precedence16Expression, Precedence17Expression] children = [leftOperand, rightOperand];
    
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
    
    shared AndAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence17Expression rightOperand = this.rightOperand) {
        value ret = AndAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
