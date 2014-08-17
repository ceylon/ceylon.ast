import ceylon.ast.core {
    KeyValueIterator,
    Type,
    UnspecifiedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JKeyValueIterator=KeyValueIterator,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[KeyValueIterator|JKeyValueIterator]] to a `ceylon.ast` [[KeyValueIterator]]."
shared KeyValueIterator keyValueIteratorToCeylon(JKeyValueIterator keyValueIterator) {
    Type? keyType;
    value jKeyVariable = keyValueIterator.keyVariable;
    value jKeyType = jKeyVariable.type;
    if (is JStaticType jKeyType) {
        keyType = typeToCeylon(jKeyType);
    } else {
        "Must be untyped"
        assert (jKeyType is JValueModifier,
            !jKeyType.mainToken exists);
        keyType = null;
    }
    value keyVariable = UnspecifiedVariable(lIdentifierToCeylon(jKeyVariable.identifier), keyType);
    Type? valueType;
    value jValueVariable = keyValueIterator.valueVariable;
    value jValueType = jValueVariable.type;
    if (is JStaticType jValueType) {
        valueType = typeToCeylon(jValueType);
    } else {
        "Must be untyped"
        assert (jValueType is JValueModifier,
            !jValueType.mainToken exists);
        valueType = null;
    }
    value valueVariable = UnspecifiedVariable(lIdentifierToCeylon(jValueVariable.identifier), valueType);
    return KeyValueIterator(keyVariable, valueVariable, expressionToCeylon(keyValueIterator.specifierExpression.expression));
}

"Compiles the given [[code]] for a Key Value Iterator
 into a [[KeyValueIterator]] using the Ceylon compiler
 (more specifically, the rule for a `forIterator`)."
shared KeyValueIterator? compileKeyValueIterator(String code) {
    if (is JKeyValueIterator jForIterator = createParser(code).forIterator()) {
        return keyValueIteratorToCeylon(jForIterator);
    } else {
        return null;
    }
}
