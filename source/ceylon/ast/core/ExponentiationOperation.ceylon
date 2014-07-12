"An exponentiation expression.
 
 Defined via [[Exponentiable.power]]. Right-associative."
shared class ExponentiationOperation(Object leftChild_, Object rightChild_)
        extends BinaryOperation() {
    
    // TODO leftChild_ and rightChild_ are UGLY hacks to work around ceylon-compiler#1728
    assert (is Precedence1Expression leftChild_);
    assert (is Precedence2Expression rightChild_);
    
    "The base expression."
    shared actual Precedence1Expression leftChild = leftChild_;
    "The exponent or power expression."
    shared actual Precedence2Expression rightChild = rightChild_;
    
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
