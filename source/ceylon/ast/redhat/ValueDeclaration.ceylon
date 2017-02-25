import ceylon.ast.core {
    Node,
    ValueDeclaration,
    DynamicModifier,
    Type,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JStaticType=StaticType,
        JSequencedType=SequencedType
    }
}

"Converts a RedHat AST [[AttributeDeclaration|JAttributeDeclaration]] to a `ceylon.ast` [[ValueDeclaration]]."
shared ValueDeclaration valueDeclarationToCeylon(JAttributeDeclaration valueDeclaration, Anything(JNode, Node) update = noop) {
    "Must not have a specification"
    assert (!valueDeclaration.specifierOrInitializerExpression exists);
    assert (is JStaticType|JSequencedType|JDynamicModifier jType = valueDeclaration.type);
    Type|VariadicType|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JSequencedType) { type = variadicTypeToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    value result = ValueDeclaration(lIdentifierToCeylon(valueDeclaration.identifier, update), type, annotationsToCeylon(valueDeclaration.annotationList, update));
    update(valueDeclaration, result);
    return result;
}

"Parses the given [[code]] for a Value Declaration
 into an [[ValueDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueDeclaration? parseValueDeclaration(String code, Anything(JNode, Node) update = noop) {
    if (is JAttributeDeclaration jDeclaration = createParser(code).declaration(),
        !jDeclaration.specifierOrInitializerExpression exists) {
        return valueDeclarationToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
