"A multiply assignment operation (`*=`).
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     balance *= 1 + interestRate"
shared class MultiplyAssignmentOperation(target, factor)
        extends ArithmeticAssignmentOperation() {
    
    "The target expression and left factor."
    shared ThenElseExpression target;
    "The right factor."
    shared Expression factor;
    
    "The target expression and left factor."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The right factor."
    see (`value factor`)
    shared actual Expression rightOperand = factor;
    
    shared actual [ThenElseExpression, Expression] children = [leftOperand, rightOperand];
    
    operator = "*=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMultiplyAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMultiplyAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is MultiplyAssignmentOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared MultiplyAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = MultiplyAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
