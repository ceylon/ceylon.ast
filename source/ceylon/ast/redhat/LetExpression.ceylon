import ceylon.ast.core {
    LetExpression,
    PatternList
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLetExpression=LetExpression
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[LetExpression|JLetExpression]] to a `ceylon.ast` [[LetExpression]]."
shared LetExpression letExpressionToCeylon(JLetExpression letExpression) {
    value letClause = letExpression.letClause;
    value letValues = CeylonIterable(letClause.variables).collect(specifiedPatternToCeylon);
    "Must have at least one `let` value"
    assert (nonempty letValues);
    return LetExpression(PatternList(letValues), expressionToCeylon(letClause.expression));
}

"Compiles the given [[code]] for a Let Expression
 into a [[LetExpression]] using the Ceylon compiler
 (more specifically, the rule for a `let`)."
shared LetExpression? compileLetExpression(String code) {
    if (exists jLet = createParser(code).\ilet()) {
        return letExpressionToCeylon(jLet);
    } else {
        return null;
    }
}
