"A logical binary operation expression."
shared abstract class LogicalOperation()
        of AndOperation | OrOperation
        extends BinaryOperation() {
    
    shared actual formal DisjoiningExpression leftOperand;
    shared actual formal ConjoiningExpression rightOperand;
    
    shared actual formal [DisjoiningExpression, ConjoiningExpression] children;
}
