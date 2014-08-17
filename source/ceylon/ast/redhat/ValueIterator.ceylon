import ceylon.ast.core {
    Type,
    ValueIterator,
    UnspecifiedVariable
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
    Type? type;
    value jVariable = valueIterator.variable;
    value jType = jVariable.type;
    if (is JStaticType jType) {
        type = typeToCeylon(jType);
    } else {
        "Must be untyped"
        assert (jType is JValueModifier,
            !jType.mainToken exists);
        type = null;
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
