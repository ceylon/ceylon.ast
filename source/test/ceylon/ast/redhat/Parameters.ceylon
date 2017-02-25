import ceylon.ast.core {
    Parameter,
    Parameters
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parametersToCeylon,
    parseParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameterList=ParameterList
    }
}

shared object parameters satisfies ConcreteTest<Parameters,JParameterList> {
    
    String->Parameters construct(<String->Parameter>[] parameters)
            => "(``",".join(parameters*.key)``)" -> Parameters(parameters*.item);
    
    shared String->Parameters emptyParameters = construct([]);
    shared String->Parameters notEmptyParameters = construct([
            parameterReference.lidParameterReference, valueParameter.annotatedStringLidValueParameter,
            defaultedValueParameter.dynamicByDefaultsto0DefaultedValueParameter,
            variadicParameter.floatStarLidVariadicParameter]);
    
    // not tested directly, but used by other tests
    shared String->Parameters charactersParameters = construct([variadicParameter.charactersVariadicParameter]);
    shared String->Parameters thatParameters = construct([valueParameter.objectThatParameter]);
    shared String->Parameters xyParameters = construct([parameterReference.xParameterReference, parameterReference.yParameterReference]);
    shared String->Parameters rphiParameters = construct([parameterReference.rParameterReference, parameterReference.phiParameterReference]);
    
    parse = parseParameters;
    fromCeylon = RedHatTransformer.transformParameters;
    toCeylon = parametersToCeylon;
    codes = [emptyParameters, notEmptyParameters];
}
