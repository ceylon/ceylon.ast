import ceylon.ast.core {
    ExpressionStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignmentOp=AssignmentOp,
        JExpressionStatement=ExpressionStatement,
        JInvocationExpression=InvocationExpression,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[ExpressionStatement]]."
shared ExpressionStatement expressionStatementToCeylon(JExpressionStatement expressionStatement) {
    assert (is JAssignmentOp|JPrefixOperatorExpression|JPostfixOperatorExpression|JInvocationExpression expression = expressionStatement.expression.term);
    switch (expression)
    case (is JAssignmentOp) { return assignmentStatementToCeylon(expressionStatement); }
    case (is JPrefixOperatorExpression|JPostfixOperatorExpression) { return prefixPostfixStatementToCeylon(expressionStatement); }
    case (is JInvocationExpression) { return invocationStatementToCeylon(expressionStatement); }
}

"Compiles the given [[code]] for an Expression Statement
 into an [[ExpressionStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared ExpressionStatement? compileExpressionStatement(String code) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return expressionStatementToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
