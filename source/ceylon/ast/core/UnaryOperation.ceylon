"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation
        extends Operation() {
    
    shared formal Operation|Primary child;
    
    shared actual [Operation|Primary] children => [child];
}
