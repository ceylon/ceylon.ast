import ceylon.ast.core {
    LIdentifier,
    NonemptyCondition,
    SpecifiedVariable,
    Specifier,
    Type,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    nonemptyConditionToCeylon,
    compileNonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonemptyCondition=NonemptyCondition
    }
}

shared object nonemptyCondition satisfies ConcreteTest<NonemptyCondition,JNonemptyCondition> {
    
    String->NonemptyCondition constructV(String->LIdentifier name, String->Specifier specifier, <String->Type|ValueModifier>? type = null)
            => "nonempty `` type?.key else "" `` ``name.key`` ``specifier.key``"->NonemptyCondition(SpecifiedVariable(name.item, specifier.item, type?.item));
    
    String->NonemptyCondition constructI(String->LIdentifier variable)
            => "nonempty ``variable.key``"->NonemptyCondition(variable.item);
    
    shared String->NonemptyCondition nonemptyCollectionCondition = constructI(identifier.collectionLIdentifier);
    shared String->NonemptyCondition nonemptyArgsSpecifyCondition = constructV(identifier.argsLIdentifier, specifier.processArgumentsSequenceSpecifier, tupleType.stringPlusTupleType);
    shared String->NonemptyCondition nonemptyValueArgsSpecifyCondition = constructV(identifier.argsLIdentifier, specifier.processArgumentsSequenceSpecifier, valueModifier.valueModifier);
    
    compile = compileNonemptyCondition;
    fromCeylon = RedHatTransformer.transformNonemptyCondition;
    toCeylon = nonemptyConditionToCeylon;
    codes = [nonemptyCollectionCondition, nonemptyArgsSpecifyCondition, nonemptyValueArgsSpecifyCondition];
}
