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
    compileExistsCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition
    }
}

shared object existsCondition satisfies ConcreteTest<ExistsCondition,JExistsCondition> {
    
    String->ExistsCondition constructP(String->Pattern pattern, String->Specifier specifier)
            => "exists ``pattern.key`` ``specifier.key``"->ExistsCondition(SpecifiedPattern(pattern.item, specifier.item));
    
    String->ExistsCondition constructI(String->LIdentifier variable)
            => "exists ``variable.key``"->ExistsCondition(variable.item);
    
    shared String->ExistsCondition existsCeylonCondition = constructI(identifier.ceylonLIdentifier);
    shared String->ExistsCondition existsFirstSpecifyCondition = constructP(variablePattern.firstVariablePattern, specifier.processArgumentsFirstSpecifier);
    shared String->ExistsCondition existsFirstRestSpecifyCondition = constructP(tuplePattern.firstRestTuplePattern, specifier.processArgumentsSequenceSpecifier);
    shared String->ExistsCondition existsEntryPatternSpecifyCondition = constructP(entryPattern.eToStringLineEntryPattern, specifier._0Specifier);
    
    compile = compileExistsCondition;
    fromCeylon = RedHatTransformer.transformExistsCondition;
    toCeylon = existsConditionToCeylon;
    codes = [existsCeylonCondition, existsFirstSpecifyCondition, existsFirstRestSpecifyCondition, existsEntryPatternSpecifyCondition];
}
