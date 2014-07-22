import ceylon.ast.core {
    RequiredParameter
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

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[RequiredParameter]]."
shared RequiredParameter requiredParameterToCeylon(JParameter requiredParameter) {
    assert (is JParameterDeclaration|JInitializerParameter requiredParameter);
    switch (requiredParameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration requiredParameter);
        switch (requiredParameter)
        case (is JValueParameterDeclaration) {
            return valueParameterToCeylon(requiredParameter);
        }
        case (is JFunctionalParameterDeclaration) {
            // TODO implement functional parameters
            throw AssertionError("Functional parameters not yet implemented");
        }
    }
    case (is JInitializerParameter) {
        return parameterReferenceToCeylon(requiredParameter);
    }
}

"Compiles the given [[code]] for a Required Parameter
 into a [[RequiredParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared RequiredParameter? compileRequiredParameter(String code) {
    if (exists jParameterDeclarationOrRef = createParser(code + ",").parameterDeclarationOrRef()) {
        /*
         For parameter references, the parser looks ahead of the lidentifier token
         (probably for some disambiguation that’s needed somewhere), and
         it needs that comma (or a rparen or something like that) to determine
         that this is in fact a parameter reference and not something else.
         */
        return requiredParameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
