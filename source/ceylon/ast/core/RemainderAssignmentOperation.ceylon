"A remainder assignment operation (`%=`).
 
 Right-associative.
 
 Examples:
 
     increment %= step"
see (`class RemainderOperation`)
shared class RemainderAssignmentOperation(target, divisor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and dividend / numerator."
    shared ThenElseExpression target;
    "The divisor / denominator."
    shared AssigningExpression divisor;
    
    "The target expression and dividend / numerator."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The divisor / denominator."
    see (`value divisor`)
    shared actual AssigningExpression rightOperand = divisor;
    
    shared actual [ThenElseExpression, AssigningExpression] children = [leftOperand, rightOperand];
    
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
    
    shared RemainderAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, AssigningExpression rightOperand = this.rightOperand) {
        value ret = RemainderAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
