import ceylon.ast.core {
    Annotations,
    Block,
    DynamicModifier,
    LIdentifier,
    Type,
    ValueGetterDefinition,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueGetterDefinitionToCeylon,
    parseValueGetterDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeGetterDefinition=AttributeGetterDefinition
    }
}

shared object valueGetterDefinition satisfies ConcreteTest<ValueGetterDefinition,JAttributeGetterDefinition> {
    
    String->ValueGetterDefinition construct(String->LIdentifier name, String->Type|ValueModifier|DynamicModifier type, String->Block definition, String->Annotations annotations)
            => "``annotations.key`` ``type.key`` ``name.key````definition.key``"->ValueGetterDefinition(name.item, type.item, definition.item, annotations.item);
    
    shared String->ValueGetterDefinition lidValueGetterDefinition = construct(identifier.lidLIdentifier, valueModifier.valueModifier, block.emptyBlock, annotations.emptyAnnotations);
    shared String->ValueGetterDefinition annotatedByValueGetterDefinition = construct(identifier.byLIdentifier, valueModifier.valueModifier, block.emptyBlock, annotations.helloSharedByLucasAnnotations);
    
    parse = parseValueGetterDefinition;
    fromCeylon = RedHatTransformer.transformValueGetterDefinition;
    toCeylon = valueGetterDefinitionToCeylon;
    codes = [lidValueGetterDefinition];
}
