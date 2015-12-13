"A divide assignment operation (`/=`).
 
 Right-associative.
 
 Examples:
 
     width /= 2
     amount /= exchangeRate"
see (`class QuotientOperation`)
shared class DivideAssignmentOperation(target, divisor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and dividend / numerator."
    shared ThenElseExpression target;
    "The divisor / denominator."
    shared AssigningExpression divisor;
    
    "The target expression and dividend / numerator."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The divisor / denominator."
    see (`value divisor`)
    shared actual AssigningExpression rightOperand = divisor;
    
    shared actual [ThenElseExpression, AssigningExpression] children = [leftOperand, rightOperand];
    
    operator = "/=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDivideAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitDivideAssignmentOperation(this);

    shared actual Boolean equals(Object that) {
        if (is DivideAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared DivideAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, AssigningExpression rightOperand = this.rightOperand) {
        value ret = DivideAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
