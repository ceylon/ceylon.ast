import ceylon.ast.core {
    Node,
    Parameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JInitializerParameter=InitializerParameter,
        JMethodDeclaration=MethodDeclaration,
        JParameter=Parameter,
        JParameterDeclaration=ParameterDeclaration,
        JSequencedType=SequencedType,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[Parameter]]."
shared Parameter parameterToCeylon(JParameter parameter, Anything(JNode,Node) update = noop) {
    assert (is JParameterDeclaration|JInitializerParameter parameter);
    switch (parameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration parameter);
        if (parameter.typedDeclaration.type is JSequencedType) {
            assert (is JValueParameterDeclaration parameter);
            return variadicParameterToCeylon(parameter, update);
        } else {
            switch (parameter)
            case (is JValueParameterDeclaration) {
                assert (is JAttributeDeclaration dec = parameter.typedDeclaration);
                if (dec.specifierOrInitializerExpression exists) {
                    return defaultedValueParameterToCeylon(parameter, update);
                } else {
                    return valueParameterToCeylon(parameter, update);
                }
            }
            case (is JFunctionalParameterDeclaration) {
                assert (is JMethodDeclaration dec = parameter.typedDeclaration);
                if (dec.specifierExpression exists) {
                    return defaultedCallableParameterToCeylon(parameter, update);
                } else {
                    return callableParameterToCeylon(parameter, update);
                }
            }
        }
    }
    case (is JInitializerParameter) {
        if (parameter.specifierExpression exists) {
            return defaultedParameterReferenceToCeylon(parameter, update);
        } else {
            return parameterReferenceToCeylon(parameter, update);
        }
    }
}

"Parses the given [[code]] for a Parameter
 into a [[Parameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared Parameter? parseParameter(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameterDeclarationOrRef = createParser(code + ",").parameterDeclarationOrRef()) {
        /*
         The parser does some lookahead and seems to need that comma to parse a parameterRef
         */
        return parameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
