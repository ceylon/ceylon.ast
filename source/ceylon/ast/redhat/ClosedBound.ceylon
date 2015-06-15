import ceylon.ast.core {
    ClosedBound,
    ExistsNonemptyExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClosedBound=ClosedBound
    }
}

"Converts a RedHat AST [[ClosedBound|JClosedBound]] to a `ceylon.ast` [[ClosedBound]]."
shared ClosedBound closedBoundToCeylon(JClosedBound closedBound, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression endpoint = expressionToCeylon(closedBound.term, update));
    value result = ClosedBound(endpoint);
    update(closedBound, result);
    return result;
}
