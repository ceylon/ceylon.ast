import ceylon.ast.core {
    OpenBound,
    ExistsNonemptyExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOpenBound=OpenBound
    }
}

"Converts a RedHat AST [[OpenBound|JOpenBound]] to a `ceylon.ast` [[OpenBound]]."
shared OpenBound openBoundToCeylon(JOpenBound openBound) {
    "Check precedence"
    assert (is ExistsNonemptyExpression endpoint = expressionToCeylon(openBound.term));
    return OpenBound(endpoint);
}
