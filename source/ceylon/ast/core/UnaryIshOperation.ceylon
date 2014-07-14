"An expression consisting of a [[ValueExpression]], an operator, and possibly a [[Type]].
 
 These can be [[regular unary operations|UnaryOperation]] – either prefix or postfix – or [[unary type operations|UnaryTypeOperation]],
 which are always postfix, and include a type."
shared abstract class UnaryIshOperation()
        of UnaryOperation | UnaryTypeOperation
        extends Operation() {
    
    "The single child expression."
    shared formal ValueExpression child;
    "The type, if any."
    shared formal Type? type;
    
    "[[true]] if this is a prefix unary operator expression
     (the [[operator]] occurs before the [[child]]),
     [[false]] if it’s postfix."
    shared formal Boolean prefix;
    "[[true]] if this is a postfix unary operator expression
     (the [[operator]] occurs after the [[child]]),
     [[false]] if it’s prefix."
    shared Boolean postfix => !prefix;
    
    shared actual formal [ValueExpression, Type=] children;
}
