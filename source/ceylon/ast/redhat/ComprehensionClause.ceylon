import ceylon.ast.core {
    ComprehensionClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JComprehensionClause=ComprehensionClause,
        JExpressionComprehensionClause=ExpressionComprehensionClause,
        JInitialComprehensionClause=InitialComprehensionClause
    }
}

"Converts a RedHat AST [[ComprehensionClause|JComprehensionClause]] to a `ceylon.ast` [[ComprehensionClause]]."
shared ComprehensionClause comprehensionClauseToCeylon(JComprehensionClause comprehensionClause, Anything(JNode,Node) update = noop) {
    assert (is JInitialComprehensionClause|JExpressionComprehensionClause comprehensionClause);
    switch (comprehensionClause)
    case (is JInitialComprehensionClause) { return initialComprehensionClauseToCeylon(comprehensionClause, update); }
    case (is JExpressionComprehensionClause) { return expressionComprehensionClauseToCeylon(comprehensionClause, update); }
}

"Compiles the given [[code]] for a Comprehension Clause
 into a [[ComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for a `comprehensionClause`)."
shared ComprehensionClause? compileComprehensionClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jComprehensionClause = createParser(code).comprehensionClause()) {
        return comprehensionClauseToCeylon(jComprehensionClause, update);
    } else {
        return null;
    }
}
