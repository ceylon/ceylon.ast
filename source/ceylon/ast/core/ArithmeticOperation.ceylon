"An arithmetic operation expression."
shared abstract class ArithmeticOperation()
        of ExponentiationOperation | ProductOperation | QuotientOperation | RemainderOperation | SumOperation | DifferenceOperation
        extends BinaryOperation() {
}
