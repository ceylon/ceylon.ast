"A logical disjunction assignment expression.
 
 Right-associative.
 
 Examples:
 
     permitted ||= backdoorTriggered
     canPrint ||= networkPrinterPresent"
see (`class OrOperation`)
shared class OrAssignmentOperation(target, other)
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
    
    operator = "||=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOrAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is OrAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared OrAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence17Expression rightOperand = this.rightOperand) {
        value ret = OrAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
