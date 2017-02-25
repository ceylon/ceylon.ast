"The expression `+i`.
 
 This expression is defined to return `i` for any `i` of [[Invertible]] type.
 
 (Not to be confused with [[IdenticalOperation]], `i === i`.)"
shared class IdentityOperation(operand)
        extends UnaryArithmeticOperation() {
    
    "The inner expression."
    shared actual ExponentiatingExpression operand;
    
    shared actual [ExponentiatingExpression] children = [operand];
    
    operator = "+";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIdentityOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIdentityOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IdentityOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared IdentityOperation copy(ExponentiatingExpression operand = this.operand) {
        value ret = IdentityOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
