"A logical disjunction expression.
 
 Left-associative.
 
 Examples:
 
     digit == 0 || digit == 1
     element in errors || !element exists"
see (`class OrAssignmentOperation`)
shared class OrOperation(leftOperand_, rightOperand_)
        extends LogicalOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    DisjoiningExpression leftOperand_;
    ConjoiningExpression rightOperand_;
    
    shared actual DisjoiningExpression leftOperand = leftOperand_;
    shared actual ConjoiningExpression rightOperand = rightOperand_;
    
    shared actual [DisjoiningExpression, ConjoiningExpression] children = [leftOperand, rightOperand];
    
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
    
    shared OrOperation copy(DisjoiningExpression leftOperand = this.leftOperand, ConjoiningExpression rightOperand = this.rightOperand) {
        value ret = OrOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
