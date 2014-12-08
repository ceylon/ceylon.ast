import ceylon.ast.core {
    ConditionalExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression
    }
}

"Converts a RedHat AST [[IfExpression|JIfExpression]] to a `ceylon.ast` [[ConditionalExpression]]."
shared ConditionalExpression conditionalExpressionToCeylon(JIfExpression conditionalExpression) {
    switch (conditionalExpression)
    case (is JIfExpression) { return ifElseExpressionToCeylon(conditionalExpression); }
    // TODO switch expressions
}

"Compiles the given [[code]] for an Any Specifier
 into a [[ConditionalExpression]] using the Ceylon compiler
 (more specifically, the rule for a `conditionalExpression`)."
shared ConditionalExpression? compileConditionalExpression(String code) {
    if (exists jConditionalExpression = createParser(code).conditionalExpression()) {
        assert (is JIfExpression jConditionalExpression);
        return conditionalExpressionToCeylon(jConditionalExpression);
    } else {
        return null;
    }
}
