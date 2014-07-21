import ceylon.ast.core {
    DefaultedParameterReference,
    ParameterReference,
    Specifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedParameterReferenceToCeylon,
    compileDefaultedParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

shared object defaultedParameterReference satisfies ConcreteTest<DefaultedParameterReference,JInitializerParameter> {
    
    String->DefaultedParameterReference construct(String->ParameterReference parameter, String->Specifier specifier)
            => "``parameter.key````specifier.key``"->DefaultedParameterReference(parameter.item, specifier.item);
    
    shared String->DefaultedParameterReference lidDefaultstoNameElseWorldDefaultedParameterReference = construct(parameterReference.lidParameterReference, specifier.nameElseWorldStringLiteralGroupedSpecifier);
    
    compile = compileDefaultedParameterReference;
    fromCeylon = RedHatTransformer.transformDefaultedParameterReference;
    toCeylon = defaultedParameterReferenceToCeylon;
    codes = [lidDefaultstoNameElseWorldDefaultedParameterReference];
}
