import ceylon.ast.core {
    Block,
    Conditions,
    IfClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifClauseToCeylon,
    parseIfClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfClause=IfClause
    }
}

shared object ifClause satisfies ConcreteTest<IfClause,JIfClause> {
    
    String->IfClause construct(String->Conditions conditions, String->Block block)
            => "if``conditions.key````block.key``"->IfClause(conditions.item, block.item);
    
    shared String->IfClause emptyIfClause = construct(conditions.trueCommaAAndBConditions, block.emptyBlock);
    
    parse = parseIfClause;
    fromCeylon = RedHatTransformer.transformIfClause;
    toCeylon = ifClauseToCeylon;
    codes = [emptyIfClause];
}
