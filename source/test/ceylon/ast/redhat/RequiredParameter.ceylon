import ceylon.ast.core {
    RequiredParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    requiredParameterToCeylon,
    parseRequiredParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object requiredParameter satisfies AbstractTest<RequiredParameter,JParameter> {
    parse = parseRequiredParameter;
    fromCeylon = RedHatTransformer.transformRequiredParameter;
    toCeylon = requiredParameterToCeylon;
    
    tests = [valueParameter, callableParameter, parameterReference];
}
