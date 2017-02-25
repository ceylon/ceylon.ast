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
    parseValueDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration
    }
}

shared object valueDeclaration satisfies ConcreteTest<ValueDeclaration,JAttributeDeclaration> {
    
    String->ValueDeclaration construct(String->LIdentifier name, String->Type|VariadicType|DynamicModifier type, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key``;" -> ValueDeclaration(name.item, type.item, annotations.item);
    
    shared String->ValueDeclaration lidValueDeclaration = construct(identifier.lidLIdentifier, dynamicModifier.dynamicModifier, annotations.emptyAnnotations);
    shared String->ValueDeclaration annotatedByValueDeclaration = construct(identifier.byLIdentifier, unionType.stringOrIntegerOrFloatUnionType, annotations.helloSharedByLucasAnnotations);
    shared String->ValueDeclaration variadicValueDeclaration = construct(identifier.lidLIdentifier, variadicType.iterableOfStringPlusType, annotations.emptyAnnotations);
    
    // not tested directly, but used by other tests
    shared String->ValueDeclaration floatXDeclaration = construct(identifier.xLIdentifier, baseType.floatType, annotations.emptyAnnotations);
    shared String->ValueDeclaration floatYDeclaration = construct(identifier.yLIdentifier, baseType.floatType, annotations.emptyAnnotations);
    shared String->ValueDeclaration floatRDeclaration = construct(identifier.rLIdentifier, baseType.floatType, annotations.emptyAnnotations);
    shared String->ValueDeclaration floatPhiDeclaration = construct(identifier.phiLIdentifier, baseType.floatType, annotations.emptyAnnotations);
    shared String->ValueDeclaration sharedFloatXDeclaration = construct(identifier.xLIdentifier, baseType.floatType, annotations.sharedAnnotations);
    shared String->ValueDeclaration sharedFloatYDeclaration = construct(identifier.yLIdentifier, baseType.floatType, annotations.sharedAnnotations);
    shared String->ValueDeclaration sharedFloatRDeclaration = construct(identifier.rLIdentifier, baseType.floatType, annotations.sharedAnnotations);
    shared String->ValueDeclaration sharedFloatPhiDeclaration = construct(identifier.phiLIdentifier, baseType.floatType, annotations.sharedAnnotations);
    
    parse = parseValueDeclaration;
    fromCeylon = RedHatTransformer.transformValueDeclaration;
    toCeylon = valueDeclarationToCeylon;
    codes = [lidValueDeclaration, annotatedByValueDeclaration];
}
