import ceylon.ast.core {
    Node,
    SetAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JComplementAssignOp=ComplementAssignOp,
        JIntersectAssignOp=IntersectAssignOp,
        JUnionAssignOp=UnionAssignOp
    }
}

"Converts a RedHat AST [[BitwiseAssignmentOp|JBitwiseAssignmentOp]] to a `ceylon.ast` [[SetAssignmentOperation]]."
shared SetAssignmentOperation setAssignmentOperationToCeylon(JBitwiseAssignmentOp setAssignmentOperation, Anything(JNode,Node) update = noop) {
    assert (is JIntersectAssignOp|JUnionAssignOp|JComplementAssignOp setAssignmentOperation);
    switch (setAssignmentOperation)
    case (is JIntersectAssignOp) { return intersectAssignmentOperationToCeylon(setAssignmentOperation, update); }
    case (is JUnionAssignOp) { return unionAssignmentOperationToCeylon(setAssignmentOperation, update); }
    case (is JComplementAssignOp) { return complementAssignmentOperationToCeylon(setAssignmentOperation, update); }
}

"Parses the given [[code]] for a Set Assignment Operation
 into a [[SetAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared SetAssignmentOperation? parseSetAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JBitwiseAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return setAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
