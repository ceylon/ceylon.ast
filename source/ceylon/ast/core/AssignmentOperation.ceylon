"An assignment expression.
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence.
 
 This is the abstract superclass of all assignment operations, with operators like `=`, `+=`, `&=`, etc.
 Not to be confused with [[AssignOperation]], the concrete class for `=` expressions!"
shared abstract class AssignmentOperation()
        of AssignOperation | ArithmeticAssignmentOperation | SetAssignmentOperation | LogicalAssignmentOperation
        extends BinaryOperation() {
    
    "The target expression."
    shared actual formal ThenElseExpression leftOperand;
    shared actual formal Expression rightOperand;
    
    shared actual formal [ThenElseExpression, Expression] children;
}
