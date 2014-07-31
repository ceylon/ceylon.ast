import ceylon.ast.core {
    Annotations,
    AnySpecifier,
    AttributeDefinition,
    DynamicModifier,
    LIdentifier,
    Type,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    attributeDefinitionToCeylon,
    compileAttributeDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration
    }
}

shared object attributeDefinition satisfies ConcreteTest<AttributeDefinition,JAttributeDeclaration> {
    
    String->AttributeDefinition construct(String->LIdentifier name, String->Type|ValueModifier|DynamicModifier type, String->AnySpecifier definition, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key````definition.key``"->AttributeDefinition(name.item, type.item, definition.item, annotations.item);
    
    shared String->AttributeDefinition lidAttributeDefinition = construct(identifier.lidLIdentifier, valueModifier.valueModifier, specifier._0Specifier, annotations.emptyAnnotations);
    shared String->AttributeDefinition annotatedByAttributeDefinition = construct(identifier.byLIdentifier, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType, lazySpecifier.aTimesBPlusCLazySpecifier, annotations.helloSharedByLucasAnnotations);
    
    compile = compileAttributeDefinition;
    fromCeylon = RedHatTransformer.transformAttributeDefinition;
    toCeylon = attributeDefinitionToCeylon;
    codes = [lidAttributeDefinition, annotatedByAttributeDefinition];
}
