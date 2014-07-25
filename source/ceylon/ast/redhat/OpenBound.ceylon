import ceylon.ast.core {
    OpenBound,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOpenBound=OpenBound
    }
}

"Converts a RedHat AST [[OpenBound|JOpenBound]] to a `ceylon.ast` [[OpenBound]]."
shared OpenBound openBoundToCeylon(JOpenBound openBound) {
    "Check precedence"
    assert (is Precedence10Expression endpoint = expressionToCeylon(openBound.term));
    return OpenBound(endpoint);
}
