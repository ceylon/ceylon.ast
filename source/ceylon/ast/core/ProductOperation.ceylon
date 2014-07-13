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
    shared actual Precedence6Expression leftChild = leftFactor;
    "The right factor."
    see (`value rightFactor`)
    shared actual Precedence5Expression rightChild = rightFactor;
    
    shared actual [Precedence6Expression, Precedence5Expression] children = [leftChild, rightChild];
    
    operator = "*";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformProductOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ProductOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared ProductOperation copy(Precedence6Expression leftChild = this.leftChild, Precedence5Expression rightChild = this.rightChild) {
        value ret = ProductOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
