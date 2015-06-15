import ceylon.ast.core {
    Node,
    RequiredParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JInitializerParameter=InitializerParameter,
        JMethodDeclaration=MethodDeclaration,
        JParameter=Parameter,
        JParameterDeclaration=ParameterDeclaration,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[RequiredParameter]]."
shared RequiredParameter requiredParameterToCeylon(JParameter requiredParameter, Anything(JNode,Node) update = noop) {
    assert (is JParameterDeclaration|JInitializerParameter requiredParameter);
    switch (requiredParameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration requiredParameter);
        switch (requiredParameter)
        case (is JValueParameterDeclaration) {
            return valueParameterToCeylon(requiredParameter, update);
        }
        case (is JFunctionalParameterDeclaration) {
            assert (is JMethodDeclaration dec = requiredParameter.typedDeclaration);
            if (dec.specifierExpression exists) {
                // TODO implement defaulted callable parameters
                throw AssertionError("Defaulted callable parameters not yet implemented");
            } else {
                return callableParameterToCeylon(requiredParameter, update);
            }
        }
    }
    case (is JInitializerParameter) {
        return parameterReferenceToCeylon(requiredParameter, update);
    }
}

"Compiles the given [[code]] for a Required Parameter
 into a [[RequiredParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared RequiredParameter? compileRequiredParameter(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameterDeclarationOrRef = createParser(code + ",").parameterDeclarationOrRef()) {
        /*
         The parser does some lookahead and seems to need that comma to parse a parameterRef
         */
        return requiredParameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
