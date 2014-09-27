"A difference expression.
 
 Defined via [[Invertible.minus]]. Left-associative.
 
 Examples:
 
     size - 1
     lastIndex - firstIndex"
see (`class SubtractAssignmentOperation`)
shared class DifferenceOperation(minuend, subtrahend)
        extends ArithmeticOperation() {
    
    "The minuend (the `a` in `a - b`)."
    shared AddingExpression minuend;
    "The subtrahend (the `b` in `a -b`)."
    shared ScalingExpression subtrahend;
    
    "The minuend (the `a` in `a - b`)."
    see (`value minuend`)
    shared actual AddingExpression leftOperand = minuend;
    "The subtrahend (the `b` in `a -b`)."
    see (`value subtrahend`)
    shared actual ScalingExpression rightOperand = subtrahend;
    
    shared actual [AddingExpression, ScalingExpression] children = [leftOperand, rightOperand];
    
    operator = "-";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDifferenceOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is DifferenceOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared DifferenceOperation copy(AddingExpression leftOperand = this.leftOperand, ScalingExpression rightOperand = this.rightOperand) {
        value ret = DifferenceOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
