"A spanned range expression.
 
 Defined via [[span]]. No associativity."
shared class SpanOperation(first, last)
        extends BinaryOperation() {
    
    "The first element of the spanned range."
    shared Precedence8Expression first;
    "The last element of the spanned range."
    shared Precedence8Expression last;
    
    "The first element of the spanned range."
    see (`value first`)
    shared actual Precedence8Expression leftChild = first;
    "The last element of the spanned range."
    see (`value last`)
    shared actual Precedence8Expression rightChild = last;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftChild, rightChild];
    
    operator = "..";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpanOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared SpanOperation copy(Precedence8Expression leftChild = this.leftChild, Precedence8Expression rightChild = this.rightChild) {
        value ret = SpanOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
