"A scale expression.
 
 Defined via [[Scalable.scale]]. Right-associative.
 
 The scale operation is unique because the receiver of the method invocation by which it is defined
 is the [[right-hand side|rightChild]], not the [[left-hand side|leftChild]]. In other words,
 `lhs ** rhs` corresponds to
 
     rhs.scale(lhs)
 
 while e. g. `lhs * rhs` corresponds to
 
     lhs.times(rhs)
 
 (the qualifier and argument swapped places)."
shared class ScaleOperation(factor, scalable)
        extends BinaryOperation() {
    
    "The factor by which the [[scalable]] is scaled"
    shared Precedence6Expression factor;
    "The [[Scalable]] being scaled"
    shared Precedence7Expression scalable;
    
    "The factor by which the [[scalable]] is scaled"
    see (`value factor`)
    shared actual Precedence6Expression leftChild = factor;
    "The [[Scalable]] being scaled"
    see (`value scalable`)
    shared actual Precedence7Expression rightChild = scalable;
    
    shared actual [Precedence6Expression, Precedence7Expression] children = [leftChild, rightChild];
    
    operator = "**";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformScaleOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ScaleOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared ScaleOperation copy(Precedence6Expression leftChild = this.leftChild, Precedence7Expression rightChild = this.rightChild) {
        value ret = ScaleOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
