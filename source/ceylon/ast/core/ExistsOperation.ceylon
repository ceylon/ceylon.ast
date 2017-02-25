"A postfix existence test expression.
 
 No associativity.
 
 Examples:
 
     element exists
     parseInteger(text) exists"
shared class ExistsOperation(operand)
        extends UnaryOperation() {
    
    "The operand expression whose existence is tested."
    shared actual SpanningExpression operand;
    
    shared actual [SpanningExpression] children = [operand];
    
    operator = "exists";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitExistsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared ExistsOperation copy(SpanningExpression operand = this.operand) {
        value ret = ExistsOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
