import ceylon.ast.core {
    AssignmentStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignmentOp=AssignmentOp,
        JExpressionStatement=ExpressionStatement
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[AssignmentStatement]]."
shared AssignmentStatement assignmentStatementToCeylon(JExpressionStatement assignmentStatement) {
    assert (is JAssignmentOp expression = assignmentStatement.expression.term);
    return AssignmentStatement(assignmentOperationToCeylon(expression));
}

"Compiles the given [[code]] for an Assignment Statement
 into an [[AssignmentStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared AssignmentStatement? compileAssignmentStatement(String code) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JAssignmentOp) {
        return assignmentStatementToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
