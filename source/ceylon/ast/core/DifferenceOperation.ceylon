"A difference expression.
 
 Defined via [[Invertible.minus]]. Left-associative."
shared class DifferenceOperation(minuend, subtrahend)
        extends ArithmeticOperation() {
    
    "The minuend (the `a` in `a - b`)."
    shared Precedence8Expression minuend;
    "The subtrahend (the `b` in `a -b`)."
    shared Precedence7Expression subtrahend;
    
    "The minuend (the `a` in `a - b`)."
    see (`value minuend`)
    shared actual Precedence8Expression leftChild = minuend;
    "The subtrahend (the `b` in `a -b`)."
    see (`value subtrahend`)
    shared actual Precedence7Expression rightChild = subtrahend;
    
    shared actual [Precedence8Expression, Precedence7Expression] children = [leftChild, rightChild];
    
    operator = "-";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDifferenceOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is DifferenceOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared DifferenceOperation copy(Precedence8Expression leftChild = this.leftChild, Precedence7Expression rightChild = this.rightChild) {
        value ret = DifferenceOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
