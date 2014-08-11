import ceylon.ast.core {
    Condition,
    ConditionList
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionListToCeylon,
    compileConditionList
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConditionList=ConditionList
    }
}

shared object conditionList satisfies ConcreteTest<ConditionList,JConditionList> {
    
    String->ConditionList construct(<String->Condition>+ conditions)
            => "(``",".join(conditions*.key)``)"->ConditionList(conditions*.item);
    
    // not very useful, but at the time of writing no other types of conditions have been implemented yet:
    shared String->ConditionList trueCommaAAndBConditionList = construct(booleanCondition.trueCondition, booleanCondition.aAndBCondition);
    
    compile = compileConditionList;
    fromCeylon = RedHatTransformer.transformConditionList;
    toCeylon = conditionListToCeylon;
    codes = [trueCommaAAndBConditionList];
}
