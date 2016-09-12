import ceylon.ast.core {
    Annotations,
    Block,
    CallableConstructorDefinition,
    ExtendedType,
    LIdentifier,
    Parameters
}
import ceylon.ast.redhat {
    RedHatTransformer,
    callableConstructorDefinitionToCeylon,
    parseCallableConstructorDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConstructor=Constructor
    }
}

shared object callableConstructorDefinition satisfies ConcreteTest<CallableConstructorDefinition,JConstructor> {
    
    String->CallableConstructorDefinition construct(<String->LIdentifier>? name, String->Parameters parameters, String->Block block, <String->ExtendedType>? extendedType = null, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` new `` name?.key else "" ````parameters.key`` `` extendedType?.key else "" `` ``block.key``"->CallableConstructorDefinition(name?.item, parameters.item, block.item, extendedType?.item, annotations.item);
    
    shared String->CallableConstructorDefinition callableConstructorDefinition = construct(identifier.nameLIdentifier, parameters.notEmptyParameters, block.printPersonNameBlock, extendedType.pointCartesianExtendedType, annotations.sharedAnnotations);
    shared String->CallableConstructorDefinition cartesianConstructorDefinition = construct(identifier.cartesianLIdentifier, parameters.xyParameters, block.cartesianConstructorBlock, null, annotations.sharedAnnotations);
    shared String->CallableConstructorDefinition polarConstructorDefinition = construct(identifier.polarLIdentifier, parameters.rphiParameters, block.polarConstructorBlock, null, annotations.sharedAnnotations);
    shared String->CallableConstructorDefinition defaultConstructorDefinition = construct(null, parameters.emptyParameters, block.emptyBlock);
    
    parse = parseCallableConstructorDefinition;
    fromCeylon = RedHatTransformer.transformCallableConstructorDefinition;
    toCeylon = callableConstructorDefinitionToCeylon;
    codes = [callableConstructorDefinition, cartesianConstructorDefinition, polarConstructorDefinition, defaultConstructorDefinition];
}
