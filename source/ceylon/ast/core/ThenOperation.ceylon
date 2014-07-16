"A “then” operation.
 
 Left-associative.
 
 Examples:
 
     !name.empty then name
     age != -1 then age"
shared class ThenOperation(condition, result)
        extends BinaryOperation() {
    
    "The condition."
    shared Precedence16Expression condition;
    "The result that is produced if [[condition]] evaluates to [[true]]."
    shared Precedence15Expression result;
    
    "The condition."
    see (`value condition`)
    shared actual Precedence16Expression leftOperand = condition;
    "The result that is produced if [[condition]] evaluates to [[true]]."
    see (`value result`)
    shared actual Precedence15Expression rightOperand = result;
    
    shared actual [Precedence16Expression, Precedence15Expression] children = [leftOperand, rightOperand];
    
    operator = "then";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformThenOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ThenOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ThenOperation copy(Precedence16Expression leftOperand = this.leftOperand, Precedence15Expression rightOperand = this.rightOperand) {
        value ret = ThenOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
