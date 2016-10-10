"A set assignment operation.
 
 Right-associative. Any expression may appear on the right-hand side, regardless of precedence."
shared abstract class SetAssignmentOperation()
        of IntersectAssignmentOperation | UnionAssignmentOperation | ComplementAssignmentOperation
        extends AssignmentOperation() {
}
