import ceylon.ast.core {
    ParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

"Converts a RedHat AST [[InitializerParameter|JInitializerParameter]] to a `ceylon.ast` [[ParameterReference]]."
shared ParameterReference parameterReferenceToCeylon(JInitializerParameter parameterReference) {
    "Must not be defaulted"
    assert (!parameterReference.specifierExpression exists);
    return ParameterReference(lIdentifierToCeylon(parameterReference.identifier));
}

"Compiles the given [[code]] for a Parameter Reference
 into a [[ParameterReference]] using the Ceylon compiler
 (more specifically, the rule for a `parameterRef`)."
shared ParameterReference? compileParameterReference(String code) {
    if (exists jParameterRef = createParser(code).parameterRef(),
        !jParameterRef.specifierExpression exists) {
        return parameterReferenceToCeylon(jParameterRef);
    } else {
        return null;
    }
}
