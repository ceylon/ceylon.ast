import ceylon.ast.core {
    Resources,
    TryClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTryClause=TryClause
    }
}

"Converts a RedHat AST [[TryClause|JTryClause]] to a `ceylon.ast` [[TryClause]]."
shared TryClause tryClauseToCeylon(JTryClause tryClause) {
    Resources? resources;
    if (exists jResourceList = tryClause.resourceList) {
        resources = resourcesToCeylon(jResourceList);
    } else {
        resources = null;
    }
    return TryClause(blockToCeylon(tryClause.block), resources);
}

"Compiles the given [[code]] for a Try Clause
 into a [[TryClause]] using the Ceylon compiler
 (more specifically, the rule for a `tryBlock`)."
shared TryClause? compileTryClause(String code) {
    if (exists jTryBlock = createParser(code).tryBlock()) {
        return tryClauseToCeylon(jTryBlock);
    } else {
        return null;
    }
}
