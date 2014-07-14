"A “large as” expression.
 
 No associativity."
shared class LargeAsOperation(leftChild_, rightChild_)
        extends ComparisonOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression leftChild_;
    Precedence10Expression rightChild_;
    
    "The left-hand side, expected to be at least as large as the right-hand side."
    shared actual Precedence10Expression leftChild = leftChild_;
    "The right-hand side, expected to be at least as small as the left-hand side."
    shared actual Precedence10Expression rightChild = rightChild_;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftChild, rightChild];
    
    operator = ">=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLargeAsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is LargeAsOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared LargeAsOperation copy(Precedence10Expression leftChild = this.leftChild, Precedence10Expression rightChild = this.rightChild) {
        value ret = LargeAsOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
