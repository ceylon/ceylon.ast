import ceylon.ast.core {
    Annotations,
    Block,
    ConstructorDefinition,
    ExtendedType,
    Parameters,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    constructorDefinitionToCeylon,
    compileConstructorDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConstructor=Constructor
    }
}

shared object constructorDefinition satisfies ConcreteTest<ConstructorDefinition,JConstructor> {
    
    String->ConstructorDefinition construct(String->UIdentifier name, String->Parameters parameters, String->Block block, <String->ExtendedType>? extendedType, String->Annotations annotations)
            => "``annotations.key`` new ``name.key````parameters.key`` `` extendedType?.key else "" `` ``block.key``"->ConstructorDefinition(name.item, parameters.item, block.item, extendedType?.item, annotations.item);
    
    shared String->ConstructorDefinition constructorDefinition = construct(identifier.typeNameUIdentifier, parameters.notEmptyParameters, block.printPersonNameBlock, extendedType.extendsSuperEntry, annotations.sharedAnnotations);
    // TODO better tests
    
    compile = compileConstructorDefinition;
    fromCeylon = RedHatTransformer.transformConstructorDefinition;
    toCeylon = constructorDefinitionToCeylon;
    codes = [constructorDefinition];
}
