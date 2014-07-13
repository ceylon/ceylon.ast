"A postfix arithmetic expression, that is, `i++` or `i--` for any [[Primary]] `i`."
shared abstract class PostfixOperation()
        of PostfixIncrementOperation | PostfixDecrementOperation
        extends UnaryOperation() {
    
    "The incremented or decremented primary."
    shared actual formal Primary child;
    
    prefix = false;
}
