"A measured range expression.
 
 Defined via [[measure]]. No associativity.
 
 Examples:
 
     0:size
     today:14"
shared class MeasureOperation(first, size)
        extends BinaryOperation() {
    
    "The first element of the measured range."
    shared Precedence8Expression first;
    "The size of the measured range."
    shared Precedence8Expression size;
    
    "The first element of the measured range."
    see (`value first`)
    shared actual Precedence8Expression leftOperand = first;
    "The size of the measured range."
    see (`value size`)
    shared actual Precedence8Expression rightOperand = size;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftOperand, rightOperand];
    
    operator = ":";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMeasureOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is MeasureOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared MeasureOperation copy(Precedence8Expression leftOperand = this.leftOperand, Precedence8Expression rightOperand = this.rightOperand) {
        value ret = MeasureOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
