import ceylon.ast.core {
    FinallyClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFinallyClause=FinallyClause
    }
}

"Converts a RedHat AST [[FinallyClause|JFinallyClause]] to a `ceylon.ast` [[FinallyClause]]."
shared FinallyClause finallyClauseToCeylon(JFinallyClause finallyClause, Anything(JNode, Node) update = noop) {
    value result = FinallyClause(blockToCeylon(finallyClause.block, update));
    update(finallyClause, result);
    return result;
}

"Parses the given [[code]] for a Finally Clause
 into a [[FinallyClause]] using the Ceylon compiler
 (more specifically, the rule for a `finallyBlock`)."
shared FinallyClause? parseFinallyClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jFinallyBlock = createParser(code).finallyBlock()) {
        return finallyClauseToCeylon(jFinallyBlock, update);
    } else {
        return null;
    }
}
