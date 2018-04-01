import ceylon.ast.core {
    AssignmentStatement,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssignmentOp=AssignmentOp,
        JExpressionStatement=ExpressionStatement
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[AssignmentStatement]]."
shared AssignmentStatement assignmentStatementToCeylon(JExpressionStatement assignmentStatement, Anything(JNode, Node) update = noop) {
    assert (is JAssignmentOp expression = assignmentStatement.expression.term);
    value result = AssignmentStatement(assignmentOperationToCeylon(expression, update));
    update(assignmentStatement, result);
    return result;
}

"Parses the given [[code]] for an Assignment Statement
 into an [[AssignmentStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared AssignmentStatement? parseAssignmentStatement(String code, Anything(JNode, Node) update = noop) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JAssignmentOp) {
        return assignmentStatementToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
