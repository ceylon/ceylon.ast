import ceylon.ast.core {
    PrefixPostfixStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[PrefixPostfixStatement]]."
shared PrefixPostfixStatement prefixPostfixStatementToCeylon(JExpressionStatement prefixPostfixStatement) {
    assert (is JPrefixOperatorExpression|JPostfixOperatorExpression expression = prefixPostfixStatement.expression.term);
    switch (expression)
    case (is JPrefixOperatorExpression) { return PrefixPostfixStatement(prefixOperationToCeylon(expression)); }
    case (is JPostfixOperatorExpression) { return PrefixPostfixStatement(postfixOperationToCeylon(expression)); }
}

"Compiles the given [[code]] for a Prefix Postfix Statement
 into a [[PrefixPostfixStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared PrefixPostfixStatement? compilePrefixPostfixStatement(String code) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JPrefixOperatorExpression|JPostfixOperatorExpression) {
        return prefixPostfixStatementToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
