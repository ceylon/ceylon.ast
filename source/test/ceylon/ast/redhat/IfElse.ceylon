import ceylon.ast.core {
    ElseClause,
    IfClause,
    IfElse
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifElseToCeylon,
    parseIfElse
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfStatement=IfStatement
    }
}

shared object ifElse satisfies ConcreteTest<IfElse,JIfStatement> {
    
    String->IfElse construct(String->IfClause ifClause, <String->ElseClause>? elseClause = null)
            => "``ifClause.key```` elseClause?.key else "" ``"->IfElse(ifClause.item, elseClause?.item);
    
    shared String->IfElse emptyIf => construct(ifClause.emptyIfClause);
    shared String->IfElse emptyIfElse => construct(ifClause.emptyIfClause, elseClause.emptyElseClause);
    shared String->IfElse emptyIfElseIf => construct(ifClause.emptyIfClause, elseClause.emptyElseIfClause);
    
    parse = parseIfElse;
    fromCeylon = RedHatTransformer.transformIfElse;
    toCeylon = ifElseToCeylon;
    codes => [emptyIf, emptyIfElse, emptyIfElseIf];
}
