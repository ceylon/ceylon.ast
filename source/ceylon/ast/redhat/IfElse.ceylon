import ceylon.ast.core {
    IfElse,
    ElseClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfStatement=IfStatement
    }
}

"Converts a RedHat AST [[IfStatement|JIfStatement]] to a `ceylon.ast` [[IfElse]]."
shared IfElse ifElseToCeylon(JIfStatement ifElse, Anything(JNode,Node) update = noop) {
    ElseClause? elseClause;
    if (exists jElseClause = ifElse.elseClause) {
        elseClause = elseClauseToCeylon(jElseClause, update);
    } else {
        elseClause = null;
    }
    value result = IfElse(ifClauseToCeylon(ifElse.ifClause, update), elseClause);
    update(ifElse, result);
    return result;
}

"Parses the given [[code]] for an If Else
 into an [[IfElse]] using the Ceylon compiler
 (more specifically, the rule for an `ifElse`)."
shared IfElse? parseIfElse(String code, Anything(JNode,Node) update = noop) {
    if (exists jIfElse = createParser(code).ifElse()) {
        return ifElseToCeylon(jIfElse, update);
    } else {
        return null;
    }
}
