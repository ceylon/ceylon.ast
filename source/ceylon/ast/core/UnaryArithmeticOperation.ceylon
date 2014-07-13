"A unary arithmetic expression, that is, `+i` or `-i`."
shared abstract class UnaryArithmeticOperation()
        of IdentityOperation | NegationOperation
        extends UnaryOperation() {
    
    shared actual formal Precedence2Expression child;
    
    shared actual formal [Precedence2Expression] children;
    
    prefix = true;
}
