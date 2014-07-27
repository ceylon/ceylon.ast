import ceylon.ast.core {
    CallableParameter,
    DefaultedCallableParameter,
    LazySpecifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedCallableParameterToCeylon,
    compileDefaultedCallableParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration
    }
}

shared object defaultedCallableParameter satisfies ConcreteTest<DefaultedCallableParameter,JFunctionalParameterDeclaration> {
    
    String->DefaultedCallableParameter construct(String->CallableParameter parameter, String->LazySpecifier specifier)
            => "``parameter.key````specifier.key``"->DefaultedCallableParameter(parameter.item, specifier.item);
    
    shared String->DefaultedCallableParameter notEmptyDefaultedCallableParameter = construct(callableParameter.notEmptyCallableParameter, lazySpecifier.aTimesBPlusCLazySpecifier);
    
    compile = compileDefaultedCallableParameter;
    fromCeylon = RedHatTransformer.transformDefaultedCallableParameter;
    toCeylon = defaultedCallableParameterToCeylon;
    codes = [notEmptyDefaultedCallableParameter];
}
