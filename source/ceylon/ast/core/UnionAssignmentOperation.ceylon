"A union assignment operation.
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 Examples:
 
     students |= course.students
     allElements |= elements"
see (`class UnionOperation`)
shared class UnionAssignmentOperation(target, other)
        extends SetAssignmentOperation() {
    
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
    
    operator = "|=";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnionAssignmentOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitUnionAssignmentOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is UnionAssignmentOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared UnionAssignmentOperation copy(ThenElseExpression leftOperand = this.leftOperand, Expression rightOperand = this.rightOperand) {
        value ret = UnionAssignmentOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
