"A logical binary operation expression."
shared abstract class LogicalOperation()
        of AndOperation | OrOperation
        extends BinaryOperation() {
    
    shared actual formal Precedence15Expression leftOperand;
    shared actual formal Precedence14Expression rightOperand;
    
    shared actual formal [Precedence15Expression, Precedence14Expression] children;
}
