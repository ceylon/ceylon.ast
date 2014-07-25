import ceylon.ast.core {
    ClosedBound,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClosedBound=ClosedBound
    }
}

"Converts a RedHat AST [[ClosedBound|JClosedBound]] to a `ceylon.ast` [[ClosedBound]]."
shared ClosedBound closedBoundToCeylon(JClosedBound closedBound) {
    "Check precedence"
    assert (is Precedence10Expression endpoint = expressionToCeylon(closedBound.term));
    return ClosedBound(endpoint);
}
