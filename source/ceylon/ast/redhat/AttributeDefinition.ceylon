import ceylon.ast.core {
    AttributeDefinition,
    Type,
    ValueModifier,
    DynamicModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JSpecifierExpression=SpecifierExpression,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[AttributeDefinition]]."
shared AttributeDefinition attributeDefinitionToCeylon(JAttributeDeclaration attributeDefinition) {
    "Must be defined"
    // The other case type of SpecifierOrInitializerExpression, InitializerExpression, is obsolete
    assert (is JSpecifierExpression definition = attributeDefinition.specifierOrInitializerExpression);
    assert (is JStaticType|JValueModifier|JDynamicModifier jType = attributeDefinition.type);
    Type|ValueModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JValueModifier) { type = valueModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return AttributeDefinition {
        annotations = annotationsToCeylon(attributeDefinition.annotationList);
        type = type;
        name = lIdentifierToCeylon(attributeDefinition.identifier);
        definition = anySpecifierToCeylon(definition);
    };
}

"Compiles the given [[code]] for an Attribute Definition
 into an [[AttributeDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AttributeDefinition? compileAttributeDefinition(String code) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        jDeclaration.specifierOrInitializerExpression exists) {
        return attributeDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
