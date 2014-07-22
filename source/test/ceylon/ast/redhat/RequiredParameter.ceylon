import ceylon.ast.core {
    RequiredParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    requiredParameterToCeylon,
    compileRequiredParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object requiredParameter satisfies AbstractTest<RequiredParameter,JParameter> {
    compile = compileRequiredParameter;
    fromCeylon = RedHatTransformer.transformRequiredParameter;
    toCeylon = requiredParameterToCeylon;
    
    tests = [valueParameter, parameterReference];
}
