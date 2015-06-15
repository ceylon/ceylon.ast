import ceylon.ast.core {
    IfClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfClause=IfClause
    }
}

"Converts a RedHat AST [[IfClause|JIfClause]] to a `ceylon.ast` [[IfClause]]."
shared IfClause ifClauseToCeylon(JIfClause ifClause, Anything(JNode,Node) update = noop) {
    value result = IfClause(conditionsToCeylon(ifClause.conditionList, update), blockToCeylon(ifClause.block, update));
    update(ifClause, result);
    return result;
}

"Compiles the given [[code]] for an If Clause
 into an [[IfClause]] using the Ceylon compiler
 (more specifically, the rule for an `ifBlock`)."
shared IfClause? compileIfClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jIfBlock = createParser(code).ifBlock()) {
        return ifClauseToCeylon(jIfBlock, update);
    } else {
        return null;
    }
}
