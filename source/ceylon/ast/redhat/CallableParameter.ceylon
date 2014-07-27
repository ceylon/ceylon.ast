import ceylon.ast.core {
    Annotations,
    CallableParameter,
    Type,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JMethodDeclaration=MethodDeclaration,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[FunctionalParameterDeclaration|JFunctionalParameterDeclaration]] to a `ceylon.ast` [[CallableParameter]]."
shared CallableParameter callableParameterToCeylon(JFunctionalParameterDeclaration callableParameter) {
    assert (is JMethodDeclaration dec = callableParameter.typedDeclaration);
    assert (is JStaticType|JVoidModifier jType = dec.type);
    Type|VoidModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    assert (nonempty parameterLists = CeylonIterable(dec.parameterLists).collect(parametersToCeylon));
    return CallableParameter {
        dec.annotationList exists
                then annotationsToCeylon(dec.annotationList)
                else Annotations();
        type;
        lIdentifierToCeylon(dec.identifier);
        parameterLists;
    };
}

"Compiles the given [[code]] for a Callable Parameter
 into a [[CallableParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameter`)."
shared CallableParameter? compileCallableParameter(String code) {
    if (is JFunctionalParameterDeclaration jParameter = createParser(code).parameterDeclarationOrRef()) {
        return callableParameterToCeylon(jParameter);
    } else {
        return null;
    }
}
