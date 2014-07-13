"A measured range expression.
 
 Defined via [[measure]]. No associativity."
shared class MeasureOperation(first, size)
        extends BinaryOperation() {
    
    "The first element of the measured range."
    shared Precedence8Expression first;
    "The size of the measured range."
    shared Precedence8Expression size;
    
    "The first element of the measured range."
    see (`value first`)
    shared actual Precedence8Expression leftChild = first;
    "The size of the measured range."
    see (`value size`)
    shared actual Precedence8Expression rightChild = size;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftChild, rightChild];
    
    operator = ":";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMeasureOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is MeasureOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared MeasureOperation copy(Precedence8Expression leftChild = this.leftChild, Precedence8Expression rightChild = this.rightChild) {
        value ret = MeasureOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
