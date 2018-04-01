import ceylon.ast.core {
    ComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    comprehensionClauseToCeylon,
    parseComprehensionClause
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehensionClause=ComprehensionClause
    }
}

shared object comprehensionClause satisfies AbstractTest<ComprehensionClause,JComprehensionClause> {
    parse = parseComprehensionClause;
    fromCeylon = RedHatTransformer.transformComprehensionClause;
    toCeylon = comprehensionClauseToCeylon;
    
    tests = [expressionComprehensionClause];
}
