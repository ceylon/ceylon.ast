import ceylon.ast.core {
    MultiplyingExpression,
    Node,
    RemainderOperation,
    UnioningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JRemainderOp=RemainderOp
    }
}

"Converts a RedHat AST [[RemainderOp|JRemainderOp]] to a `ceylon.ast` [[RemainderOperation]]."
shared RemainderOperation remainderOperationToCeylon(JRemainderOp remainderOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(remainderOperation.leftTerm, update),
        is UnioningExpression right = expressionToCeylon(remainderOperation.rightTerm, update));
    value result = RemainderOperation(left, right);
    update(remainderOperation, result);
    return result;
}

"Parses the given [[code]] for a Remainder Operation
 into a [[RemainderOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared RemainderOperation? parseRemainderOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JRemainderOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return remainderOperationToCeylon(jMultiplicativeExpression, update);
    } else {
        return null;
    }
}
