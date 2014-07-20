"A complement assignment operation.
 
 Right-associative.
 
 Examples:
 
     people ~= kids
     elements ~= otherElements"
see (`class ComplementOperation`)
shared class ComplementAssignmentOperation(target, other)
        extends SetAssignmentOperation() {
    
    "The target expression and left operand."
    shared Precedence16Expression target;
    "The right operand."
    shared Precedence18Expression other;
    
    "The target expression and left operand."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The right operand."
    see (`value other`)
    shared actual Precedence18Expression rightOperand = other;
    
    shared actual [Precedence16Expression, Precedence18Expression] children = [leftOperand, rightOperand];
    
    operator = "~=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformComplementAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ComplementAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ComplementAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence18Expression rightOperand = this.rightOperand) {
        value ret = ComplementAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
