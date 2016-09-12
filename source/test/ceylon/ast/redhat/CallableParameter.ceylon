import ceylon.ast.core {
    Annotations,
    CallableParameter,
    DynamicModifier,
    FunctionModifier,
    LIdentifier,
    Parameters,
    Type,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    callableParameterToCeylon,
    parseCallableParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration
    }
}

shared object callableParameter satisfies ConcreteTest<CallableParameter,JFunctionalParameterDeclaration> {
    
    String->CallableParameter construct(String->Annotations annotations, String->Type|VoidModifier|FunctionModifier|DynamicModifier type, String->LIdentifier name, [<String->Parameters>+] parameterLists)
            => "``annotations.key`` ``type.key`` ``name.key````"".join(parameterLists*.key)``"->CallableParameter(type.item, name.item, parameterLists*.item, annotations.item);
    
    shared String->CallableParameter emptyCallableParameter = construct(annotations.emptyAnnotations, voidModifier.voidModifier, identifier.byLIdentifier, [parameters.emptyParameters]);
    shared String->CallableParameter notEmptyCallableParameter = construct(annotations.helloSharedByLucasAnnotations, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType, identifier.lidLIdentifier, [parameters.notEmptyParameters, parameters.emptyParameters]);
    shared String->CallableParameter functionCallableParameter = construct(annotations.emptyAnnotations, functionModifier.functionModifier, identifier.byLIdentifier, [parameters.emptyParameters]);
    shared String->CallableParameter dynamicCallableParameter = construct(annotations.emptyAnnotations, dynamicModifier.dynamicModifier, identifier.byLIdentifier, [parameters.emptyParameters]);
    
    parse = parseCallableParameter;
    fromCeylon = RedHatTransformer.transformCallableParameter;
    toCeylon = callableParameterToCeylon;
    codes = [emptyCallableParameter, notEmptyCallableParameter, functionCallableParameter, dynamicCallableParameter];
}
