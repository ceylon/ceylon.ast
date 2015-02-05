import ceylon.ast.core {
    ConditionalExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression,
        JSwitchExpression=SwitchExpression
    }
}

"Converts a RedHat AST [[IfExpression|JIfExpression]] or [[SwitchExpression|JSwitchExpression]] to a `ceylon.ast` [[ConditionalExpression]]."
shared ConditionalExpression conditionalExpressionToCeylon(JIfExpression|JSwitchExpression conditionalExpression) {
    switch (conditionalExpression)
    case (is JIfExpression) { return ifElseExpressionToCeylon(conditionalExpression); }
    case (is JSwitchExpression) { return switchCaseElseExpressionToCeylon(conditionalExpression); }
}

"Compiles the given [[code]] for an Any Specifier
 into a [[ConditionalExpression]] using the Ceylon compiler
 (more specifically, the rule for an `ifExpression` or a `switchExpression`)."
shared ConditionalExpression? compileConditionalExpression(String code) {
    // the grammar rule conditionalExpression yields ifExpression|let, not ifExpression|switchExpression
    if (exists jIfExpression = createParser(code).ifExpression()) {
        return conditionalExpressionToCeylon(jIfExpression);
    } else if (exists jSwitchExpression = createParser(code).switchExpression()) {
        return conditionalExpressionToCeylon(jSwitchExpression);
    } else {
        return null;
    }
}
