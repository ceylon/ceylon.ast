"A set complement expression.
 
 Defined via [[Set.complement]]. Left-associative."
shared class ComplementOperation(leftChild_, rightChild_)
        extends SetOperation() {
    
    // TODO leftChild_, rightChild_ are a workaround for ceylon-compiler#1728; remove!
    Precedence5Expression leftChild_;
    Precedence4Expression rightChild_;
    
    "The “this” set, from which elements for the result set are taken."
    shared actual Precedence5Expression leftChild = leftChild_;
    "The “other” set, the elements of which are not present in the result set."
    shared actual Precedence4Expression rightChild = rightChild_;
    
    shared actual [Precedence5Expression, Precedence4Expression] children = [leftChild, rightChild];
    
    operator = "~";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformComplementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ComplementOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared ComplementOperation copy(Precedence5Expression leftChild = this.leftChild, Precedence4Expression rightChild = this.rightChild) {
        value ret = ComplementOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
