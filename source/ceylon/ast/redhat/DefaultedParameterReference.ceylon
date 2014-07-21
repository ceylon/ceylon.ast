import ceylon.ast.core {
    DefaultedParameterReference,
    ParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

"Converts a RedHat AST [[InitializerParameter|JInitializerParameter]] to a `ceylon.ast` [[DefaultedParameterReference]]."
shared DefaultedParameterReference defaultedParameterReferenceToCeylon(JInitializerParameter defaultedParameterReference) {
    "Must be defaulted"
    assert (exists specifier = defaultedParameterReference.specifierExpression);
    return DefaultedParameterReference(ParameterReference(lIdentifierToCeylon(defaultedParameterReference.identifier)), specifierToCeylon(specifier));
}

"Compiles the given [[code]] for a Defaulted Parameter Reference
 into a [[DefaultedParameterReference]] using the Ceylon compiler
 (more specifically, the rule for a `parameterRef`)."
shared DefaultedParameterReference? compileDefaultedParameterReference(String code) {
    if (exists jParameterRef = createParser(code).parameterRef(),
        jParameterRef.specifierExpression exists) {
        return defaultedParameterReferenceToCeylon(jParameterRef);
    } else {
        return null;
    }
}
