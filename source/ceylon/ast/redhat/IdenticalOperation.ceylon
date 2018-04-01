import ceylon.ast.core {
    IdenticalOperation,
    ComparingExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIdenticalOp=IdenticalOp
    }
}

"Converts a RedHat AST [[IdenticalOp|JIdenticalOp]] to a `ceylon.ast` [[IdenticalOperation]]."
shared IdenticalOperation identicalOperationToCeylon(JIdenticalOp identicalOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ComparingExpression left = expressionToCeylon(identicalOperation.leftTerm, update),
        is ComparingExpression right = expressionToCeylon(identicalOperation.rightTerm, update));
    value result = IdenticalOperation(left, right);
    update(identicalOperation, result);
    return result;
}

"Parses the given [[code]] for an Identical Operation
 into an [[IdenticalOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared IdenticalOperation? parseIdenticalOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JIdenticalOp jEqualityExpression = createParser(code).equalityExpression()) {
        return identicalOperationToCeylon(jEqualityExpression, update);
    } else {
        return null;
    }
}
