"A measured range expression.
 
 Defined via [[measure]]. No associativity.
 
 Examples:
 
     0:size
     today:14"
shared class MeasureOperation(first, size)
        extends BinaryOperation() {
    
    "The first element of the measured range."
    shared AddingExpression first;
    "The size of the measured range."
    shared AddingExpression size;
    
    "The first element of the measured range."
    see (`value first`)
    shared actual AddingExpression leftOperand = first;
    "The size of the measured range."
    see (`value size`)
    shared actual AddingExpression rightOperand = size;
    
    shared actual [AddingExpression, AddingExpression] children = [leftOperand, rightOperand];
    
    operator = ":";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMeasureOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMeasureOperation(this);

    shared actual Boolean equals(Object that) {
        if (is MeasureOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared MeasureOperation copy(AddingExpression leftOperand = this.leftOperand, AddingExpression rightOperand = this.rightOperand) {
        value ret = MeasureOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
