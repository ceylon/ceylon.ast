import ceylon.ast.core {
    InvocationStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement,
        JInvocationExpression=InvocationExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[InvocationStatement]]."
shared InvocationStatement invocationStatementToCeylon(JExpressionStatement invocationStatement) {
    assert (is JInvocationExpression expression = invocationStatement.expression.term);
    return InvocationStatement(invocationToCeylon(expression));
}

"Compiles the given [[code]] for an Invocation Statement
 into an [[InvocationStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared InvocationStatement? compileInvocationStatement(String code) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JInvocationExpression) {
        return invocationStatementToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
