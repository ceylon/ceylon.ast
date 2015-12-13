"An “else” operation.
 
 Left-associative.
 
 Examples:
 
     0 <= val <= 10 then priority(val) else invalid
     parseInteger(input) else 0"
shared class ElseOperation(optionalValue, defaultValue)
        extends BinaryOperation() {
    
    "The optional value whose existence is tested."
    shared ThenElseExpression optionalValue;
    "The default value that is used if [[optionalValue]] is [[null]]."
    shared DisjoiningExpression defaultValue;
    
    "The optional value whose existence is tested."
    see (`value optionalValue`)
    shared actual ThenElseExpression leftOperand = optionalValue;
    "The default value that is used if [[optionalValue]] is [[null]]."
    see (`value defaultValue`)
    shared actual DisjoiningExpression rightOperand = defaultValue;
    
    shared actual [ThenElseExpression, DisjoiningExpression] children = [leftOperand, rightOperand];
    
    operator = "else";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformElseOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitElseOperation(this);

    shared actual Boolean equals(Object that) {
        if (is ElseOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ElseOperation copy(ThenElseExpression leftOperand = this.leftOperand, DisjoiningExpression rightOperand = this.rightOperand) {
        value ret = ElseOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
