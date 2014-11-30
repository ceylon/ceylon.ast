import ceylon.ast.core {
    LetExpression,
    LetValueList,
    SpecifiedVariable,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLetExpression=LetExpression,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[LetExpression|JLetExpression]] to a `ceylon.ast` [[LetExpression]]."
shared LetExpression letExpressionToCeylon(JLetExpression letExpression) {
    value letClause = letExpression.letClause;
    value letValues = CeylonIterable(letClause.variables).collect((jVariable) {
            assert (exists jSpecifierExpression = jVariable.specifierExpression);
            Type|ValueModifier? type;
            assert (is JStaticType|JValueModifier jType = jVariable.type);
            switch (jType)
            case (is JStaticType) { type = typeToCeylon(jType); }
            case (is JValueModifier) {
                if (jType.mainToken exists) {
                    type = valueModifierToCeylon(jType);
                } else {
                    // synthetic ValueModifier
                    type = null;
                }
            }
            return SpecifiedVariable(lIdentifierToCeylon(jVariable.identifier), specifierToCeylon(jSpecifierExpression), type);
        });
    "Must have at least one `let` value"
    assert (nonempty letValues);
    return LetExpression(LetValueList(letValues), expressionToCeylon(letClause.expression));
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
