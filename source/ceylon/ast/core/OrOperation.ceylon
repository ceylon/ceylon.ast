"A logical disjunction expression.
 
 Left-associative.
 
 Examples:
 
     digit == 0 || digit == 1
     element in errors || !element exists"
see (`class OrAssignmentOperation`)
shared class OrOperation(leftOperand_, rightOperand_)
        extends LogicalOperation() {
    
    shared Precedence15Expression leftOperand_;
    shared Precedence14Expression rightOperand_;
    
    shared actual Precedence15Expression leftOperand = leftOperand_;
    shared actual Precedence14Expression rightOperand = rightOperand_;
    
    shared actual [Precedence15Expression, Precedence14Expression] children = [leftOperand, rightOperand];
    
    operator = "||";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOrOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is OrOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared OrOperation copy(Precedence15Expression leftOperand = this.leftOperand, Precedence14Expression rightOperand = this.rightOperand) {
        value ret = OrOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
