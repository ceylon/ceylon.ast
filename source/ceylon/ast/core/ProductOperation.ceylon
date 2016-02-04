"A product expression.
 
 Defined via [[Numeric.times]]. Left-associative."
shared class ProductOperation(leftFactor, rightFactor)
        extends ArithmeticOperation() {
    
    "The left factor."
    shared MultiplyingExpression leftFactor;
    "The right factor."
    shared UnioningExpression rightFactor;
    
    "The left factor."
    see (`value leftFactor`)
    shared actual MultiplyingExpression leftOperand = leftFactor;
    "The right factor."
    see (`value rightFactor`)
    shared actual UnioningExpression rightOperand = rightFactor;
    
    shared actual [MultiplyingExpression, UnioningExpression] children = [leftOperand, rightOperand];
    
    operator = "*";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformProductOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitProductOperation(this);

    shared actual Boolean equals(Object that) {
        if (is ProductOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ProductOperation copy(MultiplyingExpression leftOperand = this.leftOperand, UnioningExpression rightOperand = this.rightOperand) {
        value ret = ProductOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
