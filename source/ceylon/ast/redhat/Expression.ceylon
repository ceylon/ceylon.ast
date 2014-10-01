import ceylon.ast.core {
    Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression,
        JFunctionArgument=FunctionArgument,
        JOperatorExpression=OperatorExpression,
        JPrimary=Primary,
        JTerm=Term
    }
}

"Converts a RedHat AST [[Term|JTerm]] to a `ceylon.ast` [[Expression]]."
shared Expression expressionToCeylon(JTerm term) {
    switch (term)
    case (is JPrimary) {
        if (is JExpression term, !term.mainToken exists) {
            // a JTerm wrapped in a JExpression
            return expressionToCeylon(term.term);
        }
        return valueExpressionToCeylon(term);
    }
    case (is JOperatorExpression) { return operationToCeylon(term); }
    case (is JFunctionArgument) { return functionExpressionToCeylon(term); }
    else {
        throw AssertionError("Unknown term type!");
    }
}

"Compiles the given [[code]] for an Expression
 into an [[Expression]] using the Ceylon compiler
 (more specifically, the rule for a `functionOrExpression`)."
shared Expression? compileExpression(String code) {
    if (exists jFunctionOrExpression = createParser(code).functionOrExpression()) {
        return expressionToCeylon(jFunctionOrExpression);
    } else {
        return null;
    }
}
