import ceylon.ast.core {
    Parameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parameterToCeylon,
    parseParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object parameter satisfies AbstractTest<Parameter,JParameter> {
    parse = parseParameter;
    fromCeylon = RedHatTransformer.transformParameter;
    toCeylon = parameterToCeylon;
    
    tests = [requiredParameter, defaultedParameter, variadicParameter];
}
