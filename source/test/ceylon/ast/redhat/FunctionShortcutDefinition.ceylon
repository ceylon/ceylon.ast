import ceylon.ast.core {
    Annotations,
    DynamicModifier,
    FunctionModifier,
    FunctionShortcutDefinition,
    LIdentifier,
    LazySpecifier,
    Parameters,
    TypeConstraint,
    TypeParameters,
    Type,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionShortcutDefinitionToCeylon,
    parseFunctionShortcutDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMethodDeclaration=MethodDeclaration
    }
}

shared object functionShortcutDefinition satisfies ConcreteTest<FunctionShortcutDefinition,JMethodDeclaration> {
    
    String->FunctionShortcutDefinition construct(String->LIdentifier name, String->Type|VoidModifier|FunctionModifier|DynamicModifier type, [<String->Parameters>+] parameterLists, String->LazySpecifier definition, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` ``type.key`` ``name.key`` `` typeParameters?.key else "" `` ``"".join(parameterLists*.key)`` ``" ".join(typeConstraints*.key)`` ``definition.key``;"->FunctionShortcutDefinition(name.item, type.item, parameterLists*.item, definition.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->FunctionShortcutDefinition nonemptyFunctionShortcutDefinition = construct(identifier.lidLIdentifier, baseType.integerType, [parameters.notEmptyParameters], lazySpecifier.aTimesBPlusCLazySpecifier);
    
    parse = parseFunctionShortcutDefinition;
    fromCeylon = RedHatTransformer.transformFunctionShortcutDefinition;
    toCeylon = functionShortcutDefinitionToCeylon;
    codes = [nonemptyFunctionShortcutDefinition];
}
