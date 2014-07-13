"A remainder expression.
 
 Defined via [[Integral.remainder]]. Left-associative."
shared class RemainderOperation(dividend, divisor)
        extends ArithmeticOperation() {
    
    "The dividend, or numerator."
    shared Precedence6Expression dividend;
    "The divisor, or denominator."
    shared Precedence5Expression divisor;
    
    "The dividend, or numerator."
    see (`value dividend`)
    shared actual Precedence6Expression leftChild = dividend;
    "The divisor, or denominator."
    see (`value divisor`)
    shared actual Precedence5Expression rightChild = divisor;
    
    shared actual [Precedence6Expression, Precedence5Expression] children = [leftChild, rightChild];
    
    operator = "%";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformRemainderOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is RemainderOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared RemainderOperation copy(Precedence6Expression leftChild = this.leftChild, Precedence5Expression rightChild = this.rightChild) {
        value ret = RemainderOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
