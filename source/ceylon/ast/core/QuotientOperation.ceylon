"A quotient or division expression.
 
 Defined via [[Numeric.divided]]. Left-associative."
shared class QuotientOperation(dividend, divisor)
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
    
    operator = "/";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformQuotientOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is QuotientOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared QuotientOperation copy(Precedence6Expression leftOperand = this.leftOperand, Precedence5Expression rightOperand = this.rightOperand) {
        value ret = QuotientOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}