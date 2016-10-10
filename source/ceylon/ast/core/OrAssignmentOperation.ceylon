"A logical disjunction assignment expression.
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     permitted ||= backdoorTriggered
     canPrint ||= networkPrinterPresent"
see (`class OrOperation`)
shared class OrAssignmentOperation(target, other)
        extends LogicalAssignmentOperation() {
    
    "The target expression and left operand."
    shared ThenElseExpression target;
    "The right operand."
    shared Expression other;
    
    "The target expression and left operand."
    see (`value target`)
    shared actual ThenElseExpression leftOperand = target;
    "The right operand."
    see (`value other`)
    shared actual Expression rightOperand = other;
    
    shared actual [ThenElseExpression, Expression] children = [leftOperand, rightOperand];
    
    operator = "||=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOrAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitOrAssignmentOperation(this);

    shared actual Boolean equals(Object that) {
        if (is OrAssignmentOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared OrAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = OrAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
