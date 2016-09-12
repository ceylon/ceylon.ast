import ceylon.ast.core {
    DefaultedParameterReference,
    Node,
    ParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

"Converts a RedHat AST [[InitializerParameter|JInitializerParameter]] to a `ceylon.ast` [[DefaultedParameterReference]]."
shared DefaultedParameterReference defaultedParameterReferenceToCeylon(JInitializerParameter defaultedParameterReference, Anything(JNode,Node) update = noop) {
    "Must be defaulted"
    assert (exists specifier = defaultedParameterReference.specifierExpression);
    value parameterReference = ParameterReference(lIdentifierToCeylon(defaultedParameterReference.identifier, update));
    update(defaultedParameterReference, parameterReference);
    value result = DefaultedParameterReference(parameterReference, specifierToCeylon(specifier, update));
    update(defaultedParameterReference, result);
    return result;
}

"Parses the given [[code]] for a Defaulted Parameter Reference
 into a [[DefaultedParameterReference]] using the Ceylon compiler
 (more specifically, the rule for a `parameterRef`)."
shared DefaultedParameterReference? parseDefaultedParameterReference(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameterRef = createParser(code).parameterRef(),
        jParameterRef.specifierExpression exists) {
        return defaultedParameterReferenceToCeylon(jParameterRef, update);
    } else {
        return null;
    }
}
