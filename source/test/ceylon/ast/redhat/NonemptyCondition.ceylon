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
    parseNonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonemptyCondition=NonemptyCondition
    }
}

shared object nonemptyCondition satisfies ConcreteTest<NonemptyCondition,JNonemptyCondition> {
    
    String->NonemptyCondition constructP(String->Pattern pattern, String->Specifier specifier, Boolean negated = false)
            => "`` negated then "!" else "" ``nonempty ``pattern.key`` ``specifier.key``"->NonemptyCondition(SpecifiedPattern(pattern.item, specifier.item), negated);
    
    String->NonemptyCondition constructI(String->LIdentifier variable, Boolean negated = false)
            => "`` negated then "!" else "" ``nonempty ``variable.key``"->NonemptyCondition(variable.item, negated);
    
    shared String->NonemptyCondition negatedNonemptyCollectionCondition = constructI(identifier.collectionLIdentifier, true);
    shared String->NonemptyCondition nonemptyFirstRestSpecifyCondition = constructP(tuplePattern.firstRestTuplePattern, specifier.processArgumentsSequenceSpecifier);
    
    parse = parseNonemptyCondition;
    fromCeylon = RedHatTransformer.transformNonemptyCondition;
    toCeylon = nonemptyConditionToCeylon;
    codes = [negatedNonemptyCollectionCondition, nonemptyFirstRestSpecifyCondition];
}
