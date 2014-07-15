"A product expression.
 
 Defined via [[Numeric.times]]. Left-associative."
shared class ProductOperation(leftFactor, rightFactor)
        extends ArithmeticOperation() {
    
    "The left factor."
    shared Precedence6Expression leftFactor;
    "The right factor."
    shared Precedence5Expression rightFactor;
    
    "The left factor."
    see (`value leftFactor`)
    shared actual Precedence6Expression leftOperand = leftFactor;
    "The right factor."
    see (`value rightFactor`)
    shared actual Precedence5Expression rightOperand = rightFactor;
    
    shared actual [Precedence6Expression, Precedence5Expression] children = [leftOperand, rightOperand];
    
    operator = "*";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformProductOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ProductOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ProductOperation copy(Precedence6Expression leftOperand = this.leftOperand, Precedence5Expression rightOperand = this.rightOperand) {
        value ret = ProductOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
