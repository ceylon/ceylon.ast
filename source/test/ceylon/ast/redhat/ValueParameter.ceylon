import ceylon.ast.core {
    Annotations,
    LIdentifier,
    Type,
    ValueParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueParameterToCeylon,
    compileValueParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

shared object valueParameter satisfies ConcreteTest<ValueParameter,JValueParameterDeclaration> {
    
    String->ValueParameter construct(String->Annotations annotations, <String->Type>? type, String->LIdentifier name)
            => "``annotations.key`` `` type?.key else "dynamic" `` ``name.key``"->ValueParameter(annotations.item, type?.item, name.item);
    
    shared String->ValueParameter dynamicByValueParameter = construct(annotations.emptyAnnotations, null, identifier.byLIdentifier);
    shared String->ValueParameter annotatedStringLidValueParameter = construct(annotations.helloSharedByLucasAnnotations, baseType.stringType, identifier.lidLIdentifier);
    
    compile = compileValueParameter;
    fromCeylon = RedHatTransformer.transformValueParameter;
    toCeylon = valueParameterToCeylon;
    codes = [dynamicByValueParameter, annotatedStringLidValueParameter];
}
