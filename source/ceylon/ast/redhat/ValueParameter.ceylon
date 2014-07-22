import ceylon.ast.core {
    Annotations,
    Type,
    ValueParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JValueParameterDeclaration=ValueParameterDeclaration,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[ValueParameter]]."
shared ValueParameter valueParameterToCeylon(JValueParameterDeclaration valueParameter) {
    "Must not be variadic"
    assert (is JStaticType|JDynamicModifier jType = valueParameter.typedDeclaration.type);
    Type? type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JDynamicModifier) { type = null; }
    return ValueParameter(
        valueParameter.typedDeclaration.annotationList exists
                then annotationsToCeylon(valueParameter.typedDeclaration.annotationList)
                else Annotations(),
        type,
        lIdentifierToCeylon(valueParameter.typedDeclaration.identifier));
}

"Compiles the given [[code]] for a Value Parameter
 into a [[ValueParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared ValueParameter? compileValueParameter(String code) {
    if (is JValueParameterDeclaration jParameter = createParser(code).parameterDeclarationOrRef(),
        jParameter.typedDeclaration.type is JStaticType|JDynamicModifier) {
        return valueParameterToCeylon(jParameter);
    } else {
        return null;
    }
}
