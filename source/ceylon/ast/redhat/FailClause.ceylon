import ceylon.ast.core {
    FailClause,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElseClause=ElseClause
    }
}

"Converts a RedHat AST [[ElseClause|JElseClause]] to a `ceylon.ast` [[FailClause]]."
shared FailClause failClauseToCeylon(JElseClause failClause, Anything(JNode, Node) update = noop) {
    assert (exists jBlock = failClause.block);
    "Must not be an “anonymous” block (as generated for an else-if clause)."
    assert (jBlock.mainToken exists);
    value result = FailClause(blockToCeylon(jBlock, update));
    update(failClause, result);
    return result;
}

"Parses the given [[code]] for a Fail Clause
 into a [[FailClause]] using the Ceylon compiler
 (more specifically, the rule for a `failBlock`)."
shared FailClause? parseFailClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jFailBlock = createParser(code).failBlock()) {
        return failClauseToCeylon(jFailBlock, update);
    } else {
        return null;
    }
}
