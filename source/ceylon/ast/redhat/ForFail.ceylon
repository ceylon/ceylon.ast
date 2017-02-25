import ceylon.ast.core {
    FailClause,
    ForFail,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JForStatement=ForStatement
    }
}

"Converts a RedHat AST [[ForStatement|JForStatement]] to a `ceylon.ast` [[ForFail]]."
shared ForFail forFailToCeylon(JForStatement forFail, Anything(JNode, Node) update = noop) {
    FailClause? failClause;
    if (exists jElseClause = forFail.elseClause) {
        failClause = failClauseToCeylon(jElseClause, update);
    } else {
        failClause = null;
    }
    value result = ForFail(forClauseToCeylon(forFail.forClause, update), failClause);
    update(forFail, result);
    return result;
}

"Parses the given [[code]] for a ‘`for`’ loop
 into a [[ForFail]] using the Ceylon compiler
 (more specifically, the rule for a `forElse`)."
shared ForFail? parseForFail(String code, Anything(JNode, Node) update = noop) {
    if (exists jForElse = createParser(code).forElse()) {
        return forFailToCeylon(jForElse, update);
    } else {
        return null;
    }
}
