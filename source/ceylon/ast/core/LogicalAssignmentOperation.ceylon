"A logical assignment expression.
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence."
shared abstract class LogicalAssignmentOperation()
        of AndAssignmentOperation | OrAssignmentOperation
        extends AssignmentOperation() {
}
