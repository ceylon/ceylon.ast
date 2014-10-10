import ceylon.ast.core {
    Annotations,
    DynamicModifier,
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
    
    String->ValueParameter construct(String->Type|DynamicModifier type, String->LIdentifier name, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` ``type.key`` ``name.key``"->ValueParameter(type.item, name.item, annotations.item);
    
    shared String->ValueParameter dynamicByValueParameter = construct(dynamicModifier.dynamicModifier, identifier.byLIdentifier);
    shared String->ValueParameter annotatedStringLidValueParameter = construct(baseType.stringType, identifier.lidLIdentifier, annotations.helloSharedByLucasAnnotations);
    
    // not tested directly, but used by other tests
    shared String->ValueParameter objectThatParameter = construct(baseType.objectType, identifier.thatLIdentifier);
    
    compile = compileValueParameter;
    fromCeylon = RedHatTransformer.transformValueParameter;
    toCeylon = valueParameterToCeylon;
    codes = [dynamicByValueParameter, annotatedStringLidValueParameter];
}
