"A multiply assignment operation (`*=`).
 
 Right-associative.
 
 Examples:
 
     balance *= 1 + interestRate"
shared class MultiplyAssignmentOperation(target, factor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and left factor."
    shared Precedence16Expression target;
    "The right factor."
    shared Precedence18Expression factor;
    
    "The target expression and left factor."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The right factor."
    see (`value factor`)
    shared actual Precedence18Expression rightOperand = factor;
    
    shared actual [Precedence16Expression, Precedence18Expression] children = [leftOperand, rightOperand];
    
    operator = "*=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMultiplyAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is MultiplyAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared MultiplyAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence18Expression rightOperand = this.rightOperand) {
        value ret = MultiplyAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
