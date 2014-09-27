"An exponentiation expression.
 
 Defined via [[Exponentiable.power]]. Right-associative.
 
 Examples:
 
     sideLength^dimension
     e^x"
shared class ExponentiationOperation(base, exponent)
        extends ArithmeticOperation() {
    
    "The base expression."
    shared PrePostfixingExpression base;
    "The exponent or power expression."
    shared ExponentiatingExpression exponent;
    
    "The base expression."
    see (`value base`)
    shared actual PrePostfixingExpression leftOperand = base;
    "The exponent or power expression."
    see (`value exponent`)
    shared actual ExponentiatingExpression rightOperand = exponent;
    
    operator = "^";
    
    shared actual [PrePostfixingExpression, ExponentiatingExpression] children = [leftOperand, rightOperand];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExponentiationOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExponentiationOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ExponentiationOperation copy(PrePostfixingExpression leftOperand = this.leftOperand, ExponentiatingExpression rightOperand = this.rightOperand) {
        value ret = ExponentiationOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
