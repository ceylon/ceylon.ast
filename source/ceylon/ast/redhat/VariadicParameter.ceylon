import ceylon.ast.core {
    VariadicParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueParameterDeclaration=ValueParameterDeclaration,
        JSequencedType=SequencedType
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[VariadicParameter]]."
shared VariadicParameter variadicParameterToCeylon(JValueParameterDeclaration variadicParameter) {
    "Must be variadic"
    assert (is JSequencedType type = variadicParameter.typedDeclaration.type);
    return VariadicParameter(
        variadicTypeToCeylon(type),
        lIdentifierToCeylon(variadicParameter.typedDeclaration.identifier),
        annotationsToCeylon(variadicParameter.typedDeclaration.annotationList));
}

"Compiles the given [[code]] for a Variadic Parameter
 into a [[VariadicParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared VariadicParameter? compileVariadicParameter(String code) {
    if (is JValueParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return variadicParameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
