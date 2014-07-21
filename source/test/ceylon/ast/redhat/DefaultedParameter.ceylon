import ceylon.ast.core {
    DefaultedParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedParameterToCeylon,
    compileDefaultedParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object defaultedParameter satisfies AbstractTest<DefaultedParameter,JParameter> {
    compile = compileDefaultedParameter;
    fromCeylon = RedHatTransformer.transformDefaultedParameter;
    toCeylon = defaultedParameterToCeylon;
    
    tests = [defaultedParameterReference];
}
