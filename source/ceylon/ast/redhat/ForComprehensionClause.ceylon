import ceylon.ast.core {
    ForComprehensionClause,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JForComprehensionClause=ForComprehensionClause
    }
}

"Converts a RedHat AST [[ForComprehensionClause|JForComprehensionClause]] to a `ceylon.ast` [[ForComprehensionClause]]."
shared ForComprehensionClause forComprehensionClauseToCeylon(JForComprehensionClause forComprehensionClause, Anything(JNode, Node) update = noop) {
    value result = ForComprehensionClause(forIteratorToCeylon(forComprehensionClause.forIterator, update), comprehensionClauseToCeylon(forComprehensionClause.comprehensionClause, update));
    update(forComprehensionClause, result);
    return result;
}

"Parses the given [[code]] for a For Comprehension Clause
 into a [[ForComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for a `forComprehensionClause`)."
shared ForComprehensionClause? parseForComprehensionClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jForComprehensionClause = createParser(code).forComprehensionClause()) {
        return forComprehensionClauseToCeylon(jForComprehensionClause, update);
    } else {
        return null;
    }
}
