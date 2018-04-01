import ceylon.ast.core {
    LogicalAssignmentOperation,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAndAssignOp=AndAssignOp,
        JLogicalAssignmentOp=LogicalAssignmentOp,
        JOrAssignOp=OrAssignOp
    }
}

"Converts a RedHat AST [[LogicalAssignmentOp|JLogicalAssignmentOp]] to a `ceylon.ast` [[LogicalAssignmentOperation]]."
shared LogicalAssignmentOperation logicalAssignmentOperationToCeylon(JLogicalAssignmentOp logicalAssignmentOperation, Anything(JNode, Node) update = noop) {
    assert (is JAndAssignOp|JOrAssignOp logicalAssignmentOperation);
    switch (logicalAssignmentOperation)
    case (is JAndAssignOp) { return andAssignmentOperationToCeylon(logicalAssignmentOperation, update); }
    case (is JOrAssignOp) { return orAssignmentOperationToCeylon(logicalAssignmentOperation, update); }
}

"Parses the given [[code]] for a Logical Assignment Operation
 into a [[LogicalAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared LogicalAssignmentOperation? parseLogicalAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JLogicalAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return logicalAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
