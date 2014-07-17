"A set assignment operation.
 
 Right-associative."
shared abstract class SetAssignmentOperation()
        of IntersectAssignmentOperation | UnionAssignmentOperation | ComplementAssignmentOperation
        extends AssignmentOperation() {
}
