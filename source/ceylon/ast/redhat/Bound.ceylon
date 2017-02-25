import ceylon.ast.core {
    Bound,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBound=Bound,
        JClosedBound=ClosedBound,
        JOpenBound=OpenBound
    }
}

"Converts a RedHat AST [[Bound|JBound]] to a `ceylon.ast` [[Bound]]."
shared Bound boundToCeylon(JBound bound, Anything(JNode, Node) update = noop) {
    assert (is JOpenBound|JClosedBound bound);
    switch (bound)
    case (is JOpenBound) { return openBoundToCeylon(bound, update); }
    case (is JClosedBound) { return closedBoundToCeylon(bound, update); }
}
