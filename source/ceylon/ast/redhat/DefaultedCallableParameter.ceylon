import ceylon.ast.core {
    Annotations,
    CallableParameter,
    DefaultedCallableParameter,
    Node,
    Type,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared DefaultedCallableParameter defaultedCallableParameterToCeylon(JFunctionalParameterDeclaration defaultedCallableParameter, Anything(JNode,Node) update = noop) {
    assert (is JMethodDeclaration dec = defaultedCallableParameter.typedDeclaration,
        is JLazySpecifierExpression specifier = dec.specifierExpression);
    assert (is JStaticType|JVoidModifier jType = dec.type);
    Type|VoidModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType, update); }
    assert (nonempty parameterLists = CeylonIterable(dec.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
    value result = DefaultedCallableParameter {
        parameter = CallableParameter {
            type;
            lIdentifierToCeylon(dec.identifier, update);
            parameterLists;
            dec.annotationList exists
                    then annotationsToCeylon(dec.annotationList, update)
                    else Annotations();
        };
        specifier = lazySpecifierToCeylon(specifier, update);
    };
    update(defaultedCallableParameter, result);
    return result;
}

"Compiles the given [[code]] for a Defaulted Callable Parameter
 into a [[DefaultedCallableParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared DefaultedCallableParameter? compileDefaultedCallableParameter(String code, Anything(JNode,Node) update = noop) {
    if (is JFunctionalParameterDeclaration jParameterDeclarationOrRef = createParser(code).parameterDeclarationOrRef()) {
        return defaultedCallableParameterToCeylon(jParameterDeclarationOrRef, update);
    } else {
        return null;
    }
}
