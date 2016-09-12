import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfExpression=IfExpression
    }
}

"Converts a RedHat AST [[IfExpression|JIfExpression]] to a `ceylon.ast` [[IfElseExpression]]."
shared IfElseExpression ifElseExpressionToCeylon(JIfExpression ifElseExpression, Anything(JNode,Node) update = noop) {
    assert (exists jThenExpression = ifElseExpression.ifClause.expression,
        exists jElseExpression = ifElseExpression.elseClause.expression);
    "Check precedence"
    assert (is DisjoiningExpression|IfElseExpression|LetExpression thenExpression = expressionToCeylon(jThenExpression, update),
        is DisjoiningExpression|IfElseExpression|LetExpression elseExpression = expressionToCeylon(jElseExpression, update));
    value result = IfElseExpression(conditionsToCeylon(ifElseExpression.ifClause.conditionList, update), thenExpression, elseExpression);
    update(ifElseExpression, result);
    return result;
}

"Parses the given [[code]] for an If Else Expression
 into an [[IfElseExpression]] using the Ceylon compiler
 (more specifically, the rule for an `ifExpression`)."
shared IfElseExpression? parseIfElseExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jIfExpression = createParser(code).ifExpression()) {
        return ifElseExpressionToCeylon(jIfExpression, update);
    } else {
        return null;
    }
}
