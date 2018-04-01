import ceylon.ast.core {
    InitialComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    initialComprehensionClauseToCeylon,
    parseInitialComprehensionClause
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JInitialComprehensionClause=InitialComprehensionClause
    }
}

shared object initialComprehensionClause satisfies AbstractTest<InitialComprehensionClause,JInitialComprehensionClause> {
    parse = parseInitialComprehensionClause;
    fromCeylon = RedHatTransformer.transformInitialComprehensionClause;
    toCeylon = initialComprehensionClauseToCeylon;
    
    tests = [forComprehensionClause, ifComprehensionClause];
}
