"An arithmetic unary negation operation, that is, `-i`.
 
 This operator is defined in terms of [[Invertible.negated]]."
shared class NegationOperation(operand_)
        extends UnaryArithmeticOperation() {
    
    // TODO remove ceylon-compiler#1728 workaround
    Precedence2Expression operand_;
    
    "The negated expression."
    shared actual Precedence2Expression operand = operand_;
    
    shared actual [Precedence2Expression] children = [operand];
    
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
    
    shared NegationOperation copy(Precedence2Expression operand = this.operand) {
        value ret = NegationOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
