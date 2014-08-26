import ceylon.ast.core {
    InitialComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForComprehensionClause=ForComprehensionClause,
        JIfComprehensionClause=IfComprehensionClause,
        JInitialComprehensionClause=InitialComprehensionClause
    }
}

"Converts a RedHat AST [[InitialComprehensionClause|JInitialComprehensionClause]] to a `ceylon.ast` [[InitialComprehensionClause]]."
shared InitialComprehensionClause initialComprehensionClauseToCeylon(JInitialComprehensionClause initialComprehensionClause) {
    assert (is JForComprehensionClause|JIfComprehensionClause initialComprehensionClause);
    switch (initialComprehensionClause)
    case (is JForComprehensionClause) { return forComprehensionClauseToCeylon(initialComprehensionClause); }
    case (is JIfComprehensionClause) { return ifComprehensionClauseToCeylon(initialComprehensionClause); }
}

"Compiles the given [[code]] for an Initial Comprehension Clause
 into an [[InitialComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `initialComprehensionClause`)."
shared InitialComprehensionClause? compileInitialComprehensionClause(String code) {
    if (is JInitialComprehensionClause jComprehensionClause = createParser(code).comprehensionClause()) {
        return initialComprehensionClauseToCeylon(jComprehensionClause);
    } else {
        return null;
    }
}
