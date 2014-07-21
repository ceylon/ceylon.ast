import ceylon.ast.core {
    ParameterReference,
    MemberName
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parameterReferenceToCeylon,
    compileParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

shared object parameterReference satisfies ConcreteTest<ParameterReference,JInitializerParameter> {
    
    String->ParameterReference construct(String->MemberName name)
            => name.key->ParameterReference(name.item);
    
    shared String->ParameterReference lidParameterReference = construct(identifier.lidLIdentifier);
    
    compile = compileParameterReference;
    fromCeylon = RedHatTransformer.transformParameterReference;
    toCeylon = parameterReferenceToCeylon;
    codes = [lidParameterReference];
}
