"An “else” operation.
 
 Left-associative.
 
 Examples:
 
     0 <= val <= 10 then priority(val) else invalid
     parseInteger(input) else 0"
shared class ElseOperation(optionalValue, defaultValue)
        extends BinaryOperation() {
    
    "The optional value whose existence is tested."
    shared Precedence16Expression optionalValue;
    "The default value that is used if [[optionalValue]] is [[null]]."
    shared Precedence15Expression defaultValue;
    
    "The optional value whose existence is tested."
    see (`value optionalValue`)
    shared actual Precedence16Expression leftOperand = optionalValue;
    "The default value that is used if [[optionalValue]] is [[null]]."
    see (`value defaultValue`)
    shared actual Precedence15Expression rightOperand = defaultValue;
    
    shared actual [Precedence16Expression, Precedence15Expression] children = [leftOperand, rightOperand];
    
    operator = "else";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformElseOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ElseOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ElseOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence15Expression rightOperand = this.rightOperand) {
        value ret = ElseOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
