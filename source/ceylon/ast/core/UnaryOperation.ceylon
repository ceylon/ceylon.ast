"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation | PrefixOperation | UnaryArithmeticOperation | ExistsOperation | NonemptyOperation | NotOperation
        extends UnaryIshOperation() {
    
    type = null;
    
    shared actual default [ValueExpression] children => [operand];
}
