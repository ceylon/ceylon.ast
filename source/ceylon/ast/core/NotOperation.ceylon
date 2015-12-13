"A logical not expression.
 
 Right-associative.
 
 Examples:
 
     !n in primes
     !predicate(element)"
shared class NotOperation(operand)
        extends UnaryOperation() {
    
    "The negated expression."
    shared actual NegatingExpression operand;
    
    shared actual [NegatingExpression] children = [operand];
    
    operator = "!";
    
    prefix = true;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNotOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitNotOperation(this);

    shared actual Boolean equals(Object that) {
        if (is NotOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared NotOperation copy(NegatingExpression operand = this.operand) {
        value ret = NotOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
