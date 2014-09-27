"A unary arithmetic expression, that is, `+i` or `-i`."
shared abstract class UnaryArithmeticOperation()
        of IdentityOperation | NegationOperation
        extends UnaryOperation() {
    
    shared actual formal ExponentiatingExpression operand;
    
    shared actual formal [ExponentiatingExpression] children;
    
    prefix = true;
}
