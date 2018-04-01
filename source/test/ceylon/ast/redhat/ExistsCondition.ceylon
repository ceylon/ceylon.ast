import ceylon.ast.core {
    ExistsCondition,
    LIdentifier,
    Pattern,
    SpecifiedPattern,
    Specifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    existsConditionToCeylon,
    parseExistsCondition
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition
    }
}

shared object existsCondition satisfies ConcreteTest<ExistsCondition,JExistsCondition> {
    
    String->ExistsCondition constructP(String->Pattern pattern, String->Specifier specifier, Boolean negated = false)
            => "`` negated then "!" else "" ``exists ``pattern.key`` ``specifier.key``" -> ExistsCondition(SpecifiedPattern(pattern.item, specifier.item), negated);
    
    String->ExistsCondition constructI(String->LIdentifier variable, Boolean negated = false)
            => "`` negated then "!" else "" ``exists ``variable.key``" -> ExistsCondition(variable.item, negated);
    
    shared String->ExistsCondition negatedExistsCeylonCondition = constructI(identifier.ceylonLIdentifier, true);
    shared String->ExistsCondition existsFirstSpecifyCondition = constructP(variablePattern.firstVariablePattern, specifier.processArgumentsFirstSpecifier);
    shared String->ExistsCondition existsFirstRestSpecifyCondition = constructP(tuplePattern.firstRestTuplePattern, specifier.processArgumentsSequenceSpecifier);
    shared String->ExistsCondition existsEntryPatternSpecifyCondition = constructP(entryPattern.eToStringLineEntryPattern, specifier._0Specifier);
    
    parse = parseExistsCondition;
    fromCeylon = RedHatTransformer.transformExistsCondition;
    toCeylon = existsConditionToCeylon;
    codes = [negatedExistsCeylonCondition, existsFirstSpecifyCondition, existsFirstRestSpecifyCondition, existsEntryPatternSpecifyCondition];
}
