import ceylon.ast.core {
    Node,
    ParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

"Converts a RedHat AST [[InitializerParameter|JInitializerParameter]] to a `ceylon.ast` [[ParameterReference]]."
shared ParameterReference parameterReferenceToCeylon(JInitializerParameter parameterReference, Anything(JNode,Node) update = noop) {
    "Must not be defaulted"
    assert (!parameterReference.specifierExpression exists);
    value result = ParameterReference(lIdentifierToCeylon(parameterReference.identifier, update));
    update(parameterReference, result);
    return result;
}

"Compiles the given [[code]] for a Parameter Reference
 into a [[ParameterReference]] using the Ceylon compiler
 (more specifically, the rule for a `parameterRef`)."
shared ParameterReference? compileParameterReference(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameterRef = createParser(code).parameterRef(),
        !jParameterRef.specifierExpression exists) {
        return parameterReferenceToCeylon(jParameterRef, update);
    } else {
        return null;
    }
}
