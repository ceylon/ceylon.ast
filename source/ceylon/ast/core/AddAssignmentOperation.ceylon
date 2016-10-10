"An add assignment operation (`+=`).
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     index += step
     document.cursor.position += insertion.size"
see (`class SumOperation`)
shared class AddAssignmentOperation(target, summand)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and left summand."
    shared ThenElseExpression target;
    "The right summand."
    shared Expression summand;
    
    "The target expression and left summand."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The right summand."
    see (`value summand`)
    shared actual Expression rightOperand = summand;
    
    shared actual [ThenElseExpression, Expression] children = [leftOperand, rightOperand];
    
    operator = "+=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAddAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAddAssignmentOperation(this);

    shared actual Boolean equals(Object that) {
        if (is AddAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AddAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = AddAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
