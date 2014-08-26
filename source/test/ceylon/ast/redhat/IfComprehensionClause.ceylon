import ceylon.ast.core {
    ComprehensionClause,
    ConditionList,
    IfComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifComprehensionClauseToCeylon,
    compileIfComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfComprehensionClause=IfComprehensionClause
    }
}

shared object ifComprehensionClause satisfies ConcreteTest<IfComprehensionClause,JIfComprehensionClause> {
    
    String->IfComprehensionClause construct(String->ConditionList conditions, String->ComprehensionClause clause)
            => "if ``conditions.key`` ``clause.key``"->IfComprehensionClause(conditions.item, clause.item);
    
    shared String->IfComprehensionClause ifTrueCommaAAndBThenIComprehensionClause = construct(conditionList.trueCommaAAndBConditionList, expressionComprehensionClause.iExpressionComprehensionClause);
    // TODO better tests
    
    compile = compileIfComprehensionClause;
    fromCeylon = RedHatTransformer.transformIfComprehensionClause;
    toCeylon = ifComprehensionClauseToCeylon;
    codes = [ifTrueCommaAAndBThenIComprehensionClause];
}
