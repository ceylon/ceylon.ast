"A subtract assignment operation (`-=`).
 
 Right-associative.
 
 Examples:
 
     countdown -= \\iΔt"
see (`class DifferenceOperation`)
shared class SubtractAssignmentOperation(target, subtrahend)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and minuend."
    shared Precedence16Expression target;
    "The subtrahend."
    shared Precedence17Expression subtrahend;
    
    "The target expression and minuend."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The subtrahend."
    see (`value subtrahend`)
    shared actual Precedence17Expression rightOperand = subtrahend;
    
    shared actual [Precedence16Expression, Precedence17Expression] children = [leftOperand, rightOperand];
    
    operator = "-=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSubtractAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SubtractAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SubtractAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence17Expression rightOperand = this.rightOperand) {
        value ret = SubtractAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
