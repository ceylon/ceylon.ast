import ceylon.ast.core {
    Annotations,
    CallableParameter,
    LIdentifier,
    Parameters,
    Type,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    callableParameterToCeylon,
    compileCallableParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration
    }
}

shared object callableParameter satisfies ConcreteTest<CallableParameter,JFunctionalParameterDeclaration> {
    
    String->CallableParameter construct(String->Annotations annotations, String->Type|VoidModifier type, String->LIdentifier name, [<String->Parameters>+] parameterLists)
            => "``annotations.key`` ``type.key`` ``name.key````"".join(parameterLists*.key)``"->CallableParameter(annotations.item, type.item, name.item, parameterLists*.item);
    
    shared String->CallableParameter emptyCallableParameter = construct(annotations.emptyAnnotations, voidModifier.voidModifier, identifier.byLIdentifier, [parameters.emptyParameters]);
    shared String->CallableParameter notEmptyCallableParameter = construct(annotations.helloSharedByLucasAnnotations, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType, identifier.lidLIdentifier, [parameters.notEmptyParameters, parameters.emptyParameters]);
    
    compile = compileCallableParameter;
    fromCeylon = RedHatTransformer.transformCallableParameter;
    toCeylon = callableParameterToCeylon;
    codes = [emptyCallableParameter, notEmptyCallableParameter];
}
