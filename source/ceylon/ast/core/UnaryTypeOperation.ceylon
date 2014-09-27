"A unary type operation.
 
 A subclass of [[UnaryIshOperation]], not [[BinaryOperation]],
 because the second child is a [[type]] rather than a [[ValueExpression]]."
shared abstract class UnaryTypeOperation()
        of IsOperation | OfOperation
        extends UnaryIshOperation() {
    
    shared actual formal ExistsNonemptyExpression operand;
    
    shared actual formal Type type;
    
    prefix = false;
}
