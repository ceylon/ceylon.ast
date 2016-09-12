import ceylon.ast.core {
    DefaultedValueParameter,
    Node,
    Type,
    Annotations,
    DynamicModifier,
    ValueParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JSpecifierExpression=SpecifierExpression,
        JStaticType=StaticType,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[DefaultedValueParameter]]."
shared DefaultedValueParameter defaultedValueParameterToCeylon(JValueParameterDeclaration defaultedValueParameter, Anything(JNode,Node) update = noop) {
    "Must be defaulted"
    assert (is JAttributeDeclaration dec = defaultedValueParameter.typedDeclaration,
        is JSpecifierExpression specifier = dec.specifierOrInitializerExpression);
    "Must not be variadic"
    assert (is JStaticType|JDynamicModifier jType = dec.type);
    Type|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    value result = DefaultedValueParameter {
        value parameter {
            value result = ValueParameter(
                type,
                lIdentifierToCeylon(dec.identifier, update),
                dec.annotationList exists
                        then annotationsToCeylon(dec.annotationList, update)
                        else Annotations());
            update(defaultedValueParameter, result);
            return result;
        }
        specifier = specifierToCeylon(specifier, update);
    };
    update(defaultedValueParameter, result);
    return result;
}

"Parses the given [[code]] for a Defaulted Value Parameter
 into a [[DefaultedValueParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedValueParameter? parseDefaultedValueParameter(String code, Anything(JNode,Node) update = noop) {
    if (is JValueParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef(),
        is JAttributeDeclaration dec = jParameterDeclarationOrRef.typedDeclaration,
        dec.specifierOrInitializerExpression is JSpecifierExpression) {
        return defaultedValueParameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
