import ceylon.ast.core {
    Annotations,
    CallableParameter,
    DynamicModifier,
    FunctionModifier,
    Node,
    Type,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JFunctionModifier=FunctionModifier,
        JMethodDeclaration=MethodDeclaration,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[FunctionalParameterDeclaration|JFunctionalParameterDeclaration]] to a `ceylon.ast` [[CallableParameter]]."
shared CallableParameter callableParameterToCeylon(JFunctionalParameterDeclaration callableParameter, Anything(JNode, Node) update = noop) {
    assert (is JMethodDeclaration dec = callableParameter.typedDeclaration);
    assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = dec.type);
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType, update); }
    case (is JFunctionModifier) { type = functionModifierToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    assert (nonempty parameterLists = CeylonIterable(dec.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
    value result = CallableParameter {
        type;
        lIdentifierToCeylon(dec.identifier, update);
        parameterLists;
        dec.annotationList exists
                then annotationsToCeylon(dec.annotationList, update)
                else Annotations();
    };
    update(callableParameter, result);
    return result;
}

"Parses the given [[code]] for a Callable Parameter
 into a [[CallableParameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameter`)."
shared CallableParameter? parseCallableParameter(String code, Anything(JNode, Node) update = noop) {
    if (is JFunctionalParameterDeclaration jParameter = createParser(code).parameterDeclarationOrRef()) {
        return callableParameterToCeylon(jParameter, update);
    } else {
        return null;
    }
}
