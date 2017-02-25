import ceylon.ast.core {
    Annotations,
    Block,
    ExtendedType,
    LIdentifier,
    ValueConstructorDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueConstructorDefinitionToCeylon,
    parseValueConstructorDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEnumerated=Enumerated
    }
}

shared object valueConstructorDefinition satisfies ConcreteTest<ValueConstructorDefinition,JEnumerated> {
    
    String->ValueConstructorDefinition construct(String->LIdentifier name, String->Block block, <String->ExtendedType>? extendedType = null, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` new ``name.key`` `` extendedType?.key else "" `` ``block.key``" -> ValueConstructorDefinition(name.item, block.item, extendedType?.item, annotations.item);
    
    shared String->ValueConstructorDefinition originValueConstructorDefinition = construct(identifier.originLIdentifier, block.originValueConstructorBlock, null, annotations.sharedAnnotations);
    
    parse = parseValueConstructorDefinition;
    fromCeylon = RedHatTransformer.transformValueConstructorDefinition;
    toCeylon = valueConstructorDefinitionToCeylon;
    codes = [originValueConstructorDefinition];
}
