import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression
    }
}

"Converts a RedHat AST [[IfExpression|JIfExpression]] to a `ceylon.ast` [[IfElseExpression]]."
shared IfElseExpression ifElseExpressionToCeylon(JIfExpression ifElseExpression) {
    assert (exists jThenExpression = ifElseExpression.ifClause.expression,
        exists jElseExpression = ifElseExpression.elseClause.expression);
    "Check precedence"
    assert (is DisjoiningExpression|IfElseExpression|LetExpression thenExpression = expressionToCeylon(jThenExpression),
        is DisjoiningExpression|IfElseExpression|LetExpression elseExpression = expressionToCeylon(jElseExpression));
    return IfElseExpression(conditionsToCeylon(ifElseExpression.ifClause.conditionList), thenExpression, elseExpression);
}

"Compiles the given [[code]] for an If Else Expression
 into an [[IfElseExpression]] using the Ceylon compiler
 (more specifically, the rule for an `ifExpression`)."
shared IfElseExpression? compileIfElseExpression(String code) {
    if (exists jIfExpression = createParser(code).ifExpression()) {
        return ifElseExpressionToCeylon(jIfExpression);
    } else {
        return null;
    }
}
