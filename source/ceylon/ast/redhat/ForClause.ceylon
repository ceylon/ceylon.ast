import ceylon.ast.core {
    ForClause,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JForClause=ForClause
    }
}

"Converts a RedHat AST [[ForClause|JForClause]] to a `ceylon.ast` [[ForClause]]."
shared ForClause forClauseToCeylon(JForClause forClause, Anything(JNode, Node) update = noop) {
    value result = ForClause(forIteratorToCeylon(forClause.forIterator, update), blockToCeylon(forClause.block, update));
    update(forClause, result);
    return result;
}

"Parses the given [[code]] for a ‘`for`’ Clause
 into a [[ForClause]] using the Ceylon compiler
 (more specifically, the rule for a `forBlock`)."
shared ForClause? parseForClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jForBlock = createParser(code).forBlock()) {
        return forClauseToCeylon(jForBlock, update);
    } else {
        return null;
    }
}
