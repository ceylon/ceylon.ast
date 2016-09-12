import ceylon.ast.core {
    DefaultedParameter,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JInitializerParameter=InitializerParameter,
        JParameter=Parameter,
        JParameterDeclaration=ParameterDeclaration,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[DefaultedParameter]]."
shared DefaultedParameter defaultedParameterToCeylon(JParameter defaultedParameter, Anything(JNode,Node) update = noop) {
    assert (is JParameterDeclaration|JInitializerParameter defaultedParameter);
    switch (defaultedParameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration defaultedParameter);
        switch (defaultedParameter)
        case (is JValueParameterDeclaration) { return defaultedValueParameterToCeylon(defaultedParameter, update); }
        case (is JFunctionalParameterDeclaration) { return defaultedCallableParameterToCeylon(defaultedParameter, update); }
    }
    case (is JInitializerParameter) {
        return defaultedParameterReferenceToCeylon(defaultedParameter, update);
    }
}

"Parses the given [[code]] for a Defaulted Parameter
 into a [[DefaultedParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedParameter? parseDefaultedParameter(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return defaultedParameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
