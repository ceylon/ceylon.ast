import ceylon.ast.core {
    ConditionalExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfExpression=IfExpression,
        JSwitchExpression=SwitchExpression
    }
}

"Converts a RedHat AST [[IfExpression|JIfExpression]] or [[SwitchExpression|JSwitchExpression]] to a `ceylon.ast` [[ConditionalExpression]]."
shared ConditionalExpression conditionalExpressionToCeylon(JIfExpression|JSwitchExpression conditionalExpression, Anything(JNode, Node) update = noop) {
    switch (conditionalExpression)
    case (is JIfExpression) { return ifElseExpressionToCeylon(conditionalExpression, update); }
    case (is JSwitchExpression) { return switchCaseElseExpressionToCeylon(conditionalExpression, update); }
}

"Parses the given [[code]] for an Any Specifier
 into a [[ConditionalExpression]] using the Ceylon compiler
 (more specifically, the rule for an `ifExpression` or a `switchExpression`)."
shared ConditionalExpression? parseConditionalExpression(String code, Anything(JNode, Node) update = noop) {
    // the grammar rule conditionalExpression yields ifExpression|let, not ifExpression|switchExpression
    if (exists jIfExpression = createParser(code).ifExpression()) {
        return conditionalExpressionToCeylon(jIfExpression, update);
    } else if (exists jSwitchExpression = createParser(code).switchExpression()) {
        return conditionalExpressionToCeylon(jSwitchExpression, update);
    } else {
        return null;
    }
}
