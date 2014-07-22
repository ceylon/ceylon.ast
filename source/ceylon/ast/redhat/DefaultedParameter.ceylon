import ceylon.ast.core {
    DefaultedParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JInitializerParameter=InitializerParameter,
        JParameter=Parameter,
        JParameterDeclaration=ParameterDeclaration,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[DefaultedParameter]]."
shared DefaultedParameter defaultedParameterToCeylon(JParameter defaultedParameter) {
    assert (is JParameterDeclaration|JInitializerParameter defaultedParameter);
    switch (defaultedParameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration defaultedParameter);
        switch (defaultedParameter)
        case (is JValueParameterDeclaration) { return defaultedValueParameterToCeylon(defaultedParameter); }
        case (is JFunctionalParameterDeclaration) {
            throw AssertionError("Functional parameter declarations not implemented yet");
        }
    }
    case (is JInitializerParameter) {
        return defaultedParameterReferenceToCeylon(defaultedParameter);
    }
}

"Compiles the given [[code]] for a Defaulted Parameter
 into a [[DefaultedParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedParameter? compileDefaultedParameter(String code) {
    if (exists jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return defaultedParameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
