import ceylon.ast.core {
    ElseClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElseClause=ElseClause,
        JIfStatement=IfStatement
    }
}

"Converts a RedHat AST [[ElseClause|JElseClause]] to a `ceylon.ast` [[ElseClause]]."
shared ElseClause elseClauseToCeylon(JElseClause elseClause, Anything(JNode,Node) update = noop) {
    ElseClause result;
    if (elseClause.block.mainToken exists) {
        // it’s a proper block
        result = ElseClause(blockToCeylon(elseClause.block, update));
    } else {
        // it’s an ‘else if’, but the AST doesn’t have that,
        // so the parser wraps it in a single-statement block
        // without a main token
        assert (elseClause.block.statements.size() == 1,
            is JIfStatement elseIf = elseClause.block.statements.get(0));
        result = ElseClause(ifElseToCeylon(elseIf, update));
    }
    update(elseClause, result);
    return result;
}

"Parses the given [[code]] for an Else Clause
 into an [[ElseClause]] using the Ceylon compiler
 (more specifically, the rule for an `elseBlock`)."
shared ElseClause? parseElseClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jElseBlock = createParser(code).elseBlock()) {
        return elseClauseToCeylon(jElseBlock, update);
    } else {
        return null;
    }
}
