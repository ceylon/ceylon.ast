import ceylon.ast.core {
    DefaultedCallableParameter,
    Type,
    VoidModifier,
    Annotations,
    CallableParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JLazySpecifierExpression=LazySpecifierExpression,
        JMethodDeclaration=MethodDeclaration,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[FunctionalParameterDeclaration|JFunctionalParameterDeclaration]] to a `ceylon.ast` [[DefaultedCallableParameter]]."
shared DefaultedCallableParameter defaultedCallableParameterToCeylon(JFunctionalParameterDeclaration defaultedCallableParameter) {
    assert (is JMethodDeclaration dec = defaultedCallableParameter.typedDeclaration,
        is JLazySpecifierExpression specifier = dec.specifierExpression);
    assert (is JStaticType|JVoidModifier jType = dec.type);
    Type|VoidModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    assert (nonempty parameterLists = CeylonIterable(dec.parameterLists).collect(parametersToCeylon));
    return DefaultedCallableParameter {
        parameter = CallableParameter {
            dec.annotationList exists
                    then annotationsToCeylon(dec.annotationList)
                    else Annotations();
            type;
            lIdentifierToCeylon(dec.identifier);
            parameterLists;
        };
        specifier = lazySpecifierToCeylon(specifier);
    };
}

"Compiles the given [[code]] for a Defaulted Callable Parameter
 into a [[DefaultedCallableParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedCallableParameter? compileDefaultedCallableParameter(String code) {
    if (is JFunctionalParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return defaultedCallableParameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
