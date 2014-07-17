"An assignment expression.
 
 Right-associative.
 
 This is the abstract superclass of all assignment operations, with operators like `=`, `+=`, `&=`, etc.
 Not to be confused with [[AssignOperation]], the concrete class for `=` expressions!"
shared abstract class AssignmentOperation()
        of AssignOperation | ArithmeticAssignmentOperation | SetAssignmentOperation | LogicalAssignmentOperation
        extends BinaryOperation() {
    
    "The target expression."
    shared actual formal Precedence16Expression leftOperand;
    shared actual formal Precedence17Expression rightOperand;
    
    shared actual formal [Precedence16Expression, Precedence17Expression] children;
}
