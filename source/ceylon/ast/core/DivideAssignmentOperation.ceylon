"A divide assignment operation (`/=`).
 
 Right-associative.
 
 Examples:
 
     width /= 2
     amount /= exchangeRate"
see (`class QuotientOperation`)
shared class DivideAssignmentOperation(target, divisor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and dividend / numerator."
    shared Precedence16Expression target;
    "The divisor / denominator."
    shared Precedence17Expression divisor;
    
    "The target expression and dividend / numerator."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The divisor / denominator."
    see (`value divisor`)
    shared actual Precedence17Expression rightOperand = divisor;
    
    shared actual [Precedence16Expression, Precedence17Expression] children = [leftOperand, rightOperand];
    
    operator = "/=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDivideAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is DivideAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared DivideAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence17Expression rightOperand = this.rightOperand) {
        value ret = DivideAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
