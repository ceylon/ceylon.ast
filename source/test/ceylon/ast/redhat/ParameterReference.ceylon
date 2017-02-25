import ceylon.ast.core {
    ParameterReference,
    MemberName
}
import ceylon.ast.redhat {
    RedHatTransformer,
    parameterReferenceToCeylon,
    parseParameterReference
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInitializerParameter=InitializerParameter
    }
}

shared object parameterReference satisfies ConcreteTest<ParameterReference,JInitializerParameter> {
    
    String->ParameterReference construct(String->MemberName name)
            => name.key -> ParameterReference(name.item);
    
    shared String->ParameterReference lidParameterReference = construct(identifier.lidLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->ParameterReference xParameterReference = construct(identifier.xLIdentifier);
    shared String->ParameterReference yParameterReference = construct(identifier.yLIdentifier);
    shared String->ParameterReference rParameterReference = construct(identifier.rLIdentifier);
    shared String->ParameterReference phiParameterReference = construct(identifier.phiLIdentifier);
    
    parse = parseParameterReference;
    fromCeylon = RedHatTransformer.transformParameterReference;
    toCeylon = parameterReferenceToCeylon;
    codes = [lidParameterReference];
}
