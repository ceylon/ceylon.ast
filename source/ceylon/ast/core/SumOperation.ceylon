"A sum expression.
 
 Defined via [[Summable.plus]]. Left-associative."
shared class SumOperation(leftSummand, rightSummand)
        extends ArithmeticOperation() {
    
    "The left summand."
    shared Precedence8Expression leftSummand;
    "The right summand."
    shared Precedence7Expression rightSummand;
    
    "The left summand."
    see (`value leftSummand`)
    shared actual Precedence8Expression leftChild = leftSummand;
    "The right summand."
    see (`value rightSummand`)
    shared actual Precedence7Expression rightChild = rightSummand;
    
    shared actual [Precedence8Expression, Precedence7Expression] children = [leftChild, rightChild];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSumOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SumOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared SumOperation copy(Precedence8Expression leftChild = this.leftChild, Precedence7Expression rightChild = this.rightChild) {
        value ret = SumOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
