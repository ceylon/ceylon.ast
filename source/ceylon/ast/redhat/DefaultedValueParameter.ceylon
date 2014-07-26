import ceylon.ast.core {
    DefaultedValueParameter,
    Type,
    Annotations,
    DynamicModifier,
    ValueParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JDynamicModifier=DynamicModifier,
        JSpecifierExpression=SpecifierExpression,
        JStaticType=StaticType,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[DefaultedValueParameter]]."
shared DefaultedValueParameter defaultedValueParameterToCeylon(JValueParameterDeclaration defaultedValueParameter) {
    "Must be defaulted"
    assert (is JAttributeDeclaration dec = defaultedValueParameter.typedDeclaration,
        is JSpecifierExpression specifier = dec.specifierOrInitializerExpression);
    "Must not be variadic"
    assert (is JStaticType|JDynamicModifier jType = dec.type);
    Type|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    return DefaultedValueParameter {
        parameter = ValueParameter(
            dec.annotationList exists
                    then annotationsToCeylon(dec.annotationList)
                    else Annotations(),
            type,
            lIdentifierToCeylon(dec.identifier));
        specifier = specifierToCeylon(specifier);
    };
}

"Compiles the given [[code]] for a Defaulted Value Parameter
 into a [[DefaultedValueParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedValueParameter? compileDefaultedValueParameter(String code) {
    if (is JValueParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef(),
        is JAttributeDeclaration dec = jParameterDeclarationOrRef.typedDeclaration,
        dec.specifierOrInitializerExpression is JSpecifierExpression) {
        return defaultedValueParameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
