"An exponentiation expression.
 
 Defined via [[Exponentiable.power]]. Right-associative."
shared class ExponentiationOperation(base, exponent)
        extends ArithmeticOperation() {
    
    "The base expression."
    shared Precedence1Expression base;
    "The exponent or power expression."
    shared Precedence2Expression exponent;
    
    "The base expression."
    see (`value base`)
    shared actual Precedence1Expression leftChild = base;
    "The exponent or power expression."
    see (`value exponent`)
    shared actual Precedence2Expression rightChild = exponent;
    
    operator = "^";
    
    shared actual [Precedence1Expression, Precedence2Expression] children = [leftChild, rightChild];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExponentiationOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExponentiationOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared ExponentiationOperation copy(Precedence1Expression leftChild = this.leftChild, Precedence2Expression rightChild = this.rightChild) {
        value ret = ExponentiationOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
