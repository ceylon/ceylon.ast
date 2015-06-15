import ceylon.ast.core {
    InvocationStatement,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpressionStatement=ExpressionStatement,
        JInvocationExpression=InvocationExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[InvocationStatement]]."
shared InvocationStatement invocationStatementToCeylon(JExpressionStatement invocationStatement, Anything(JNode,Node) update = noop) {
    assert (is JInvocationExpression expression = invocationStatement.expression.term);
    value result = InvocationStatement(invocationToCeylon(expression, update));
    update(invocationStatement, result);
    return result;
}

"Compiles the given [[code]] for an Invocation Statement
 into an [[InvocationStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared InvocationStatement? compileInvocationStatement(String code, Anything(JNode,Node) update = noop) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JInvocationExpression) {
        return invocationStatementToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
