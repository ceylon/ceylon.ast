import ceylon.ast.core {
    Parameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parameterToCeylon,
    compileParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object parameter satisfies AbstractTest<Parameter,JParameter> {
    compile = compileParameter;
    fromCeylon = RedHatTransformer.transformParameter;
    toCeylon = parameterToCeylon;
    
    tests = [requiredParameter];
}
