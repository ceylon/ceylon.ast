"An arithmetic assignment operation,
 a shortcut for an [[ArithmeticOperation]] combined with an [[AssignmentOperation]].
 
 Right-associative."
shared abstract class ArithmeticAssignmentOperation()
        of AddAssignmentOperation | SubtractAssignmentOperation | MultiplyAssignmentOperation | DivideAssignmentOperation | RemainderAssignmentOperation
        extends AssignmentOperation() {
    
    shared actual formal [Precedence16Expression, Precedence17Expression] children;
}
