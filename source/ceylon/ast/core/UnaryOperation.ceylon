"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation | PrefixOperation
        extends Operation() {
    
    shared formal Operation|Primary child;
    
    shared actual default [Operation|Primary] children => [child];
}
