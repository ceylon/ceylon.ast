"A quotient or division expression.
 
 Defined via [[Numeric.divided]]. Left-associative."
see (`class DivideAssignmentOperation`)
shared class QuotientOperation(dividend, divisor)
        extends ArithmeticOperation() {
    
    "The dividend, or numerator."
    shared MultiplyingExpression dividend;
    "The divisor, or denominator."
    shared UnioningExpression divisor;
    
    "The dividend, or numerator."
    see (`value dividend`)
    shared actual MultiplyingExpression leftOperand = dividend;
    "The divisor, or denominator."
    see (`value divisor`)
    shared actual UnioningExpression rightOperand = divisor;
    
    shared actual [MultiplyingExpression, UnioningExpression] children = [leftOperand, rightOperand];
    
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
    
    shared QuotientOperation copy(MultiplyingExpression leftOperand = this.leftOperand, UnioningExpression rightOperand = this.rightOperand) {
        value ret = QuotientOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
