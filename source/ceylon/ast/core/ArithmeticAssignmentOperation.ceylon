"An arithmetic assignment operation,
 a shortcut for an [[ArithmeticOperation]] combined with an [[AssignmentOperation]].
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence."
shared abstract class ArithmeticAssignmentOperation()
        of AddAssignmentOperation | SubtractAssignmentOperation | MultiplyAssignmentOperation | DivideAssignmentOperation | RemainderAssignmentOperation
        extends AssignmentOperation() {
}
