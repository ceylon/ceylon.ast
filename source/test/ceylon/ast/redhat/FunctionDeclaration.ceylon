import ceylon.ast.core {
    Annotations,
    DynamicModifier,
    FunctionDeclaration,
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
    functionDeclarationToCeylon,
    parseFunctionDeclaration
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMethodDeclaration=MethodDeclaration
    }
}

shared object functionDeclaration satisfies ConcreteTest<FunctionDeclaration,JMethodDeclaration> {
    
    String->FunctionDeclaration construct(String->LIdentifier name, String->Type|VoidModifier|FunctionModifier|DynamicModifier type, [<String->Parameters>+] parameterLists, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` ``type.key`` ``name.key```` typeParameters?.key else "" ````"".join(parameterLists*.key)````"".join(typeConstraints*.key)``;" -> FunctionDeclaration(name.item, type.item, parameterLists*.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->FunctionDeclaration voidFunctionDeclaration = construct(identifier.byLIdentifier, voidModifier.voidModifier, [parameters.emptyParameters]);
    shared String->FunctionDeclaration nonemptyFunctionDeclaration = construct(identifier.sharedLIdentifier, unionType.stringOrIntegerOrFloatUnionType, [parameters.notEmptyParameters, parameters.emptyParameters], typeParameters.twoTypeParameters, [typeConstraint.nonemptyTypeConstraint], annotations.helloSharedByLucasAnnotations);
    shared String->FunctionDeclaration functionFunctionDeclaration = construct(identifier.byLIdentifier, functionModifier.functionModifier, [parameters.emptyParameters]);
    shared String->FunctionDeclaration dynamicFunctionDeclaration = construct(identifier.byLIdentifier, dynamicModifier.dynamicModifier, [parameters.emptyParameters]);
    
    parse = parseFunctionDeclaration;
    fromCeylon = RedHatTransformer.transformFunctionDeclaration;
    toCeylon = functionDeclarationToCeylon;
    codes = [voidFunctionDeclaration, nonemptyFunctionDeclaration, functionFunctionDeclaration, dynamicFunctionDeclaration];
}
