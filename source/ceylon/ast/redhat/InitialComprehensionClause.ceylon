import ceylon.ast.core {
    InitialComprehensionClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JForComprehensionClause=ForComprehensionClause,
        JIfComprehensionClause=IfComprehensionClause,
        JInitialComprehensionClause=InitialComprehensionClause
    }
}

"Converts a RedHat AST [[InitialComprehensionClause|JInitialComprehensionClause]] to a `ceylon.ast` [[InitialComprehensionClause]]."
shared InitialComprehensionClause initialComprehensionClauseToCeylon(JInitialComprehensionClause initialComprehensionClause, Anything(JNode, Node) update = noop) {
    assert (is JForComprehensionClause|JIfComprehensionClause initialComprehensionClause);
    switch (initialComprehensionClause)
    case (is JForComprehensionClause) { return forComprehensionClauseToCeylon(initialComprehensionClause, update); }
    case (is JIfComprehensionClause) { return ifComprehensionClauseToCeylon(initialComprehensionClause, update); }
}

"Parses the given [[code]] for an Initial Comprehension Clause
 into an [[InitialComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `initialComprehensionClause`)."
shared InitialComprehensionClause? parseInitialComprehensionClause(String code, Anything(JNode, Node) update = noop) {
    if (is JInitialComprehensionClause jComprehensionClause = createParser(code).comprehensionClause()) {
        return initialComprehensionClauseToCeylon(jComprehensionClause, update);
    } else {
        return null;
    }
}
