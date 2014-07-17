import ceylon.ast.core {
    LogicalAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndAssignOp=AndAssignOp,
        JLogicalAssignmentOp=LogicalAssignmentOp,
        JOrAssignOp=OrAssignOp
    }
}

"Converts a RedHat AST [[LogicalAssignmentOp|JLogicalAssignmentOp]] to a `ceylon.ast` [[LogicalAssignmentOperation]]."
shared LogicalAssignmentOperation logicalAssignmentOperationToCeylon(JLogicalAssignmentOp logicalAssignmentOperation) {
    assert (is JAndAssignOp|JOrAssignOp logicalAssignmentOperation);
    switch (logicalAssignmentOperation)
    case (is JAndAssignOp) { return andAssignmentOperationToCeylon(logicalAssignmentOperation); }
    case (is JOrAssignOp) { return orAssignmentOperationToCeylon(logicalAssignmentOperation); }
}

"Compiles the given [[code]] for a Logical Assignment Operation
 into a [[LogicalAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared LogicalAssignmentOperation? compileLogicalAssignmentOperation(String code) {
    if (is JLogicalAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return logicalAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
