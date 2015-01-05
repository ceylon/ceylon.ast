import ceylon.ast.core {
    LIdentifier,
    NonemptyCondition,
    Pattern,
    SpecifiedPattern,
    Specifier
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
    
    String->NonemptyCondition constructP(String->Pattern pattern, String->Specifier specifier)
            => "nonempty ``pattern.key`` = ``specifier.key``"->NonemptyCondition(SpecifiedPattern(pattern.item, specifier.item));
    
    String->NonemptyCondition constructI(String->LIdentifier variable)
            => "nonempty ``variable.key``"->NonemptyCondition(variable.item);
    
    shared String->NonemptyCondition nonemptyCollectionCondition = constructI(identifier.collectionLIdentifier);
    shared String->NonemptyCondition nonemptyFirstRestSpecifyCondition = constructP(tuplePattern.firstRestTuplePattern, specifier.processArgumentsSequenceSpecifier);
    
    compile = compileNonemptyCondition;
    fromCeylon = RedHatTransformer.transformNonemptyCondition;
    toCeylon = nonemptyConditionToCeylon;
    codes = [nonemptyCollectionCondition, nonemptyFirstRestSpecifyCondition];
}
