"A remainder expression.
 
 Defined via [[Integral.remainder]]. Left-associative."
see (`class RemainderAssignmentOperation`)
shared class RemainderOperation(dividend, divisor)
        extends ArithmeticOperation() {
    
    "The dividend, or numerator."
    shared Precedence6Expression dividend;
    "The divisor, or denominator."
    shared Precedence5Expression divisor;
    
    "The dividend, or numerator."
    see (`value dividend`)
    shared actual Precedence6Expression leftOperand = dividend;
    "The divisor, or denominator."
    see (`value divisor`)
    shared actual Precedence5Expression rightOperand = divisor;
    
    shared actual [Precedence6Expression, Precedence5Expression] children = [leftOperand, rightOperand];
    
    operator = "%";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformRemainderOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is RemainderOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared RemainderOperation copy(Precedence6Expression leftOperand = this.leftOperand, Precedence5Expression rightOperand = this.rightOperand) {
        value ret = RemainderOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
