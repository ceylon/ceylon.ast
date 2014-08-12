import ceylon.ast.core {
    Block,
    ConditionList,
    IfClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifClauseToCeylon,
    compileIfClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfClause=IfClause
    }
}

shared object ifClause satisfies ConcreteTest<IfClause,JIfClause> {
    
    String->IfClause construct(String->ConditionList conditions, String->Block block)
            => "if``conditions.key````block.key``"->IfClause(conditions.item, block.item);
    
    shared String->IfClause emptyIfClause = construct(conditionList.trueCommaAAndBConditionList, block.emptyBlock);
    
    compile = compileIfClause;
    fromCeylon = RedHatTransformer.transformIfClause;
    toCeylon = ifClauseToCeylon;
    codes = [emptyIfClause];
}
