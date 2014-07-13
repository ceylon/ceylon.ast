"A unary operator expression."
shared abstract class UnaryOperation()
        of PostfixOperation | PrefixOperation | UnaryArithmeticOperation
        extends Operation() {
    
    shared formal ValueExpression child;
    
    "[[true]] if this is a prefix unary operator expression
     (the [[operator]] occurs before the [[child]]),
     [[false]] if it’s postfix."
    shared formal Boolean prefix;
    "[[true]] if this is a postfix unary operator expression
     (the [[operator]] occurs after the [[child]]),
     [[false]] if it’s prefix."
    shared Boolean postfix => !prefix;
    
    shared actual default [ValueExpression] children => [child];
}
