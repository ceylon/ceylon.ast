"A “then” operation.
 
 Left-associative.
 
 Examples:
 
     !name.empty then name
     age != -1 then age"
shared class ThenOperation(condition, result)
        extends BinaryOperation() {
    
    "The condition."
    shared ThenElseExpression condition;
    "The result that is produced if [[condition]] evaluates to [[true]]."
    shared DisjoiningExpression result;
    
    "The condition."
    see (`value condition`)
    shared actual ThenElseExpression leftOperand = condition;
    "The result that is produced if [[condition]] evaluates to [[true]]."
    see (`value result`)
    shared actual DisjoiningExpression rightOperand = result;
    
    shared actual [ThenElseExpression, DisjoiningExpression] children = [leftOperand, rightOperand];
    
    operator = "then";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformThenOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitThenOperation(this);

    shared actual Boolean equals(Object that) {
        if (is ThenOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ThenOperation copy(ThenElseExpression leftOperand = this.leftOperand, DisjoiningExpression rightOperand = this.rightOperand) {
        value ret = ThenOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
