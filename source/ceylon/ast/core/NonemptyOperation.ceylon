"A nonempty postfix expression.
 
 No associativity."
shared class NonemptyOperation(operand)
        extends UnaryOperation() {
    
    "The operand expression whose nonemptiness is tested."
    shared actual SpanningExpression operand;
    
    shared actual [SpanningExpression] children = [operand];
    
    operator = "nonempty";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitNonemptyOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared NonemptyOperation copy(SpanningExpression operand = this.operand) {
        value ret = NonemptyOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
