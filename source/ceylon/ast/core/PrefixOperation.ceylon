"A prefix arithmetic expression, that is, `++i` or `--i` for any [[Primary]] `i`."
shared abstract class PrefixOperation()
        of PrefixIncrementOperation | PrefixDecrementOperation
        extends UnaryOperation() {
    
    prefix = true;
}
