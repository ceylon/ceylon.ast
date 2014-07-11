import ceylon.ast.core {
    GroupedExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression
    }
}

"Converts a RedHat AST [[Expression|JExpression]] to a `ceylon.ast` [[GroupedExpression]].
 
 Warning: `Expression` is used somewhat ambiguously in the RedHat AST.
 It can be used to wrap any expression in parentheses (and is used thus in the rule `parExpression`),
 and despite its name, it’s not the root of the expression type hierarchy (which is
 [[Term|com.redhat.ceylon.compiler.typechecker.tree::Tree.Term]]);
 however, many other node types declare an `Expression` child instead of a `Term` child,
 and the `Expression` used is then often a simple wrapper around a `Term` *without* parenthesis tokens.
 
 This function only converts true grouped expressions (i. e., it asserts the existence of tokens);
 if you’re not sure if your `Expression` is grouped or not, use [[expressionToCeylon]] instead."
throws (`class AssertionError`, "If the expression is not a true grouped expression")
shared GroupedExpression groupedExpressionToCeylon(JExpression groupedExpression) {
    "Must be a grouped expression"
    assert (groupedExpression.mainToken exists);
    return GroupedExpression(expressionToCeylon(groupedExpression.term));
}

"Compiles the given [[code]] for a Grouped Expression
 into a [[GroupedExpression]] using the Ceylon compiler
 (more specifically, the rule for a `parExpression`)."
shared GroupedExpression? compileGroupedExpression(String code) {
    if (exists jGroupedExpression = createParser(code).parExpression()) {
        return groupedExpressionToCeylon(jGroupedExpression);
    } else {
        return null;
    }
}
