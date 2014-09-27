import ceylon.ast.core {
    ClosedBound,
    ExistsNonemptyExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClosedBound=ClosedBound
    }
}

"Converts a RedHat AST [[ClosedBound|JClosedBound]] to a `ceylon.ast` [[ClosedBound]]."
shared ClosedBound closedBoundToCeylon(JClosedBound closedBound) {
    "Check precedence"
    assert (is ExistsNonemptyExpression endpoint = expressionToCeylon(closedBound.term));
    return ClosedBound(endpoint);
}
