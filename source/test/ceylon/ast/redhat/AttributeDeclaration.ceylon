import ceylon.ast.core {
    Annotations,
    AttributeDeclaration,
    DynamicModifier,
    LIdentifier,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    attributeDeclarationToCeylon,
    compileAttributeDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration
    }
}

shared object attributeDeclaration satisfies ConcreteTest<AttributeDeclaration,JAttributeDeclaration> {
    
    String->AttributeDeclaration construct(String->LIdentifier name, String->Type|DynamicModifier type, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key``;"->AttributeDeclaration(name.item, type.item, annotations.item);
    
    shared String->AttributeDeclaration lidAttributeDeclaration = construct(identifier.lidLIdentifier, dynamicModifier.dynamicModifier, annotations.emptyAnnotations);
    shared String->AttributeDeclaration annotatedByDeclaration = construct(identifier.byLIdentifier, unionType.stringOrIntegerOrFloatUnionType, annotations.helloSharedByLucasAnnotations);
    
    compile = compileAttributeDeclaration;
    fromCeylon = RedHatTransformer.transformAttributeDeclaration;
    toCeylon = attributeDeclarationToCeylon;
    codes = [lidAttributeDeclaration, annotatedByDeclaration];
}
