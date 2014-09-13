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
    
    String->ValueParameter construct(String->Annotations annotations, String->Type|DynamicModifier type, String->LIdentifier name)
            => "``annotations.key`` ``type.key`` ``name.key``"->ValueParameter(annotations.item, type.item, name.item);
    
    shared String->ValueParameter dynamicByValueParameter = construct(annotations.emptyAnnotations, dynamicModifier.dynamicModifier, identifier.byLIdentifier);
    shared String->ValueParameter annotatedStringLidValueParameter = construct(annotations.helloSharedByLucasAnnotations, baseType.stringType, identifier.lidLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->ValueParameter objectThatParameter = construct(annotations.emptyAnnotations, baseType.objectType, identifier.thatLIdentifier);
    
    compile = compileValueParameter;
    fromCeylon = RedHatTransformer.transformValueParameter;
    toCeylon = valueParameterToCeylon;
    codes = [dynamicByValueParameter, annotatedStringLidValueParameter];
}
