"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation | PrefixOperation | UnaryArithmeticOperation
        extends Operation() {
    
    shared formal ValueExpression child;
    
    shared actual default [ValueExpression] children => [child];
}
