"An arithmetic operation expression."
shared abstract class ArithmeticOperation()
        of ExponentiationOperation | ProductOperation | QuotientOperation | RemainderOperation
        extends BinaryOperation() {
}
