import ceylon.ast.core {
    Node,
    VariadicParameter
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JValueParameterDeclaration=ValueParameterDeclaration,
        JSequencedType=SequencedType
    }
}

"Converts a RedHat AST [[ValueParameterDeclaration|JValueParameterDeclaration]] to a `ceylon.ast` [[VariadicParameter]]."
shared VariadicParameter variadicParameterToCeylon(JValueParameterDeclaration variadicParameter, Anything(JNode, Node) update = noop) {
    "Must be variadic"
    assert (is JSequencedType type = variadicParameter.typedDeclaration.type);
    value result = VariadicParameter(
        variadicTypeToCeylon(type, update),
        lIdentifierToCeylon(variadicParameter.typedDeclaration.identifier, update),
        annotationsToCeylon(variadicParameter.typedDeclaration.annotationList, update));
    update(variadicParameter, result);
    return result;
}

"Parses the given [[code]] for a Variadic Parameter
 into a [[VariadicParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared VariadicParameter? parseVariadicParameter(String code, Anything(JNode, Node) update = noop) {
    if (is JValueParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return variadicParameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
