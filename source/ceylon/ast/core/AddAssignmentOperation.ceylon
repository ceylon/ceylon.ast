"An add assignment operation (`+=`).
 
 Right-associative.
 
 Examples:
 
     index += step
     document.cursor.position += insertion.size"
see (`class SumOperation`)
shared class AddAssignmentOperation(target, summand)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and left summand."
    shared Precedence16Expression target;
    "The right summand."
    shared Precedence18Expression summand;
    
    "The target expression and left summand."
    see (`value target`)
    shared actual Precedence16Expression leftOperand = target;
    "The right summand."
    see (`value summand`)
    shared actual Precedence18Expression rightOperand = summand;
    
    shared actual [Precedence16Expression, Precedence18Expression] children = [leftOperand, rightOperand];
    
    operator = "+=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAddAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is AddAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared AddAssignmentOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence18Expression rightOperand = this.rightOperand) {
        value ret = AddAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
