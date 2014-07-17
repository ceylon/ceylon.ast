import ceylon.ast.core {
    SetAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JComplementAssignOp=ComplementAssignOp,
        JIntersectAssignOp=IntersectAssignOp,
        JUnionAssignOp=UnionAssignOp
    }
}

"Converts a RedHat AST [[BitwiseAssignmentOp|JBitwiseAssignmentOp]] to a `ceylon.ast` [[SetAssignmentOperation]]."
shared SetAssignmentOperation setAssignmentOperationToCeylon(JBitwiseAssignmentOp setAssignmentOperation) {
    assert (is JIntersectAssignOp|JUnionAssignOp|JComplementAssignOp setAssignmentOperation);
    switch (setAssignmentOperation)
    case (is JIntersectAssignOp) { return intersectAssignmentOperationToCeylon(setAssignmentOperation); }
    case (is JUnionAssignOp) { return unionAssignmentOperationToCeylon(setAssignmentOperation); }
    case (is JComplementAssignOp) { return complementAssignmentOperationToCeylon(setAssignmentOperation); }
}

"Compiles the given [[code]] for a Set Assignment Operation
 into a [[SetAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared SetAssignmentOperation? compileSetAssignmentOperation(String code) {
    if (is JBitwiseAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return setAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
