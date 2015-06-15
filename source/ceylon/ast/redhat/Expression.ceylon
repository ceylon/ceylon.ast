import ceylon.ast.core {
    Expression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpression=Expression,
        JFunctionArgument=FunctionArgument,
        JIfExpression=IfExpression,
        JLetExpression=LetExpression,
        JOperatorExpression=OperatorExpression,
        JPrimary=Primary,
        JSwitchExpression=SwitchExpression,
        JTerm=Term
    }
}

"Converts a RedHat AST [[Term|JTerm]] to a `ceylon.ast` [[Expression]]."
shared Expression expressionToCeylon(JTerm term, Anything(JNode,Node) update = noop) {
    switch (term)
    case (is JPrimary) {
        if (is JExpression term, !term.mainToken exists) {
            // a JTerm wrapped in a JExpression
            return expressionToCeylon(term.term, update);
        }
        return valueExpressionToCeylon(term, update);
    }
    case (is JOperatorExpression) { return operationToCeylon(term, update); }
    case (is JFunctionArgument) { return functionExpressionToCeylon(term, update); }
    case (is JLetExpression) { return letExpressionToCeylon(term, update); }
    case (is JIfExpression|JSwitchExpression) { return conditionalExpressionToCeylon(term, update); }
    else {
        throw AssertionError("Unknown term type!");
    }
}

"Compiles the given [[code]] for an Expression
 into an [[Expression]] using the Ceylon compiler
 (more specifically, the rule for a `functionOrExpression`)."
shared Expression? compileExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jFunctionOrExpression = createParser(code).functionOrExpression()) {
        return expressionToCeylon(jFunctionOrExpression, update);
    } else {
        return null;
    }
}
