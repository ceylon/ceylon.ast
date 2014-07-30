import ceylon.ast.core {
    AttributeDeclaration,
    DynamicModifier,
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[AttributeDeclaration]]."
shared AttributeDeclaration attributeDeclarationToCeylon(JAttributeDeclaration attributeDeclaration) {
    "Must not have a specification"
    assert (!attributeDeclaration.specifierOrInitializerExpression exists);
    assert (is JStaticType|JDynamicModifier jType = attributeDeclaration.type);
    Type|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return AttributeDeclaration(lIdentifierToCeylon(attributeDeclaration.identifier), type, annotationsToCeylon(attributeDeclaration.annotationList));
}

"Compiles the given [[code]] for an Attribute Declaration
 into an [[AttributeDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AttributeDeclaration? compileAttributeDeclaration(String code) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        !jDeclaration.specifierOrInitializerExpression exists) {
        return attributeDeclarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}
