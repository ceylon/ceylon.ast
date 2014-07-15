"An of expression.
 
 No associativity."
shared class OfOperation(operand_, type_)
        extends UnaryTypeOperation() {
    
    Precedence10Expression operand_;
    Type type_;
    
    "The expression whose type is narrowed or widened."
    shared actual Precedence10Expression operand = operand_;
    "The covering type to which the expression is narrowed or widened."
    shared actual Type type = type_;
    
    shared actual [Precedence10Expression, Type] children = [operand, type];
    
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
    
    shared OfOperation copy(Precedence10Expression operand = this.operand, Type type = this.type) {
        value ret = OfOperation(operand, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
