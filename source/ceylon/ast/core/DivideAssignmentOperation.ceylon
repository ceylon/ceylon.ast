"A divide assignment operation (`/=`).
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     width /= 2
     amount /= exchangeRate"
see (`class QuotientOperation`)
shared class DivideAssignmentOperation(target, divisor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and dividend / numerator."
    shared ThenElseExpression target;
    "The divisor / denominator."
    shared Expression divisor;
    
    "The target expression and dividend / numerator."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The divisor / denominator."
    see (`value divisor`)
    shared actual Expression rightOperand = divisor;
    
    shared actual [ThenElseExpression, Expression] children = [leftOperand, rightOperand];
    
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
    
    shared DivideAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = DivideAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
