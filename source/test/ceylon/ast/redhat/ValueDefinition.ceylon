import ceylon.ast.core {
    Annotations,
    AnySpecifier,
    ValueDefinition,
    DynamicModifier,
    LIdentifier,
    Type,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueDefinitionToCeylon,
    parseValueDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration
    }
}

shared object valueDefinition satisfies ConcreteTest<ValueDefinition,JAttributeDeclaration> {
    
    String->ValueDefinition construct(String->LIdentifier name, String->Type|ValueModifier|DynamicModifier type, String->AnySpecifier definition, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key````definition.key``;"->ValueDefinition(name.item, type.item, definition.item, annotations.item);
    
    shared String->ValueDefinition lidValueDefinition = construct(identifier.lidLIdentifier, valueModifier.valueModifier, specifier._0Specifier, annotations.emptyAnnotations);
    shared String->ValueDefinition annotatedByValueDefinition = construct(identifier.byLIdentifier, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType, lazySpecifier.aTimesBPlusCLazySpecifier, annotations.helloSharedByLucasAnnotations);
    
    // not tested directly, but used by other tests
    shared String->ValueDefinition stringDefinition = construct(identifier.stringLIdentifier, baseType.stringType, lazySpecifier.xyStringSpecifier, annotations.sharedActualAnnotations);
    
    parse = parseValueDefinition;
    fromCeylon = RedHatTransformer.transformValueDefinition;
    toCeylon = valueDefinitionToCeylon;
    codes = [lidValueDefinition, annotatedByValueDefinition];
}
