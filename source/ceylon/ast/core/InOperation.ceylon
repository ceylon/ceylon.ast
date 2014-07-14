"A containment test expression.
 
 Defined via [[Category.contains]]."
shared class InOperation(element, category)
        extends BinaryOperation() {
    
    "The element that’s tested for being in [[category]]."
    shared Precedence10Expression element;
    "The [[Category]] that is tested for containing [[element]]."
    shared Precedence10Expression category;
    
    "The element that’s tested for being in [[category]]."
    see (`value element`)
    shared actual Precedence10Expression leftChild = element;
    "The [[Category]] that is tested for containing [[element]]."
    see (`value category`)
    shared actual Precedence10Expression rightChild = category;
    
    shared actual [Precedence10Expression, Precedence10Expression] children = [leftChild, rightChild];
    
    operator = "in";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is InOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared InOperation copy(Precedence10Expression leftChild = this.leftChild, Precedence10Expression rightChild = this.rightChild) {
        value ret = InOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
