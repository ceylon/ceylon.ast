"A logical assignment expression.
 
 Right-associative."
shared abstract class LogicalAssignmentOperation()
        of AndAssignmentOperation | OrAssignmentOperation
        extends AssignmentOperation() {
}
