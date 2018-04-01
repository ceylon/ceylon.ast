import ceylon.ast.core {
    Node,
    Type,
    TypeParameter,
    Variance
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeParameterDeclaration=TypeParameterDeclaration
    }
}

"Converts a RedHat AST [[TypeParameterDeclaration|JTypeParameterDeclaration]] to a `ceylon.ast` [[TypeParameter]]."
shared TypeParameter typeParameterToCeylon(JTypeParameterDeclaration typeParameter, Anything(JNode, Node) update = noop) {
    Variance? variance;
    if (exists jVariance = typeParameter.typeVariance) {
        variance = varianceToCeylon(jVariance, update);
    } else {
        variance = null;
    }
    Type? defaultArgument;
    if (exists jDefaultArgument = typeParameter.typeSpecifier) {
        defaultArgument = typeToCeylon(jDefaultArgument.type, update);
    } else {
        defaultArgument = null;
    }
    value result = TypeParameter(uIdentifierToCeylon(typeParameter.identifier, update), variance, defaultArgument);
    update(typeParameter, result);
    return result;
}

"Parses the given [[code]] for a Type Parameter
 into a [[TypeParameter]] using the Ceylon compiler
 (more specifically, the rule for a `typeParameter`)."
shared TypeParameter? parseTypeParameter(String code, Anything(JNode, Node) update = noop) {
    if (exists jTypeParameter = createParser(code).typeParameter()) {
        return typeParameterToCeylon(jTypeParameter, update);
    } else {
        return null;
    }
}
