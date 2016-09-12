import ceylon.ast.core {
    AnySpecifier,
    Block,
    LIdentifier,
    DynamicModifier,
    Type,
    ValueArgument,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueArgumentToCeylon,
    parseValueArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeArgument=AttributeArgument
    }
}

shared object valueArgument satisfies ConcreteTest<ValueArgument,JAttributeArgument> {
    
    String->ValueArgument construct(String->LIdentifier name, String->Type|ValueModifier|DynamicModifier type, String->AnySpecifier|Block definition)
            => "``type.key`` ``name.key`` ``definition.key```` definition.item is AnySpecifier then ";" else "" ``"->ValueArgument(name.item, type.item, definition.item);
    
    shared String->ValueArgument index0ValueArgument = construct(identifier.indexLIdentifier, valueModifier.valueModifier, specifier.oneSpecifier);
    shared String->ValueArgument charValueArgument = construct(identifier.charLIdentifier, baseType.characterType, block.emptyBlock);
    
    parse = parseValueArgument;
    fromCeylon = RedHatTransformer.transformValueArgument;
    toCeylon = valueArgumentToCeylon;
    codes = [index0ValueArgument, charValueArgument];
}
