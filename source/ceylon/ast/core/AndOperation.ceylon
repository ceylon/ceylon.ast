"A logical conjunction expression.
 
 Left-associative.
 
 Examples:
 
     i%2 == 0 && j%2 == 1
     attr1 == that.attr1 && attr2 == that.attr2 && attr3 == that.attr3"
shared class AndOperation(leftOperand_, rightOperand_)
        extends LogicalOperation() {
    
    shared Precedence14Expression leftOperand_;
    shared Precedence13Expression rightOperand_;
    
    shared actual Precedence14Expression leftOperand = leftOperand_;
    shared actual Precedence13Expression rightOperand = rightOperand_;
    
    shared actual [Precedence14Expression, Precedence13Expression] children = [leftOperand, rightOperand];
    
    operator = "&&";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAndOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is AndOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AndOperation copy(Precedence14Expression leftOperand = this.leftOperand, Precedence13Expression rightOperand = this.rightOperand) {
        value ret = AndOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
