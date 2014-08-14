import ceylon.ast.core {
    Parameter,
    Parameters
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parametersToCeylon,
    compileParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameterList=ParameterList
    }
}

shared object parameters satisfies ConcreteTest<Parameters,JParameterList> {
    
    String->Parameters construct(<String->Parameter>[] parameters)
            => "(``",".join(parameters*.key)``)"->Parameters(parameters*.item);
    
    shared String->Parameters emptyParameters = construct([]);
    shared String->Parameters notEmptyParameters = construct([
            parameterReference.lidParameterReference, valueParameter.annotatedStringLidValueParameter,
            defaultedValueParameter.dynamicByDefaultsto0DefaultedValueParameter,
            variadicParameter.floatStarLidVariadicParameter]);
    
    // not tested directly, but used by other tests
    shared String->Parameters charactersParameters = construct([variadicParameter.charactersVariadicParameter]);
    
    compile = compileParameters;
    fromCeylon = RedHatTransformer.transformParameters;
    toCeylon = parametersToCeylon;
    codes = [emptyParameters, notEmptyParameters];
}
