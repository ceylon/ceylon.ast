import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    Node,
    PatternList
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLetExpression=LetExpression
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[LetExpression|JLetExpression]] to a `ceylon.ast` [[LetExpression]]."
shared LetExpression letExpressionToCeylon(JLetExpression letExpression, Anything(JNode,Node) update = noop) {
    value letClause = letExpression.letClause;
    value letValues = CeylonIterable(letClause.variables).collect(propagateUpdate(specifiedPatternToCeylon, update));
    "Must have at least one `let` value"
    assert (nonempty letValues);
    "Check precedence"
    assert (is DisjoiningExpression|IfElseExpression|LetExpression expression = expressionToCeylon(letClause.expression, update));
    value patternList = PatternList(letValues);
    update(letClause, patternList);
    value result = LetExpression(patternList, expression);
    update(letExpression, result);
    return result;
}

"Compiles the given [[code]] for a Let Expression
 into a [[LetExpression]] using the Ceylon compiler
 (more specifically, the rule for a `let`)."
shared LetExpression? compileLetExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jLet = createParser(code).\ilet()) {
        return letExpressionToCeylon(jLet, update);
    } else {
        return null;
    }
}
