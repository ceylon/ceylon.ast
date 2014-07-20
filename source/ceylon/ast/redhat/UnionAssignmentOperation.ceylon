import ceylon.ast.core {
    Precedence16Expression,
    Precedence18Expression,
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
    assert (is Precedence16Expression left = expressionToCeylon(unionAssignmentOperation.leftTerm),
        is Precedence18Expression right = expressionToCeylon(unionAssignmentOperation.rightTerm));
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
