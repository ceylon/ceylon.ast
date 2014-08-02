import ceylon.ast.core {
    Annotations,
    ValueDeclaration,
    DynamicModifier,
    LIdentifier,
    Type,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueDeclarationToCeylon,
    compileValueDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration
    }
}

shared object valueDeclaration satisfies ConcreteTest<ValueDeclaration,JAttributeDeclaration> {
    
    String->ValueDeclaration construct(String->LIdentifier name, String->Type|VariadicType|DynamicModifier type, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key``;"->ValueDeclaration(name.item, type.item, annotations.item);
    
    shared String->ValueDeclaration lidValueDeclaration = construct(identifier.lidLIdentifier, dynamicModifier.dynamicModifier, annotations.emptyAnnotations);
    shared String->ValueDeclaration annotatedByValueDeclaration = construct(identifier.byLIdentifier, unionType.stringOrIntegerOrFloatUnionType, annotations.helloSharedByLucasAnnotations);
    shared String->ValueDeclaration variadicValueDeclaration = construct(identifier.lidLIdentifier, variadicType.iterableOfStringPlusType, annotations.emptyAnnotations);
    
    compile = compileValueDeclaration;
    fromCeylon = RedHatTransformer.transformValueDeclaration;
    toCeylon = valueDeclarationToCeylon;
    codes = [lidValueDeclaration, annotatedByValueDeclaration];
}
