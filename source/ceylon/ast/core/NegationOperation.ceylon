"An arithmetic unary negation operation, that is, `-i`.
 
 This operator is defined in terms of [[Invertible.negated]]."
shared class NegationOperation(operand_)
        extends UnaryArithmeticOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    ExponentiatingExpression operand_;
    
    "The negated expression."
    shared actual ExponentiatingExpression operand = operand_;
    
    shared actual [ExponentiatingExpression] children = [operand];
    
    operator = "-";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNegationOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is NegationOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared NegationOperation copy(ExponentiatingExpression operand = this.operand) {
        value ret = NegationOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
