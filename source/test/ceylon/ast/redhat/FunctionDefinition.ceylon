import ceylon.ast.core {
    Annotations,
    Block,
    DynamicModifier,
    FunctionDefinition,
    FunctionModifier,
    LIdentifier,
    Parameters,
    TypeConstraint,
    TypeParameters,
    Type,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionDefinitionToCeylon,
    parseFunctionDefinition
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMethodDefinition=MethodDefinition
    }
}

shared object functionDefinition satisfies ConcreteTest<FunctionDefinition,JMethodDefinition> {
    
    String->FunctionDefinition construct(String->LIdentifier name, String->Type|VoidModifier|FunctionModifier|DynamicModifier type, [<String->Parameters>+] parameterLists, String->Block definition, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` ``type.key`` ``name.key`` `` typeParameters?.key else "" `` ``"".join(parameterLists*.key)`` ``" ".join(typeConstraints*.key)`` ``definition.key``" -> FunctionDefinition(name.item, type.item, parameterLists*.item, definition.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->FunctionDefinition noopFunctionDefinition = construct(identifier.noopLIdentifier, voidModifier.voidModifier, [parameters.emptyParameters], block.emptyBlock);
    shared String->FunctionDefinition nonemptyFunctionDefinition = construct(identifier.lidLIdentifier, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType, [parameters.notEmptyParameters, parameters.emptyParameters], block.emptyBlock, typeParameters.twoTypeParameters, [typeConstraint.nonemptyTypeConstraint], annotations.helloSharedByLucasAnnotations);
    
    parse = parseFunctionDefinition;
    fromCeylon = RedHatTransformer.transformFunctionDefinition;
    toCeylon = functionDefinitionToCeylon;
    codes = [noopFunctionDefinition, nonemptyFunctionDefinition];
}
