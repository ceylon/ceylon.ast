import ceylon.ast.core {
    ThenElseExpression,
    AssigningExpression,
    UnionAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionAssignOp=UnionAssignOp
    }
}

"Converts a RedHat AST [[UnionAssignOp|JUnionAssignOp]] to a `ceylon.ast` [[UnionAssignmentOperation]]."
shared UnionAssignmentOperation unionAssignmentOperationToCeylon(JUnionAssignOp unionAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(unionAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(unionAssignmentOperation.rightTerm));
    return UnionAssignmentOperation(left, right);
}

"Compiles the given [[code]] for an Union Assignment Operation
 into an [[UnionAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared UnionAssignmentOperation? compileUnionAssignmentOperation(String code) {
    if (is JUnionAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return unionAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
