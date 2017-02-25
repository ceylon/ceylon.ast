import ceylon.ast.core {
    Block,
    FunctionExpression,
    FunctionModifier,
    LazySpecifier,
    Parameters,
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionExpressionToCeylon,
    parseFunctionExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionArgument=FunctionArgument
    }
}

shared object functionExpression satisfies ConcreteTest<FunctionExpression,JFunctionArgument> {
    
    String->FunctionExpression construct([<String->Parameters>+] parameterLists, String->LazySpecifier|Block definition, <String->FunctionModifier|VoidModifier>? type = null)
            => "`` type?.key else "" ````"".join(parameterLists*.key)````definition.key``" -> FunctionExpression(parameterLists*.item, definition.item, type?.item);
    
    shared String->FunctionExpression emptyNoopFunctionExpression = construct([parameters.emptyParameters], block.emptyBlock);
    shared String->FunctionExpression functionFunctionExpression = construct([parameters.charactersParameters, parameters.emptyParameters], lazySpecifier.aTimesBPlusCLazySpecifier, functionModifier.functionModifier);
    shared String->FunctionExpression voidFunctionExpression = construct([parameters.notEmptyParameters], block.emptyBlock, voidModifier.voidModifier);
    
    parse = parseFunctionExpression;
    fromCeylon = RedHatTransformer.transformFunctionExpression;
    toCeylon = functionExpressionToCeylon;
    codes = [emptyNoopFunctionExpression, functionFunctionExpression, voidFunctionExpression];
}
