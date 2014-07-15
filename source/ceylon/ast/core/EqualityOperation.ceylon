"An expression to test for identity or (in)equality of two objects.
 
 This is the abstract superclass of the nodes for `==`, `!=`, `===`;
 not to be confused with [[EqualOperation]], the concrete class for `==`!"
shared abstract class EqualityOperation()
        of EqualOperation | NotEqualOperation | IdenticalOperation
        extends BinaryOperation() {
    
    "The left operand to be tested."
    shared actual formal Precedence11Expression leftChild;
    "The right operand to be tested."
    shared actual formal Precedence11Expression rightChild;
    
    shared actual formal [Precedence11Expression, Precedence11Expression] children;
}
