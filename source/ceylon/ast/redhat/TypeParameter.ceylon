import ceylon.ast.core {
    Type,
    TypeParameter,
    Variance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterDeclaration=TypeParameterDeclaration
    }
}

"Converts a RedHat AST [[TypeParameterDeclaration|JTypeParameterDeclaration]] to a `ceylon.ast` [[TypeParameter]]."
shared TypeParameter typeParameterToCeylon(JTypeParameterDeclaration typeParameter) {
    Variance? variance;
    if (exists jVariance = typeParameter.typeVariance) {
        variance = varianceToCeylon(jVariance);
    } else {
        variance = null;
    }
    Type? defaultArgument;
    if (exists jDefaultArgument = typeParameter.typeSpecifier) {
        defaultArgument = typeToCeylon(jDefaultArgument.type);
    } else {
        defaultArgument = null;
    }
    return TypeParameter(uIdentifierToCeylon(typeParameter.identifier), variance, defaultArgument);
}

"Compiles the given [[code]] for a Type Parameter
 into a [[TypeParameter]] using the Ceylon compiler
 (more specifically, the rule for a `typeParameter`)."
shared TypeParameter? compileTypeParameter(String code) {
    if (exists jTypeParameter = createParser(code).typeParameter()) {
        return typeParameterToCeylon(jTypeParameter);
    } else {
        return null;
    }
}
