import ceylon.ast.core {
    Annotations,
    DynamicModifier,
    Node,
    Type,
    ValueParameter
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JValueParameterDeclaration=ValueParameterDeclaration,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[ValueParameter]]."
shared ValueParameter valueParameterToCeylon(JValueParameterDeclaration valueParameter, Anything(JNode, Node) update = noop) {
    "Must not be variadic"
    assert (is JStaticType|JDynamicModifier jType = valueParameter.typedDeclaration.type);
    Type|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    value result = ValueParameter(
        type,
        lIdentifierToCeylon(valueParameter.typedDeclaration.identifier, update),
        valueParameter.typedDeclaration.annotationList exists
                then annotationsToCeylon(valueParameter.typedDeclaration.annotationList, update)
                else Annotations());
    update(valueParameter, result);
    return result;
}

"Parses the given [[code]] for a Value Parameter
 into a [[ValueParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared ValueParameter? parseValueParameter(String code, Anything(JNode, Node) update = noop) {
    if (is JValueParameterDeclaration jParameter = createParser(code).parameterDeclarationOrRef(),
        jParameter.typedDeclaration.type is JStaticType|JDynamicModifier) {
        return valueParameterToCeylon(jParameter, update);
    } else {
        return null;
    }
}
