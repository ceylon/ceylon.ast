"A spanned range expression.
 
 Defined via [[span]]. No associativity.
 
 Examples:
 
    0..9
    monday..friday
    first.successor..last.predecessor"
shared class SpanOperation(first, last)
        extends BinaryOperation() {
    
    "The first element of the spanned range."
    shared AddingExpression first;
    "The last element of the spanned range."
    shared AddingExpression last;
    
    "The first element of the spanned range."
    see (`value first`)
    shared actual AddingExpression leftOperand = first;
    "The last element of the spanned range."
    see (`value last`)
    shared actual AddingExpression rightOperand = last;
    
    shared actual [AddingExpression, AddingExpression] children = [leftOperand, rightOperand];
    
    operator = "..";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpanOperation(this);

    shared actual Boolean equals(Object that) {
        if (is SpanOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SpanOperation copy(AddingExpression leftOperand = this.leftOperand, AddingExpression rightOperand = this.rightOperand) {
        value ret = SpanOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
