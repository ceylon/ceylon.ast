import ceylon.ast.core {
    GroupedExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JParExpression=ParExpression
    }
}

"Converts a RedHat AST [[ParExpression|JParExpression]] to a `ceylon.ast` [[GroupedExpression]]."
throws (`class AssertionError`, "If the expression is not a true grouped expression")
shared GroupedExpression groupedExpressionToCeylon(JParExpression groupedExpression, Anything(JNode, Node) update = noop) {
    value result = GroupedExpression(expressionToCeylon(groupedExpression.term, update));
    update(groupedExpression, result);
    return result;
}

"Parses the given [[code]] for a Grouped Expression
 into a [[GroupedExpression]] using the Ceylon compiler
 (more specifically, the rule for a `parExpression`)."
shared GroupedExpression? parseGroupedExpression(String code, Anything(JNode, Node) update = noop) {
    if (exists jGroupedExpression = createParser(code).parExpression()) {
        return groupedExpressionToCeylon(jGroupedExpression, update);
    } else {
        return null;
    }
}
