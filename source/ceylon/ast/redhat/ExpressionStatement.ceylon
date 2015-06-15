import ceylon.ast.core {
    ExpressionStatement,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssignmentOp=AssignmentOp,
        JExpressionStatement=ExpressionStatement,
        JInvocationExpression=InvocationExpression,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[ExpressionStatement]]."
shared ExpressionStatement expressionStatementToCeylon(JExpressionStatement expressionStatement, Anything(JNode,Node) update = noop) {
    assert (is JAssignmentOp|JPrefixOperatorExpression|JPostfixOperatorExpression|JInvocationExpression expression = expressionStatement.expression.term);
    switch (expression)
    case (is JAssignmentOp) { return assignmentStatementToCeylon(expressionStatement, update); }
    case (is JPrefixOperatorExpression|JPostfixOperatorExpression) { return prefixPostfixStatementToCeylon(expressionStatement, update); }
    case (is JInvocationExpression) { return invocationStatementToCeylon(expressionStatement, update); }
}

"Compiles the given [[code]] for an Expression Statement
 into an [[ExpressionStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared ExpressionStatement? compileExpressionStatement(String code, Anything(JNode,Node) update = noop) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return expressionStatementToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
