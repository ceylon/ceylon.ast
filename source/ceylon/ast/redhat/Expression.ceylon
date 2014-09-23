import ceylon.ast.core {
    Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression,
        JFunctionArgument=FunctionArgument,
        JInvocationExpression=InvocationExpression,
        JOperatorExpression=OperatorExpression,
        JPrimary=Primary,
        JQualifiedMemberExpression=QualifiedMemberExpression,
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
        if (is JInvocationExpression term,
            !term.positionalArgumentList?.mainToken exists && !term.namedArgumentList exists) {
            // operator-style invocation expression
            return operatorStyleInvocationToCeylon(term);
        }
        if (is JQualifiedMemberExpression term,
            !term.memberOperator.mainToken exists) {
            // operator-style member expression
            return operatorStyleMemberExpressionToCeylon(term);
        }
        return valueExpressionToCeylon(term);
    }
    case (is JOperatorExpression) { return operationToCeylon(term); }
    case (is JFunctionArgument) { return functionExpressionToCeylon(term); }
    else {
        throw AssertionError("Other JTerm types not yet implemented");
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
