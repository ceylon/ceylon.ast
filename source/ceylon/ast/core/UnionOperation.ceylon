"A set union expression.
 
 Defined via [[Set.union]]. Left-associative."
shared class UnionOperation(leftChild_, rightChild_)
        extends SetOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728; remove!
    Precedence5Expression leftChild_;
    Precedence4Expression rightChild_;
    
    "The left unioned set."
    shared actual Precedence5Expression leftChild = leftChild_;
    "The right unioned set."
    shared actual Precedence4Expression rightChild = rightChild_;
    
    shared actual [Precedence5Expression, Precedence4Expression] children = [leftChild, rightChild];
    
    operator = "|";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnionOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is UnionOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared UnionOperation copy(Precedence5Expression leftChild = this.leftChild, Precedence4Expression rightChild = this.rightChild) {
        value ret = UnionOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
