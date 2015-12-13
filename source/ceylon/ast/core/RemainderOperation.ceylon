"A remainder expression.
 
 Defined via [[Integral.remainder]]. Left-associative."
see (`class RemainderAssignmentOperation`)
shared class RemainderOperation(dividend, divisor)
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
    
    operator = "%";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformRemainderOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitRemainderOperation(this);

    shared actual Boolean equals(Object that) {
        if (is RemainderOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared RemainderOperation copy(MultiplyingExpression leftOperand = this.leftOperand, UnioningExpression rightOperand = this.rightOperand) {
        value ret = RemainderOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
