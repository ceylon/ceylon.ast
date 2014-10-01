"A coverage expression.
 
 Narrows or widens the type of an expression to another type that *covers* the expression type.
 
 Defined natively. No associativity.
 
 Examples:
 
     thing of Object?
     component.parent of Container?"
shared class OfOperation(operand, type)
        extends UnaryTypeOperation() {
    
    "The expression whose type is narrowed or widened."
    shared actual ExistsNonemptyExpression operand;
    "The covering type to which the expression is narrowed or widened."
    shared actual Type type;
    
    shared actual [ExistsNonemptyExpression, Type] children = [operand, type];
    
    operator = "of";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOfOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is OfOperation that) {
            return operand == that.operand && type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (operand.hash + 31 * type.hash);
    
    shared OfOperation copy(ExistsNonemptyExpression operand = this.operand, Type type = this.type) {
        value ret = OfOperation(operand, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
