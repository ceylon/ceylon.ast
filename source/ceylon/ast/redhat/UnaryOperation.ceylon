import ceylon.ast.core {
    Node,
    UnaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

"Converts a RedHat AST [[UnaryOperatorExpression|JUnaryOperatorExpression]] to a `ceylon.ast` [[UnaryOperation]]."
shared UnaryOperation unaryOperationToCeylon(JUnaryOperatorExpression unaryOperatorExpression, Anything(JNode, Node) update = noop) {
    assert (is UnaryOperation unaryOperation = unaryIshOperationToCeylon(unaryOperatorExpression, update));
    value result = unaryOperation;
    update(unaryOperatorExpression, result);
    return result;
}

"Parses the given [[code]] for a Unary Operation
 into a [[UnaryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared UnaryOperation? parseUnaryOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JUnaryOperatorExpression jUnaryExpression = createParser(code).assignmentExpression()) {
        return unaryOperationToCeylon(jUnaryExpression, update);
    } else {
        return null;
    }
}
