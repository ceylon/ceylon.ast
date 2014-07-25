import ceylon.ast.core {
    Bound
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBound=Bound,
        JClosedBound=ClosedBound,
        JOpenBound=OpenBound
    }
}

"Converts a RedHat AST [[Bound|JBound]] to a `ceylon.ast` [[Bound]]."
shared Bound boundToCeylon(JBound bound) {
    assert (is JOpenBound|JClosedBound bound);
    switch (bound)
    case (is JOpenBound) { return openBoundToCeylon(bound); }
    case (is JClosedBound) { return closedBoundToCeylon(bound); }
}
