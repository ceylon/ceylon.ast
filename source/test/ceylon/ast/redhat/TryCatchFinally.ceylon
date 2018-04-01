import ceylon.ast.core {
    CatchClause,
    FinallyClause,
    TryCatchFinally,
    TryClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tryCatchFinallyToCeylon,
    parseTryCatchFinally
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTryCatchStatement=TryCatchStatement
    }
}

shared object tryCatchFinally satisfies ConcreteTest<TryCatchFinally,JTryCatchStatement> {
    
    String->TryCatchFinally construct(String->TryClause tryClause, <String->CatchClause>[] catchClauses = [], <String->FinallyClause>? finallyClause = null)
            => "``tryClause.key````"".join(catchClauses*.key)```` finallyClause?.key else "" ``" -> TryCatchFinally(tryClause.item, catchClauses*.item, finallyClause?.item);
    
    shared String->TryCatchFinally uselessTryCatchFinally = construct(tryClause.tryTwoResourcesDoNothingClause, [catchClause.catchEDoNothingClause], finallyClause.printHelloWorldFinallyClause);
    // meaningful examples are hard and involved, leave me alone
    
    parse = parseTryCatchFinally;
    fromCeylon = RedHatTransformer.transformTryCatchFinally;
    toCeylon = tryCatchFinallyToCeylon;
    codes = [uselessTryCatchFinally];
}
