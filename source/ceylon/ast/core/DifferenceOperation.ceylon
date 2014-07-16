"A difference expression.
 
 Defined via [[Invertible.minus]]. Left-associative.
 
 Examples:
 
     size - 1
     lastIndex - firstIndex"
shared class DifferenceOperation(minuend, subtrahend)
        extends ArithmeticOperation() {
    
    "The minuend (the `a` in `a - b`)."
    shared Precedence8Expression minuend;
    "The subtrahend (the `b` in `a -b`)."
    shared Precedence7Expression subtrahend;
    
    "The minuend (the `a` in `a - b`)."
    see (`value minuend`)
    shared actual Precedence8Expression leftOperand = minuend;
    "The subtrahend (the `b` in `a -b`)."
    see (`value subtrahend`)
    shared actual Precedence7Expression rightOperand = subtrahend;
    
    shared actual [Precedence8Expression, Precedence7Expression] children = [leftOperand, rightOperand];
    
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
    
    shared DifferenceOperation copy(Precedence8Expression leftOperand = this.leftOperand, Precedence7Expression rightOperand = this.rightOperand) {
        value ret = DifferenceOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
