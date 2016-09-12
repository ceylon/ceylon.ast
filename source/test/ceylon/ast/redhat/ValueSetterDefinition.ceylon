import ceylon.ast.core {
    Annotations,
    Block,
    LazySpecifier,
    LIdentifier,
    ValueSetterDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueSetterDefinitionToCeylon,
    parseValueSetterDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeSetterDefinition=AttributeSetterDefinition
    }
}

shared object valueSetterDefinition satisfies ConcreteTest<ValueSetterDefinition,JAttributeSetterDefinition> {
    
    String->ValueSetterDefinition construct(String->LIdentifier name, String->Block|LazySpecifier definition, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` assign ``name.key````definition.key```` definition.item is LazySpecifier then ";" else "" ``"->ValueSetterDefinition(name.item, definition.item, annotations.item);
    
    shared String->ValueSetterDefinition noopValueSetterDefinition = construct(identifier.noopLIdentifier, block.emptyBlock);
    shared String->ValueSetterDefinition nameValueSetterDefinition = construct(identifier.nameLIdentifier, lazySpecifier.assignLazySpecifier);
    
    parse = parseValueSetterDefinition;
    fromCeylon = RedHatTransformer.transformValueSetterDefinition;
    toCeylon = valueSetterDefinitionToCeylon;
    codes = [noopValueSetterDefinition, nameValueSetterDefinition];
}
