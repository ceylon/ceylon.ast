"A remainder assignment operation (`%=`).
 
 Right-associative.
 
 Examples:
 
     increment %= step"
see (`class RemainderOperation`)
shared class RemainderAssignmentOperation(target, divisor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and dividend / numerator."
    shared Precedence16Expression target;
    "The divisor / denominator."
    shared Precedence18Expression divisor;
    
    "The target expression and dividend / numerator."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The divisor / denominator."
    see (`value divisor`)
    shared actual Precedence18Expression rightOperand = divisor;
    
    shared actual [Precedence16Expression, Precedence18Expression] children = [leftOperand, rightOperand];
    
    operator = "%=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformRemainderAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is RemainderAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared RemainderAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence18Expression rightOperand = this.rightOperand) {
        value ret = RemainderAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
