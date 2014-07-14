"A “larger than” expression.
 
 No associativity."
shared class LargerOperation(leftChild_, rightChild_)
        extends ComparisonOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728, remove!
    Precedence10Expression leftChild_;
    Precedence10Expression rightChild_;
    
    "The left-hand side, expected to be larger."
    shared actual Precedence10Expression leftChild = leftChild_;
    "The right-hand side, expected to be smaller."
    shared actual Precedence10Expression rightChild = rightChild_;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftChild, rightChild];
    
    operator = ">";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLargerOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is LargerOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared LargerOperation copy(Precedence10Expression leftChild = this.leftChild, Precedence10Expression rightChild = this.rightChild) {
        value ret = LargerOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
