import ceylon.ast.core {
    ValueDeclaration,
    DynamicModifier,
    Type,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JStaticType=StaticType,
        JSequencedType=SequencedType
    }
}

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[ValueDeclaration]]."
shared ValueDeclaration valueDeclarationToCeylon(JAttributeDeclaration valueDeclaration) {
    "Must not have a specification"
    assert (!valueDeclaration.specifierOrInitializerExpression exists);
    assert (is JStaticType|JSequencedType|JDynamicModifier jType = valueDeclaration.type);
    Type|VariadicType|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JSequencedType) { type = variadicTypeToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return ValueDeclaration(lIdentifierToCeylon(valueDeclaration.identifier), type, annotationsToCeylon(valueDeclaration.annotationList));
}

"Compiles the given [[code]] for a Value Declaration
 into an [[ValueDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueDeclaration? compileValueDeclaration(String code) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        !jDeclaration.specifierOrInitializerExpression exists) {
        return valueDeclarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}
