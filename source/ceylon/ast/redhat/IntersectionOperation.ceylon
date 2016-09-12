import ceylon.ast.core {
    IntersectionOperation,
    InvertingExpression,
    IntersectingExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIntersectionOp=IntersectionOp
    }
}

"Converts a RedHat AST [[IntersectionOp|JIntersectionOp]] to a `ceylon.ast` [[IntersectionOperation]]."
shared IntersectionOperation intersectionOperationToCeylon(JIntersectionOp intersectionOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is IntersectingExpression left = expressionToCeylon(intersectionOperation.leftTerm, update),
        is InvertingExpression right = expressionToCeylon(intersectionOperation.rightTerm, update));
    value result = IntersectionOperation(left, right);
    update(intersectionOperation, result);
    return result;
}

"Parses the given [[code]] for an Intersection Operation
 into an [[IntersectionOperation]] using the Ceylon compiler
 (more specifically, the rule for an `intersectionExpression`)."
shared IntersectionOperation? parseIntersectionOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JIntersectionOp jIntersectionOperation = createParser(code).intersectionExpression()) {
        return intersectionOperationToCeylon(jIntersectionOperation, update);
    } else {
        return null;
    }
}
