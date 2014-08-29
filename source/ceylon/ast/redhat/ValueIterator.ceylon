import ceylon.ast.core {
    Type,
    ValueIterator,
    UnspecifiedVariable,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType,
        JValueIterator=ValueIterator,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[ValueIterator|JValueIterator]] to a `ceylon.ast` [[ValueIterator]]."
shared ValueIterator valueIteratorToCeylon(JValueIterator valueIterator) {
    Type|ValueModifier? type;
    value jVariable = valueIterator.variable;
    value jType = jVariable.type;
    if (is JStaticType jType) {
        type = typeToCeylon(jType);
    } else {
        assert (is JValueModifier jType);
        // The parser creates a ValueModifier with null token if the type is missing completely
        type = jType.mainToken exists then valueModifierToCeylon(jType) else null;
    }
    return ValueIterator(UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier), type), expressionToCeylon(valueIterator.specifierExpression.expression));
}

"Compiles the given [[code]] for a Value Iterator
 into a [[ValueIterator]] using the Ceylon compiler
 (more specifically, the rule for a `forIterator`)."
shared ValueIterator? compileValueIterator(String code) {
    if (is JValueIterator jForIterator = createParser(code).forIterator()) {
        return valueIteratorToCeylon(jForIterator);
    } else {
        return null;
    }
}
