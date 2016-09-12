import ceylon.ast.core {
    Condition,
    Conditions
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionsToCeylon,
    parseConditions
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConditionList=ConditionList
    }
}

shared object conditions satisfies ConcreteTest<Conditions,JConditionList> {
    
    String->Conditions construct(<String->Condition>+ conditions)
            => "(``",".join(conditions*.key)``)"->Conditions(conditions*.item);
    
    // not very useful, but at the time of writing no other types of conditions have been implemented yet:
    shared String->Conditions trueCommaAAndBConditions = construct(booleanCondition.trueCondition, booleanCondition.aAndBCondition);
    
    // not tested directly, but used by other tests
    shared String->Conditions trueConditions = construct(booleanCondition.trueCondition);
    
    parse = parseConditions;
    fromCeylon = RedHatTransformer.transformConditions;
    toCeylon = conditionsToCeylon;
    codes = [trueCommaAAndBConditions];
}
