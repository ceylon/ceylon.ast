"A spanned range expression.
 
 Defined via [[span]]. No associativity.
 
 Examples:
 
    0..9
    monday..friday
    first.successor..last.predecessor"
shared class SpanOperation(first, last)
        extends BinaryOperation() {
    
    "The first element of the spanned range."
    shared Precedence8Expression first;
    "The last element of the spanned range."
    shared Precedence8Expression last;
    
    "The first element of the spanned range."
    see (`value first`)
    shared actual Precedence8Expression leftOperand = first;
    "The last element of the spanned range."
    see (`value last`)
    shared actual Precedence8Expression rightOperand = last;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftOperand, rightOperand];
    
    operator = "..";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpanOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared SpanOperation copy(Precedence8Expression leftOperand = this.leftOperand, Precedence8Expression rightOperand = this.rightOperand) {
        value ret = SpanOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
