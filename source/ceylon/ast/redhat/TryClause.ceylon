import ceylon.ast.core {
    Node,
    Resources,
    TryClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTryClause=TryClause
    }
}

"Converts a RedHat AST [[TryClause|JTryClause]] to a `ceylon.ast` [[TryClause]]."
shared TryClause tryClauseToCeylon(JTryClause tryClause, Anything(JNode,Node) update = noop) {
    Resources? resources;
    if (exists jResourceList = tryClause.resourceList) {
        resources = resourcesToCeylon(jResourceList, update);
    } else {
        resources = null;
    }
    value result = TryClause(blockToCeylon(tryClause.block, update), resources);
    update(tryClause, result);
    return result;
}

"Parses the given [[code]] for a Try Clause
 into a [[TryClause]] using the Ceylon compiler
 (more specifically, the rule for a `tryBlock`)."
shared TryClause? parseTryClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jTryBlock = createParser(code).tryBlock()) {
        return tryClauseToCeylon(jTryBlock, update);
    } else {
        return null;
    }
}
