import ceylon.ast.core {
    IntersectingExpression,
    Node,
    UnioningExpression,
    UnionOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JUnionOp=UnionOp
    }
}

"Converts a RedHat AST [[UnionOp|JUnionOp]] to a `ceylon.ast` [[UnionOperation]]."
shared UnionOperation unionOperationToCeylon(JUnionOp unionOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is UnioningExpression left = expressionToCeylon(unionOperation.leftTerm, update),
        is IntersectingExpression right = expressionToCeylon(unionOperation.rightTerm, update));
    value result = UnionOperation(left, right);
    update(unionOperation, result);
    return result;
}

"Parses the given [[code]] for a Union Operation
 into an [[UnionOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared UnionOperation? parseUnionOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JUnionOp jUnionExpression = createParser(code).unionExpression()) {
        return unionOperationToCeylon(jUnionExpression, update);
    } else {
        return null;
    }
}
