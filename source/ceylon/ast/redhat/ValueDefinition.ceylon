import ceylon.ast.core {
    DynamicModifier,
    Node,
    Type,
    ValueDefinition,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JSpecifierExpression=SpecifierExpression,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[ValueDefinition]]."
shared ValueDefinition valueDefinitionToCeylon(JAttributeDeclaration valueDefinition, Anything(JNode,Node) update = noop) {
    "Must be defined"
    // The other case type of SpecifierOrInitializerExpression, InitializerExpression, is obsolete
    assert (is JSpecifierExpression definition = valueDefinition.specifierOrInitializerExpression);
    assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueDefinition.type);
    Type|ValueModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JValueModifier) { type = valueModifierToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    value result = ValueDefinition {
        annotations = annotationsToCeylon(valueDefinition.annotationList, update);
        type = type;
        name = lIdentifierToCeylon(valueDefinition.identifier, update);
        definition = anySpecifierToCeylon(definition, update);
    };
    update(valueDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Value Definition
 into an [[ValueDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueDefinition? compileValueDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        jDeclaration.specifierOrInitializerExpression exists) {
        return valueDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
