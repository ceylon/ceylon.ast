import ceylon.ast.core {
    ValueGetterDefinition,
    Type,
    DynamicModifier,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeGetterDefinition=AttributeGetterDefinition,
        JDynamicModifier=DynamicModifier,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[AttributeGetterDefinition|JAttributeGetterDefinition]] to a `ceylon.ast` [[ValueGetterDefinition]]."
shared ValueGetterDefinition valueGetterDefinitionToCeylon(JAttributeGetterDefinition valueGetterDefinition) {
    "Must be defined"
    assert (exists definition = valueGetterDefinition.block);
    assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueGetterDefinition.type);
    Type|ValueModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JValueModifier) { type = valueModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return ValueGetterDefinition {
        annotations = annotationsToCeylon(valueGetterDefinition.annotationList);
        type = type;
        name = lIdentifierToCeylon(valueGetterDefinition.identifier);
        definition = blockToCeylon(definition);
    };
}

"Compiles the given [[code]] for a Value Getter Definition
 into a [[ValueGetterDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueGetterDefinition? compileValueGetterDefinition(String code) {
    if (is JAttributeGetterDefinition jDeclaration = createParser(code).declaration()) {
        return valueGetterDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
