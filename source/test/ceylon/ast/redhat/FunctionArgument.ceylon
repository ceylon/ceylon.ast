import ceylon.ast.core {
    Block,
    DynamicModifier,
    FunctionArgument,
    FunctionModifier,
    LazySpecifier,
    LIdentifier,
    Parameters,
    Type,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionArgumentToCeylon,
    parseFunctionArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMethodArgument=MethodArgument
    }
}

shared object functionArgument satisfies ConcreteTest<FunctionArgument,JMethodArgument> {
    
    String->FunctionArgument construct(String->LIdentifier name, String->Type|VoidModifier|FunctionModifier|DynamicModifier type, [<String->Parameters>+] parameterLists, String->Block|LazySpecifier definition)
            => "``type.key`` ``name.key`` ``"".join(parameterLists*.key)`` ``definition.key``" -> FunctionArgument(name.item, type.item, parameterLists*.item, definition.item);
    
    shared String->FunctionArgument mapFunctionArgument = construct(identifier.mapLIdentifier, functionModifier.functionModifier, [parameters.charactersParameters, parameters.emptyParameters], lazySpecifier.assignLazySpecifier);
    shared String->FunctionArgument eFunctionArgument = construct(identifier.eLIdentifier, voidModifier.voidModifier, [parameters.notEmptyParameters], block.printPersonNameBlock);
    shared String->FunctionArgument charactersFunctionArgument = construct(identifier.charactersLIdentifier, baseType.stringType, [parameters.emptyParameters], block.emptyBlock);
    
    parse = parseFunctionArgument;
    fromCeylon = RedHatTransformer.transformFunctionArgument;
    toCeylon = functionArgumentToCeylon;
    codes = [mapFunctionArgument, eFunctionArgument, charactersFunctionArgument];
}
