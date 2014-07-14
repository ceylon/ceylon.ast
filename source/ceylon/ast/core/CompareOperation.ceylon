"A compare expression.
 
 No associativity.
 
 This is the concrete class for expressions like `first <=> second`;
 not to be confused with [[ComparisonOperation]], the abstract superclass of expressions like `a <= b` and `x > 3`!"
shared class CompareOperation(leftChild_, rightChild_)
        extends BinaryOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression leftChild_;
    Precedence10Expression rightChild_;
    
    "The left-hand side."
    shared actual Precedence10Expression leftChild = leftChild_;
    "The right-hand side."
    shared actual Precedence10Expression rightChild = rightChild_;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftChild, rightChild];
    
    operator = "<=>";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCompareOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is CompareOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared CompareOperation copy(Precedence10Expression leftChild = this.leftChild, Precedence10Expression rightChild = this.rightChild) {
        value ret = CompareOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
