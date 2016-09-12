import ceylon.ast.core {
    Node,
    ValueExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpression=Expression,
        JOperatorExpression=OperatorExpression,
        JParExpression=ParExpression,
        JPrimary=Primary,
        JTerm=Term
    }
}

"Converts a RedHat AST [[Term|JTerm]] to a `ceylon.ast` [[ValueExpression]]."
throws (`class AssertionError`, "If the [[term]] does not correspond to a [[ValueExpression]]")
shared ValueExpression valueExpressionToCeylon(JTerm term, Anything(JNode,Node) update = noop) {
    switch (term)
    case (is JPrimary) {
        if (is JExpression term, !term is JParExpression) {
            // a JTerm wrapped in a JExpression
            return valueExpressionToCeylon(term.term, update);
        }
        return primaryToCeylon(term, update);
    }
    case (is JOperatorExpression) {
        return operationToCeylon(term, update);
    }
    else {
        throw AssertionError("Unknown value expression type, or not a value expression");
    }
}

"Parses the given [[code]] for a Value Expression
 into a [[ValueExpression]] using the Ceylon compiler
 (more specifically, the rule for an `expression`)."
shared ValueExpression? parseValueExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jExpression = createParser(code).expression()) {
        return valueExpressionToCeylon(jExpression, update);
    } else {
        return null;
    }
}
