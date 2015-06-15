import ceylon.ast.core {
    ExistsNonemptyExpression,
    Node,
    OpenBound
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JOpenBound=OpenBound
    }
}

"Converts a RedHat AST [[OpenBound|JOpenBound]] to a `ceylon.ast` [[OpenBound]]."
shared OpenBound openBoundToCeylon(JOpenBound openBound, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression endpoint = expressionToCeylon(openBound.term, update));
    value result = OpenBound(endpoint);
    update(openBound, result);
    return result;
}
