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
    
    String->ConstructorDefinition construct(<String->UIdentifier>? name, String->Parameters parameters, String->Block block, <String->ExtendedType>? extendedType = null, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` new `` name?.key else "" ````parameters.key`` `` extendedType?.key else "" `` ``block.key``"->ConstructorDefinition(name?.item, parameters.item, block.item, extendedType?.item, annotations.item);
    
    shared String->ConstructorDefinition constructorDefinition = construct(identifier.typeNameUIdentifier, parameters.notEmptyParameters, block.printPersonNameBlock, extendedType.extendsSuperEntry, annotations.sharedAnnotations);
    shared String->ConstructorDefinition cartesianConstructorDefinition = construct(identifier.cartesianUIdentifier, parameters.xyParameters, block.cartesianConstructorBlock, null, annotations.sharedAnnotations);
    shared String->ConstructorDefinition polarConstructorDefinition = construct(identifier.polarUIdentifier, parameters.rphiParameters, block.polarConstructorBlock, null, annotations.sharedAnnotations);
    shared String->ConstructorDefinition defaultConstructorDefinition = construct(null, parameters.emptyParameters, block.emptyBlock);
    
    compile = compileConstructorDefinition;
    fromCeylon = RedHatTransformer.transformConstructorDefinition;
    toCeylon = constructorDefinitionToCeylon;
    codes = [constructorDefinition, cartesianConstructorDefinition, polarConstructorDefinition, defaultConstructorDefinition];
}
