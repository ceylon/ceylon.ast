import ceylon.ast.core {
    DefaultedParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedParameterToCeylon,
    parseDefaultedParameter
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JParameter=Parameter
    }
}

shared object defaultedParameter satisfies AbstractTest<DefaultedParameter,JParameter> {
    parse = parseDefaultedParameter;
    fromCeylon = RedHatTransformer.transformDefaultedParameter;
    toCeylon = defaultedParameterToCeylon;
    
    tests = [defaultedValueParameter, defaultedCallableParameter, defaultedParameterReference];
}
