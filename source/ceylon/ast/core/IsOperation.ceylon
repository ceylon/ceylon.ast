"A postfix assignability test expression.
 
 No associativity.
 
 Examples:
 
     element is String|Integer
     user is ExecutiveUser"
shared class IsOperation(operand_, type_)
        extends UnaryTypeOperation() {
    
    // TODO operand_ and type_ are a workaround for ceylon-compiler#1728, remove!
    ExistsNonemptyExpression operand_;
    Type type_;
    
    "The expression whose type is tested."
    shared actual ExistsNonemptyExpression operand = operand_;
    "The type against which the expression’s type is tested."
    shared actual Type type = type_;
    
    shared actual [ExistsNonemptyExpression, Type] children = [operand, type];
    
    operator = "is";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IsOperation that) {
            return operand == that.operand && type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (operand.hash + 31 * type.hash);
    
    shared IsOperation copy(ExistsNonemptyExpression operand = this.operand, Type type = this.type) {
        value ret = IsOperation(operand, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
