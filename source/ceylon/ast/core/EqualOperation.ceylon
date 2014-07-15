"An equals expression.
 
 Defined via [[Object.equals]]. No associativity."
shared class EqualOperation(leftChild_, rightChild_)
        extends EqualityOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728, remove!
    Precedence11Expression leftChild_;
    Precedence11Expression rightChild_;
    
    shared actual Precedence11Expression leftChild = leftChild_;
    shared actual Precedence11Expression rightChild = rightChild_;
    
    shared actual [Precedence11Expression, Precedence11Expression] children = [leftChild, rightChild];
    
    operator = "==";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEqualOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EqualOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared EqualOperation copy(Precedence11Expression leftChild = this.leftChild, Precedence11Expression rightChild = this.rightChild) {
        value ret = EqualOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
