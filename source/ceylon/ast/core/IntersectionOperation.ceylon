"A set intersection expression.
 
 Defined via [[Set.intersection]]. Left-associative."
shared class IntersectionOperation(leftChild_, rightChild_)
        extends SetOperation() {
    
    // TODO these are workarounds for ceylon-compiler#1728; remove!
    Precedence4Expression leftChild_;
    Precedence3Expression rightChild_;
    
    "The left intersected set."
    shared actual Precedence4Expression leftChild = leftChild_;
    "The right intersected set."
    shared actual Precedence3Expression rightChild = rightChild_;
    
    shared actual [Precedence4Expression, Precedence3Expression] children = [leftChild, rightChild];
    
    operator = "&";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntersectionOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IntersectionOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared IntersectionOperation copy(Precedence4Expression leftChild = this.leftChild, Precedence3Expression rightChild = this.rightChild) {
        value ret = IntersectionOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
