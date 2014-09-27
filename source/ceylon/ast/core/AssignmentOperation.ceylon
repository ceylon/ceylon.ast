"An assignment expression.
 
 Right-associative.
 
 This is the abstract superclass of all assignment operations, with operators like `=`, `+=`, `&=`, etc.
 Not to be confused with [[AssignOperation]], the concrete class for `=` expressions!"
shared abstract class AssignmentOperation()
        of AssignOperation | ArithmeticAssignmentOperation | SetAssignmentOperation | LogicalAssignmentOperation
        extends BinaryOperation() {
    
    "The target expression."
    shared actual formal ThenElseExpression leftOperand;
    shared actual formal AssigningExpression rightOperand;
    
    shared actual formal [ThenElseExpression, AssigningExpression] children;
}
