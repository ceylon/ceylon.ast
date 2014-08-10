import ceylon.ast.core {
    ValueExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression,
        JOperatorExpression=OperatorExpression,
        JPrimary=Primary,
        JTerm=Term
    }
}

"Converts a RedHat AST [[Term|JTerm]] to a `ceylon.ast` [[ValueExpression]]."
throws (`class AssertionError`, "If the [[term]] does not correspond to a [[ValueExpression]]")
shared ValueExpression valueExpressionToCeylon(JTerm term) {
    switch (term)
    case (is JPrimary) {
        if (is JExpression term, !term.mainToken exists) {
            // a JTerm wrapped in a JExpression
            return valueExpressionToCeylon(term.term);
        }
        return primaryToCeylon(term);
    }
    case (is JOperatorExpression) {
        return operationToCeylon(term);
    }
    else {
        throw AssertionError("Unknown value expression type, or not a value expression");
    }
}

"Compiles the given [[code]] for a Value Expression
 into a [[ValueExpression]] using the Ceylon compiler
 (more specifically, the rule for an `expression`)."
shared ValueExpression? compileValueExpression(String code) {
    if (exists jExpression = createParser(code).expression()) {
        return valueExpressionToCeylon(jExpression);
    } else {
        return null;
    }
}
