import ceylon.ast.core {
    ComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    comprehensionClauseToCeylon,
    compileComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehensionClause=ComprehensionClause
    }
}

shared object comprehensionClause satisfies AbstractTest<ComprehensionClause,JComprehensionClause> {
    compile = compileComprehensionClause;
    fromCeylon = RedHatTransformer.transformComprehensionClause;
    toCeylon = comprehensionClauseToCeylon;
    
    tests = [expressionComprehensionClause];
}
