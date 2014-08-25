import ceylon.ast.core {
    ComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehensionClause=ComprehensionClause,
        JExpressionComprehensionClause=ExpressionComprehensionClause,
        JInitialComprehensionClause=InitialComprehensionClause
    }
}

"Converts a RedHat AST [[ComprehensionClause|JComprehensionClause]] to a `ceylon.ast` [[ComprehensionClause]]."
shared ComprehensionClause comprehensionClauseToCeylon(JComprehensionClause comprehensionClause) {
    assert (is JInitialComprehensionClause|JExpressionComprehensionClause comprehensionClause);
    switch (comprehensionClause)
    case (is JInitialComprehensionClause) {
        // TODO implement initial comprehension clauses
        throw AssertionError("Initial comprehension clauses are not yet implemented!");
    }
    case (is JExpressionComprehensionClause) { return expressionComprehensionClauseToCeylon(comprehensionClause); }
}

"Compiles the given [[code]] for a Comprehension Clause
 into a [[ComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for a `comprehensionClause`)."
shared ComprehensionClause? compileComprehensionClause(String code) {
    if (exists jComprehensionClause = createParser(code).comprehensionClause()) {
        return comprehensionClauseToCeylon(jComprehensionClause);
    } else {
        return null;
    }
}
