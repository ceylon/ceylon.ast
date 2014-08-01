import ceylon.ast.core {
    ValueDefinition,
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

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[ValueDefinition]]."
shared ValueDefinition valueDefinitionToCeylon(JAttributeDeclaration valueDefinition) {
    "Must be defined"
    // The other case type of SpecifierOrInitializerExpression, InitializerExpression, is obsolete
    assert (is JSpecifierExpression definition = valueDefinition.specifierOrInitializerExpression);
    assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueDefinition.type);
    Type|ValueModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JValueModifier) { type = valueModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return ValueDefinition {
        annotations = annotationsToCeylon(valueDefinition.annotationList);
        type = type;
        name = lIdentifierToCeylon(valueDefinition.identifier);
        definition = anySpecifierToCeylon(definition);
    };
}

"Compiles the given [[code]] for a Value Definition
 into an [[ValueDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueDefinition? compileValueDefinition(String code) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        jDeclaration.specifierOrInitializerExpression exists) {
        return valueDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
