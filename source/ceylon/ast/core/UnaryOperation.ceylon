"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation | PrefixOperation | UnaryArithmeticOperation | ExistsOperation | NonemptyOperation
        extends UnaryIshOperation() {
    
    type = null;
    
    shared actual default [ValueExpression] children => [child];
}
